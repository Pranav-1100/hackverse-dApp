const Team = require('../models/Team');

exports.createTeam = async (req, res) => {
  const { name, members, hackathon } = req.body;
  try {
    const team = new Team({ name, members, hackathon });
    await team.save();
    res.json(team);
  } catch (err) {
    console.error(err.message);
    res.status(500).send('Server error');
  }
};

exports.getTeams = async (req, res) => {
  try {
    const teams = await Team.find().populate('members').populate('hackathon');
    res.json(teams);
  } catch (err) {
    console.error(err.message);
    res.status(500).send('Server error');
  }
};
