// src/routes/index.js
const express = require('express');
const authController = require('./../controllers/authController');
const authMiddleware = require('./../middlewares/authMiddleware');
const noAuthMiddleware = require('../middlewares/noAuthMiddleware');
const accountController = require('../controllers/accountController');
const DateUtils = require('../utils/DateUtils');
const UsuarioController = require('../controllers/UsuarioController');

const router = express.Router();

router.get('', (req, res) => {
  const ip = req.ip;
  const timestamp = Date.now();
  const date = DateUtils.getDate();
  res.json({ message: `Bienvenido a mi API`, ip, timestamp, date });
});

/**
 * Auth
 */
router.post('/auth/login', noAuthMiddleware, authController.login);
router.get('/auth/get_data', authMiddleware, authController.get_data);
router.post('/auth/forgot-password', noAuthMiddleware, authController.forgot_password);

router.post('/account/upload-profile-image', authMiddleware, accountController.upload_profile_image);
router.post('/account/edit-profile', authMiddleware, accountController.edit_profile);
router.post('/account/change-password--send-otp', authMiddleware, accountController.change_password__send_otp);
router.post('/account/change-password--verify-otp', authMiddleware, accountController.change_password__verify_otp);
router.post('/account/change-password--change-password', authMiddleware, accountController.change_password__change_password);

router.get('/usuarios/get/', authMiddleware, UsuarioController.get);
router.get('/usuarios/get/:id?', authMiddleware, UsuarioController.get);
router.get('/usuarios/add/', authMiddleware, UsuarioController.add);
router.get('/usuarios/update/:id?', authMiddleware, UsuarioController.update);
router.get('/usuarios/delete/:id?', authMiddleware, UsuarioController.delete);

router.get('/home', authMiddleware, (req, res) => {
  res.json({ message: 'Bienvenido a la página de inicio.', user: req.user });
});

module.exports = router;