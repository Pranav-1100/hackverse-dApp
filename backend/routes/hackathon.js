const express = require('express');
const { createHackathon, getHackathons } = require('../controllers/hackathonController');
const router = express.Router();

router.post('/', createHackathon);
router.get('/', getHackathons);

module.exports = router;
