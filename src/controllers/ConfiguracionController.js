const Configuracion = require('../models/Configuracion');
const Sede = require('../models/Sede');
const Tasa = require('../models/Tasa');

const ConfiguracionController = {
    consultar_moneda_base: async (req, res) => {
        let moneda_base = await Configuracion.findOne({ where: { sede: req.sede.id, clave: 'moneda_base' } });
        if(!moneda_base) {
            moneda_base = await Configuracion.create({
                sede: req.sede.id,
                clave: 'moneda_base',
                valor: 'dolar',
                descripcion: 'Moneda base del sistema para la sede de ${req.sede.nombre}.'
            });
        }
        res.status(200).json({ moneda_base: moneda_base.valor });
    },

    modificar_moneda_base: async (req, res) => {
        const {
            monedaBase
        } = req.body;

        const objTasa = await Tasa.findOne({ where: { id: monedaBase } });
        if(!objTasa) {
            throw { message: `La tasa ${monedaBase} no existe.` };
        }
        
        let moneda_base = await Configuracion.findOne({ where: { sede: req.sede.id, clave: 'moneda_base' } });
        if(moneda_base) {
            moneda_base.valor = objTasa.id;
            await moneda_base.save();
        }
        else {
            moneda_base = await Configuracion.create({
                sede: req.sede.id,
                clave: 'moneda_base',
                valor: objTasa.id,
                descripcion: 'Moneda base del sistema para la sede de ${req.sede.nombre}.'
            });
        }
        
        res.status(200).json({ moneda_base: moneda_base.valor });
    },
};

module.exports = ConfiguracionController;
