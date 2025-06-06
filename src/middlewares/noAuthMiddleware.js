const noAuthMiddleware = async (req, res, next) => {
  const authHeader = req.header('Authorization');

  if (authHeader) {
    res.status(400).json({ message: 'Cierre sesion antes de continuar con este proceso.' });
  } else {
    next();
  }
};

module.exports = noAuthMiddleware;