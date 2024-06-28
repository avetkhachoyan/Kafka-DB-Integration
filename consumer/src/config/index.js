require('dotenv').config();

module.exports = {
  kafka: {
    clientId: 'biographical-consumer',
    brokers: process.env.KAFKA_BROKERS.split(',')
  },
  pg: {
    user: process.env.PG_USER,
    host: process.env.PG_HOST,
    database: process.env.PG_DATABASE,
    password: process.env.PG_PASSWORD,
    port: 5432
  },
  dynamo: {
    region: 'us-west-2'
  }
};
