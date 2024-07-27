require('dotenv').config(); // This line loads the environment variables from the .env file

const express = require('express');
const bodyParser = require('body-parser');
const routes = require('./routes/auth');

const app = express();

app.use(bodyParser.json());
app.use('/api', routes);

const PORT = process.env.PORT || 5000;

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});