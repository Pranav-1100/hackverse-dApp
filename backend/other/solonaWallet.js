const express = require('express');
const { Keypair } = require('@solana/web3.js');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
const port = process.env.PORT || 5000;

app.use(cors());
app.use(bodyParser.json());

app.post('/api/wallet/create', (req, res) => {
  try {
    const keypair = Keypair.generate();
    const publicKey = keypair.publicKey.toString();
    const secretKey = Buffer.from(keypair.secretKey).toString('hex');

    res.status(201).json({ publicKey, secretKey });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
