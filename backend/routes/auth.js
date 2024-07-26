// const express = require('express');
// const router = express.Router();
// const { authenticate, setPin } = require('../services/authService');

// router.post('/login', async (req, res) => {
//   const { idToken } = req.body;
//   try {
//     const authResponse = await authenticate(idToken);
//     if (authResponse.action === "signup") {
//       const pinToken = authResponse.token;
//       await setPin(idToken, pinToken, "0000");
//       const newAuthResponse = await authenticate(idToken);
//       res.json(newAuthResponse);
//     } else {
//       res.json(authResponse);
//     }
//   } catch (error) {
//     res.status(500).json({ error: error.message });
//   }
// });

// module.exports = router;
const express = require('express');
const { registerUser, loginUser, verifyToken } = require('../controllers/authController');
const router = express.Router();

router.post('/register', registerUser);
router.post('/login', loginUser);
router.get('/verify', verifyToken);

module.exports = router;
