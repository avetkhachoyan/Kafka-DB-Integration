const { Kafka } = require('kafkajs');
const config = require('../config');

const kafka = new Kafka(config.kafka);
const producer = kafka.producer();

const sendMessage = async (message) => {
  await producer.connect();
  await producer.send({
    topic: 'biographical-data',
    messages: [{ value: JSON.stringify(message) }]
  });
  await producer.disconnect();
};

module.exports = { sendMessage };
