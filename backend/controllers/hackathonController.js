const Hackathon = require('../models/Hackathon');

exports.createHackathon = async (req, res) => {
  const { title, description, startDate, endDate } = req.body;
  try {
    const hackathon = new Hackathon({ title, description, startDate, endDate });
    await hackathon.save();
    res.json(hackathon);
  } catch (err) {
    console.error(err.message);
    res.status(500).send('Server error');
  }
};

exports.getHackathons = async (req, res) => {
  try {
    const hackathons = await Hackathon.find();
    res.json(hackathons);
  } catch (err) {
    console.error(err.message);
    res.status(500).send('Server error');
  }
};
