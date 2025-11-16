const { sequelize } = require('../config/db');
const VentaCashea = require('../models/VentaCashea');
const VentaCasheaCuota = require('../models/VentaCasheaCuota');
const VentaPago = require('../models/VentaPago');
const VentaProducto = require('../models/VentaProducto');
const VentaService = require('../services/VentaService');
const FormatUtils = require('../utils/FormatUtils');
const Venta = require('./../models/Venta');

const VentaController = {
    add: async (req, res) => {
        // const objVenta2 = await Venta.findOne({
        //     include: [
        //         { model: VentaPago, as: 'array_pagos' },
        //         { model: VentaProducto, as: 'array_productos' },
        //         { model: VentaCashea, as: 'datos_cashea' },
        //         { model: VentaCasheaCuota, as: 'cuotas_cashea' },
        //     ]
        // });
        // res.status(200).json({ message: 'ok', venta: objVenta2 });
        // return;




        const {
            sede, // Innecesario
            asesor, // Innecesario
            pagoCompleto, // Innecesario

            fecha,
            moneda,
            formaPago,
            descuento,
            observaciones,
            paciente: paciente_object,
            productos: productos_array,
            subtotal,
            totalDescuento,
            total,
            metodosDePago: metodosDePago_array,
            financiado,
            nivelCashea,
            montoInicial,
            cantidadCuotas,
            montoPorCuota,
            cuotasAdelantadas: cuotasAdelantadas_array,
            totalAdelantado,
            historiaMedicaId,
        } = req.body;

        const objPaciente = await VentaService.get_paciente(paciente_object.key);
        const objTasa = await VentaService.get_tasa(moneda);
        const objHistorial = await VentaService.get_historia_medica(historiaMedicaId);
        VentaService.validate_forma_pago(formaPago);
        VentaService.validate_fecha(fecha);
        const productos_array_db = await VentaService.add_producto_db(productos_array);

        const venta = {
            venta_key: await VentaService.generate_venta_key(),
            numero_control: await VentaService.get_numero_control(),
            sede: req.sede.id,
            paciente_key: objPaciente.pkey,
            moneda: objTasa.id,
            forma_pago: formaPago,
            historia_medica_id: objHistorial.id,
            descuento: FormatUtils.float(descuento),
            subtotal: FormatUtils.float(subtotal),
            total_descuento: FormatUtils.float(totalDescuento),
            total: FormatUtils.float(total),
            observaciones: observaciones,
            fecha: fecha,
            pago_completo: null,
            financiado: FormatUtils.boolean(financiado),
            created_by: req.user.cedula,
            estatus_venta: null,
            estatus_pago: null,
            productos: [],
            pagos: [],
            cashea: null,
            cashea_cuotas: null,
        };

        venta.productos = await VentaService.prepare_productos_array(productos_array_db);
        venta.pagos = await VentaService.prepare_metodos_de_pago_array(metodosDePago_array);
        
        if(venta.forma_pago === 'de_contado') {
            venta.pago_completo = true;
            venta.estatus_venta = 'completado';
            venta.estatus_pago = 'completado';
        }
        else if(venta.forma_pago === 'cashea') {
            venta.pago_completo = true;
            venta.estatus_venta = 'completado';
            venta.estatus_pago = 'pagado_por_cashea';
            venta.cashea = {
                nivel_cashea: nivelCashea,
                monto_inicial: montoInicial,
                cantidad_cuotas: cantidadCuotas,
                monto_por_cuota: montoPorCuota,
                total_adelantado: totalAdelantado
            };
            venta.cashea_cuotas = [];
            for(let cuota of cuotasAdelantadas_array) {
                venta.cashea_cuotas.push({
                    numero: cuota.numero,
                    monto: cuota.monto,
                    fecha_vencimiento: cuota.fechaVencimiento
                });
            }
        }
        else if(venta.forma_pago === 'por_abono') {
            venta.pago_completo = false;
            venta.estatus_venta = 'pendiente';
            venta.estatus_pago = 'pendiente';
        }
        else {
            throw { message: `La forma de pago es invalida: ${forma_pago}` };
        }

        const t = await sequelize.transaction();

        try {
            await VentaService.guardar_venta(t, venta);
            await VentaService.descontar_inventario(t, venta.productos);
            await VentaService.actualizar_numero_control(t, venta.numero_control + 1);
            await t.commit();
        }
        catch(error) {
            await t.rollback();
            throw { message: error.message || error.toString() };
        }

        const objVenta = await Venta.findOne({
            where: { venta_key: venta.venta_key },
            include: [
                { model: VentaPago, as: 'array_pagos' },
                { model: VentaProducto, as: 'array_productos' },
                { model: VentaCashea, as: 'datos_cashea' },
                { model: VentaCasheaCuota, as: 'cuotas_cashea' },
            ]
        });
        
        res.status(200).json({ message: 'ok', venta: objVenta });
    },
    
    get: async (req, res) => {
        res.status(200).json({ message: 'ok' });
    },
    
    anular: async (req, res) => {
        res.status(200).json({ message: 'ok' });
    },
    
    abonar: async (req, res) => {
        res.status(200).json({ message: 'ok' });
    },
    
    pago_cashea: async (req, res) => {
        res.status(200).json({ message: 'ok' });
    },
};

module.exports = VentaController;