const axios = require('axios');
const BASE_URL = "https://sandbox-api.okto.tech";


const apiService = axios.create({
  baseURL: BASE_URL,
  headers: {
    "x-api-key": OKTO_CLIENT_API,
    "Content-Type": "application/json",
  },
});

const authenticate = async (idToken) => {
  try {
    const response = await apiService.post("/api/v1/authenticate", { id_token: idToken });
    return response.data;
  } catch (error) {
    throw new Error(error.response.data.error);
  }
};

const setPin = async (idToken, token, reloginPin) => {
  try {
    const response = await apiService.post("/api/v1/set_pin", {
      id_token: idToken,
      token: token,
      relogin_pin: reloginPin,
      purpose: "set_pin",
    });
    return response.data;
  } catch (error) {
    throw new Error(error.response.data.error);
  }
};

module.exports = { authenticate, setPin };
