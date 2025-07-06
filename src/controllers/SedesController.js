const Sede = require('../models/Sede');

const SedesController = {
    get: async (req, res) => {
        try {
            const sedes = await Sede.findAll();
            
            res.status(200).json({ message: 'ok', sedes: sedes });
        } catch (err) {
            console.error(err);
            res.status(400).json(err);
        }
    },
};

module.exports = SedesController;