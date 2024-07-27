const mongoose = require('mongoose');

const UserSchema = new mongoose.Schema({
  name: String,
  email: String,
  password: String, // Store hashed password
  walletAddress: String,
  skills: [String],
  achievements: [String],
});

module.exports = mongoose.model('User', UserSchema);
