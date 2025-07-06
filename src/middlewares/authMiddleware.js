const MiddlewareUtils = require('../utils/MiddlewareUtils');

const authMiddleware = async (req, res, next) => {
  const authHeader = req.header('Authorization');

  if (!authHeader) {
    return res.status(401).json({ message: 'Acceso denegado. Token no proporcionado.' });
  }

  const parts = authHeader.split(' ');
  if (parts.length !== 2 || parts[0] !== 'Bearer') {
    return res.status(401).json({ message: 'Formato de token inválido. Debe ser: Bearer <token>' });
  }

  const token = parts[1];

  try {
    const data = await MiddlewareUtils.get_data(token);

    if(!data.user.activo) {
      return res.status(401).json({ message: 'Usuario inactivo.' });
    }

    req.sede = data.sede;
    req.user = data.user;
  } catch (err) {
    res.status(400).json({ message: err.message });
    return;
  }
  
  next();
};

module.exports = authMiddleware;