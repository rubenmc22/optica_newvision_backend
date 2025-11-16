const CatchGeneric = (fn) => {
  return async (req, res, next) => {
    try {
      await fn(req, res, next);
    } catch (err) {
      console.error(err);
      res.status(400).json(err);
    }
  };
};

module.exports = CatchGeneric;
