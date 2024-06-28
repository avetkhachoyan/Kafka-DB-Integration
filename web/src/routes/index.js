const express = require('express');
const { sendMessage } = require('../producer/producer');
const router = express.Router();

router.post('/submit', async (req, res) => {
  const userData = req.body;
  try {
    await sendMessage(userData);
    res.status(200).send('Data sent to Kafka');
  } catch (error) {
    console.error('Error sending data to Kafka:', error);
    res.status(500).send('Error sending data to Kafka');
  }
});

module.exports = router;
