const Rol = require('./../models/Rol');
const Usuario = require('../models/Usuario');

const UsuarioController = {
    get: async (req, res) => {
        try {
            if (!req.user) {
                throw { message: "Sesion invalida." };
            }
            if(!['admin'].includes(req.user.rol.id)) {
              throw { message: "Modulo exclusivo para admin." };
            }

            const rol_id = req.params.rol_id;
            let usuarios = [];

            if (rol_id) {
                usuarios = await Usuario.findAll({
                    where: { rol_id: rol_id },
                    attributes: ['id','cedula','nombre','correo','telefono','fecha_nacimiento','ruta_imagen'],
                    include: 'rol'
                });
            } else {
                usuarios = await Usuario.findAll({
                    attributes: ['id','cedula','nombre','correo','telefono','fecha_nacimiento','ruta_imagen'],
                    include: 'rol'
                });
            }

            /**
             * Fin
             */
            res.status(200).json({ message: 'ok', usuarios: usuarios });
        } catch (err) {
            console.error(err);
            res.status(400).json(err);
        }
    },
    add: async (req, res) => {
        try {
            if (!req.user) {
                throw { message: "Sesion invalida." };
            }

            throw { message: "En mantenimiento." };
        } catch (err) {
            console.error(err);
            res.status(400).json(err);
        }
    },
    update: async (req, res) => {
        try {
            if (!req.user) {
                throw { message: "Sesion invalida." };
            }
            
            throw { message: "En mantenimiento." };
        } catch (err) {
            console.error(err);
            res.status(400).json(err);
        }
    },
    delete: async (req, res) => {
        try {
            if (!req.user) {
                throw { message: "Sesion invalida." };
            }

            throw { message: "En mantenimiento." };
        } catch (err) {
            console.error(err);
            res.status(400).json(err);
        }
    },
};

module.exports = UsuarioController;