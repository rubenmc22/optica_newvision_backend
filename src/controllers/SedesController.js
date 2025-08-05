const Sede = require('../models/Sede');

const SedesController = {
    get: async (req, res) => {
        try {
            const sedes = await Sede.findAll();

            let sedes_output = [];
            for(const sede of sedes) {
                sedes_output.push({
                    key: sede.id,
                    nombre: sede.nombre
                });
            }
            
            res.status(200).json({ message: 'ok', sedes: sedes_output });
        } catch (err) {
            console.error(err);
            res.status(400).json(err);
        }
    },
};

module.exports = SedesController;