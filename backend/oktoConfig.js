const { Okto } = require('okto-sdk-react');

const okto = new Okto({
  apiKey: 'YOUR_API_KEY',
  apiSecret: 'YOUR_API_SECRET',
});

module.exports = okto;
