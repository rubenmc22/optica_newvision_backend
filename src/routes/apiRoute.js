// src/routes/index.js
const express = require('express');
const authController = require('./../controllers/authController');
const authMiddleware = require('./../middlewares/authMiddleware');
const noAuthMiddleware = require('../middlewares/noAuthMiddleware');
const accountController = require('../controllers/accountController');
const DateUtils = require('../utils/DateUtils');
const UsuarioController = require('../controllers/UsuarioController');
const RolController = require('../controllers/RolController');
const CargoController = require('../controllers/CargoController');
const TasasController = require('../controllers/TasasController');
const SedesController = require('../controllers/SedesController');
const PacienteController = require('../controllers/PacienteController');

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
router.get('/sedes-get', SedesController.get);

router.post('/auth/login', noAuthMiddleware, authController.login);
router.get('/auth/get_data', authMiddleware, authController.get_data);
router.post('/auth/forgot-password', noAuthMiddleware, authController.forgot_password);

router.post('/account/upload-profile-image', authMiddleware, accountController.upload_profile_image);
router.post('/account/edit-profile', authMiddleware, accountController.edit_profile);
router.post('/account/change-password--send-otp', authMiddleware, accountController.change_password__send_otp);
router.post('/account/change-password--verify-otp', authMiddleware, accountController.change_password__verify_otp);
router.post('/account/change-password--change-password', authMiddleware, accountController.change_password__change_password);

router.get('/roles-get/:id?', authMiddleware, RolController.get);

router.get('/cargos-get/:id?', authMiddleware, CargoController.get);

router.get('/get-usuarios/:cedula?', authMiddleware, UsuarioController.get);
router.post('/add-usuarios/', authMiddleware, UsuarioController.add);
router.put('/update-usuarios/:cedula', authMiddleware, UsuarioController.update);
router.delete('/delete-usuarios/:cedula', authMiddleware, UsuarioController.delete);
router.put('/activar-usuarios/:cedula', authMiddleware, UsuarioController.activar);

router.get('/tasas/:id?', authMiddleware, TasasController.get);
router.put('/tasas-update/:id', authMiddleware, TasasController.update);
router.put('/tasas-update-with-bcv/:id?', authMiddleware, TasasController.update_with_bcv);
router.get('/get-tasa-bcv', TasasController.get_tasa_bcv);
router.get('/tasas-history/:id/:fecha_inicio?/:fecha_final?', authMiddleware, TasasController.get_history);
router.put('/tasas-rastreo-automatico/:id', authMiddleware, TasasController.rastreo_automatico);

router.get('/paciente-get/:id?', authMiddleware, PacienteController.get);
router.post('/paciente-add/', authMiddleware, PacienteController.add);
router.put('/paciente-update/:id?', authMiddleware, PacienteController.update);
router.delete('/paciente-delete/:id?', authMiddleware, PacienteController.delete);

router.get('/home', authMiddleware, (req, res) => {
  res.json({ message: 'Bienvenido a la página de inicio.', user: req.user });
});

module.exports = router;