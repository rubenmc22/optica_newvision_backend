const Configuracion = require("../models/Configuracion");
const { v4: uuidv4 } = require('uuid');
const Paciente = require("../models/Paciente");
const Tasa = require("../models/Tasa");
const HistorialMedico = require("../models/HistorialMedico");
const Venta = require("../models/Venta");
const Producto = require("../models/Producto");
const VentaProducto = require("../models/VentaProducto");
const VentaPago = require("../models/VentaPago");
const VentaCasheaCuota = require("../models/VentaCasheaCuota");
const VentaCashea = require("../models/VentaCashea");
const VerificationUtils = require("../utils/VerificationUtils");

const VentaService = {
    async get_numero_control() {
        const objConf = await Configuracion.findOne({ where: { clave: "numero_control" } });
        return parseInt(objConf.valor);
    },

    async generate_venta_key() {
        let output = null;
        do {
            const venta_key = uuidv4();
            const count = await Venta.count({ where: { venta_key: venta_key } });
            if(count < 1) {
                output = venta_key;
            }
        } while (output === null);
        return output;
    },

    async get_paciente(paciente_id) {
        const objPaciente = await Paciente.findOne({ where: { pkey: paciente_id } });
        if (!objPaciente) {
            throw { message: `El paciente '${paciente_id}' no existe.` };
        }
        return objPaciente;
    },

    async get_tasa(tasa_id) {
        const objTasa = await Tasa.findOne({ where: { id: tasa_id } });
        if (!objTasa) {
            throw { message: `La moneda enviada no existe: ${tasa_id}` };
        }
        return objTasa;
    },

    validate_forma_pago(forma_pago) {
        if(['cashea', 'de_contado', 'por_abono'].includes(forma_pago) === false) {
            throw { message: `La forma de pago es invalida: ${forma_pago}` };
        }
    },

    validate_fecha(fecha) {
        if(!(fecha.trim() != "" && VerificationUtils.verify_fecha(fecha))) {
            throw { message: `La fecha es invalida: ${fecha}` };
        }
    },

    async get_historia_medica(historia_medica_id) {
        const objHistorial = await HistorialMedico.findOne({ where: { id: historia_medica_id } });
        if (!objHistorial) {
            throw { message: `El ID de la historia medica es invalida: ${historia_medica_id}` };
        }
        return objHistorial;
    },

    async add_producto_db(productos_array) {
        const output = [];
        for(let producto of productos_array) {
            const objProducto = await Producto.findOne({ where: { id: producto.id } });
            if (!objProducto) {
                throw { message: `El ID del producto es invalido: ${producto.id}` };
            }
            output.push({ ...producto, objeto: objProducto });
        }
        return output;
    },

    async prepare_productos_array(productos_array) {
        const output = [];
        for(let producto of productos_array) {
            output.push({
                producto_id: producto.id,
                cantidad: producto.cantidad,
                precio: producto.precio,
                precio_con_iva: producto.precioConIva,
                subtotal: producto.subtotal,
                total: producto.total,
                objeto: producto.objeto
            });
        }
        return output;
    },

    async prepare_metodos_de_pago_array(metodosDePago_array) {
        const output = [];
        for(let metodoDePago of metodosDePago_array) {
            output.push({
                tipo: metodoDePago.tipo,
                monto: metodoDePago.monto
            });
        }
        return output;
    },

    async guardar_venta(t, venta_completa) {
        await Venta.create({
            venta_key: venta_completa.venta_key,
            numero_control: venta_completa.numero_control,
            sede: venta_completa.sede,
            paciente_key: venta_completa.paciente_key,
            moneda: venta_completa.moneda,
            forma_pago: venta_completa.forma_pago,
            historia_medica_id: venta_completa.historia_medica_id,
            descuento: venta_completa.descuento,
            subtotal: venta_completa.subtotal,
            total_descuento: venta_completa.total_descuento,
            total: venta_completa.total,
            observaciones: venta_completa.observaciones,
            fecha: venta_completa.fecha,
            pago_completo: venta_completa.pago_completo,
            financiado: venta_completa.financiado,
            created_by: venta_completa.created_by,
            estatus_venta: venta_completa.estatus_venta,
            estatus_pago: venta_completa.estatus_pago
        }, { transaction: t });
        
        for(let producto of venta_completa.productos) {
            await VentaProducto.create({
                venta_key: venta_completa.venta_key,
                producto_id: producto.producto_id,
                cantidad: producto.cantidad,
                precio: producto.precio,
                precio_con_iva: producto.precio_con_iva,
                subtotal: producto.subtotal,
                total: producto.total
            }, { transaction: t });
        }

        for(let pago of venta_completa.pagos) {
            await VentaPago.create({
                venta_key: venta_completa.venta_key,
                tipo: pago.tipo,
                monto: pago.monto,
                created_by: venta_completa.created_by
            }, { transaction: t });
        }
        
        if(venta_completa.forma_pago === 'cashea') {
            await VentaCashea.create({
                venta_key: venta_completa.venta_key,
                nivel_cashea: venta_completa.cashea.nivel_cashea,
                monto_inicial: venta_completa.cashea.monto_inicial,
                cantidad_cuotas: venta_completa.cashea.cantidad_cuotas,
                monto_por_cuota: venta_completa.cashea.monto_por_cuota,
                total_adelantado: venta_completa.cashea.total_adelantado
            }, { transaction: t });

            for(let cuota of venta_completa.cashea_cuotas) {
                await VentaCasheaCuota.create({
                    venta_key: venta_completa.venta_key,
                    numero: cuota.numero,
                    monto: cuota.monto,
                    fecha_vencimiento: cuota.fecha_vencimiento
                }, { transaction: t });
            }
        }
    },

    async descontar_inventario(t, productos) {
        for(const producto of productos) {
            producto.objeto.stock -= producto.cantidad;
            producto.objeto.save({ transaction: t });
        }
    },

    async actualizar_numero_control(t, numero_control) {
        await Configuracion.update(
            { valor: numero_control.toString() },
            {
                where: { clave: "numero_control" },
                transaction: t
            }
        );
    },
};

module.exports = VentaService;