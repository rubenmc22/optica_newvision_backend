const Rol = require('./../models/Rol');
const Usuario = require('../models/Usuario');

const UsuarioController = {
    get: async (req, res) => {
        try {
            if (!req.user) {
                throw { message: "Sesion invalida." };
            }

            const cedula = req.params.cedula;
            let usuarios = [];

            if (cedula) {
                usuarios = await Usuario.findAll({
                    where: { cedula: cedula },
                    attributes: ['id','cedula','nombre','correo','telefono','fecha_nacimiento','ruta_imagen','avatar_url'],
                    include: ['rol','cargo']
                });
            } else {
                usuarios = await Usuario.findAll({
                    attributes: ['id','cedula','nombre','correo','telefono','fecha_nacimiento','ruta_imagen','avatar_url'],
                    include: ['rol','cargo']
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