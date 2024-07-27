const express = require('express');
const router = express.Router();
const loginController = require('../controllers/authController');

router.post('/login', loginController.handleGoogleLogin);
router.post('/set_pin', loginController.setPin);

module.exports = router;