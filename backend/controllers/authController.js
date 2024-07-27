const axios = require('axios');

const apiService = axios.create({
  baseURL: process.env.BASE_URL,
  headers: {
    "x-api-key": process.env.OKTO_CLIENT_API_KEY,
    "Content-Type": "application/json"
  }
});


exports.handleGoogleLogin = async (req, res) => {
  const { idToken } = req.body;
  try {
    const response = await apiService.post('/api/v1/authenticate', { id_token: idToken });
    if (response.data.auth_token) {
      res.status(200).json({ authToken: response.data.auth_token });
    } else {
      res.status(400).json({ message: 'Authentication failed' });
    }
  } catch (error) {
    res.status(500).json({ message: 'Server error', error: error.message });
  }
};

exports.setPin = async (req, res) => {
  const { idToken, token, reloginPin } = req.body;
  try {
    const response = await apiService.post('/api/v1/set_pin', {
      id_token: idToken,
      token: token,
      relogin_pin: reloginPin,
      purpose: "set_pin"
    });
    res.status(200).json({ message: 'Pin set successfully' });
  } catch (error) {
    res.status(500).json({ message: 'Server error', error: error.message });
  }
};
