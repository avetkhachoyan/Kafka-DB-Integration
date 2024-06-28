require('dotenv').config();

module.exports = {
  port: process.env.PORT || 3000,
  kafka: {
    clientId: 'biographical-app',
    brokers: process.env.KAFKA_BROKERS.split(',')
  }
};
