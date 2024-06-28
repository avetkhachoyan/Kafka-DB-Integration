const { consumeMessages } = require('./services/kafkaConsumer');

consumeMessages().catch(console.error);
