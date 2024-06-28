const { Kafka } = require('kafkajs');
const { saveToPostgres, saveToDynamoDB } = require('./dbService');
const config = require('../config');

const kafka = new Kafka(config.kafka);
const consumer = kafka.consumer({ groupId: 'biographical-group' });

const consumeMessages = async () => {
  await consumer.connect();
  await consumer.subscribe({ topic: 'biographical-data', fromBeginning: true });

  await consumer.run({
    eachMessage: async ({ topic, partition, message }) => {
      const data = JSON.parse(message.value.toString());
      await saveToPostgres(data);
      await saveToDynamoDB(data);
    }
  });
};

module.exports = {
  consumeMessages
};
