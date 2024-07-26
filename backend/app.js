require('dotenv').config();
const express = require('express');
const connectDB = require('./config/db');
const authRoutes = require('./routes/auth');
// const hackathonRoutes = require('./routes/hackathon');
// const teamRoutes = require('./routes/team');
// const submissionRoutes = require('./routes/submission');
// const messageRoutes = require('./routes/message');
// const notificationRoutes = require('./routes/notification');
// const userRoutes = require('./routes/user');
// const adminRoutes = require('./routes/admin');

const app = express();

// Connect to the database
connectDB();

// Middleware
app.use(express.json());

// Routes
app.use('/api/auth', authRoutes);
// app.use('/api/hackathon', hackathonRoutes);
// app.use('/api/team', teamRoutes);
// app.use('/api/submission', submissionRoutes);
// app.use('/api/message', messageRoutes);
// app.use('/api/notification', notificationRoutes);
// app.use('/api/user', userRoutes);
// app.use('/api/admin', adminRoutes);

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
