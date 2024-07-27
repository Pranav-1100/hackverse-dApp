const mongoose = require('mongoose');

const NotificationSchema = new mongoose.Schema({
  content: String,
  user: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
  timestamp: { type: Date, default: Date.now },
});

module.exports = mongoose.model('Notification', NotificationSchema);
