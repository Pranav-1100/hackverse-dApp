const mongoose = require('mongoose');

const TeamSchema = new mongoose.Schema({
  name: String,
  members: [{ type: mongoose.Schema.Types.ObjectId, ref: 'User' }],
  hackathon: { type: mongoose.Schema.Types.ObjectId, ref: 'Hackathon' },
});

module.exports = mongoose.model('Team', TeamSchema);
