const jwt = require('jsonwebtoken');
const Usuario = require('../models/Usuario');
const Rol = require('./../models/Rol');

const MiddlewareUtils = {
  get_data: async (token) => {
    const output = {userCedula: null, user: null, rol: null};

    /**
     * Desencriptamos el token
     */
    try {
      const decoded = jwt.verify(token, process.env.JWT_SECRET);
      output.userCedula = decoded.userCedula;
    } catch (err) {
      throw { message: 'Token inválido.' };
    }

    /**
     * Get user
     */
    try {
      const user = await Usuario.findOne({ where: { cedula: output.userCedula }, include: ['rol','cargo'] });
      if (!user) {
        throw "";
      }
      output.user = user;
    } catch (err) {
      throw { message: 'El usuario no existe.' };
    }

    /**
     * Return
     */
    return output;
  },
};

module.exports = MiddlewareUtils;