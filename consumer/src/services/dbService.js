const { Client } = require('pg');
const AWS = require('aws-sdk');
const config = require('../config');

const pgClient = new Client(config.pg);
pgClient.connect();

const dynamoClient = new AWS.DynamoDB.DocumentClient({ region: config.dynamo.region });

const saveToPostgres = async (data) => {
  await pgClient.query('INSERT INTO biographical_table(data) VALUES($1)', [data]);
};

const saveToDynamoDB = async (data) => {
  await dynamoClient.put({
    TableName: 'BiographicalData',
    Item: {
      ID: data.id,  // Assuming the data includes an `id` field
      Data: data,
    }
  }).promise();
};

module.exports = {
  saveToPostgres,
  saveToDynamoDB
};
