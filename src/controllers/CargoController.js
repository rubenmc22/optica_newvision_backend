const Cargo = require('./../models/Cargo');

const CargoController = {
    get: async (req, res) => {
        try {
            if (!req.user) {
                throw { message: "Sesion invalida." };
            }

            const id = req.params.id;

            if (id) {
                cargos = await Cargo.findAll({
                    where: { id: id }
                });
            } else {
                cargos = await Cargo.findAll();
            }

            /**
             * Fin
             */
            res.status(200).json({ message: 'ok', cargos: cargos });
        } catch (err) {
            console.error(err);
            res.status(400).json(err);
        }
    },
};

module.exports = CargoController;