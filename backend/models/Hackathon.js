const mongoose = require('mongoose');

const HackathonSchema = new mongoose.Schema({
  title: String,
  description: String,
  startDate: Date,
  endDate: Date,
});

module.exports = mongoose.model('Hackathon', HackathonSchema);
