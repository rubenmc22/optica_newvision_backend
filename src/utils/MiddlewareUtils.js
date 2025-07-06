const jwt = require('jsonwebtoken');
const Usuario = require('../models/Usuario');
const Rol = require('./../models/Rol');
const Sede = require('../models/Sede');

const MiddlewareUtils = {
  get_data: async (token) => {
    const output = {sede_id: null, sede: null, userCedula: null, user: null};

    /**
     * Desencriptamos el token
     */
    try {
      const decoded = jwt.verify(token, process.env.JWT_SECRET);
      output.sede_id = decoded.sede_id;
      output.userCedula = decoded.userCedula;
    } catch (err) {
      throw { message: 'Token inválido.' };
    }

    /**
     * Get user
     */
    try {
      const sede = await Sede.findOne({ where: { id: output.sede_id } });
      if (!sede) {
        throw "La sede no existe.";
      }
      const user = await Usuario.findOne({ where: { cedula: output.userCedula }, include: ['rol','cargo'] });
      if (!user) {
        throw "El usuario no existe.";
      }

      output.sede = sede;
      output.user = user;
    } catch (err) {
      throw { message: err.message };
    }

    /**
     * Return
     */
    return output;
  },
};

module.exports = MiddlewareUtils;