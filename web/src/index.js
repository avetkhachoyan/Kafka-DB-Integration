const express = require('express');
const bodyParser = require('body-parser');
const routes = require('./routes');
const config = require('./config');

const app = express();
app.use(bodyParser.json());
app.use('/api', routes);

app.listen(config.port, () => {
  console.log(`Server running on port ${config.port}`);
});
