const Venta = require('./../models/Venta');

const VentaController = {
    get: async (req, res) => {
        try {
            if (!req.user) {
                throw { message: "Sesion invalida." };
            }

            const id = req.params.id;

            if (id) {
                roles = await Rol.findAll({
                    where: { id: id }
                });
            } else {
                roles = await Rol.findAll();
            }

            /**
             * Fin
             */
            res.status(200).json({ message: 'ok', roles: roles });
        } catch (err) {
            console.error(err);
            res.status(400).json(err);
        }
    },
};

module.exports = VentaController;