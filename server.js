const express = require('express');
const app = express();
const PORT = 3000;

app.use(express.static('app'));

app.use(express.static('build/contracts'));

app.get('/', (_, res) => res.send(`${__dirname}/app/index.html`));

app.get('*', (_, res) => res.status(404).send('Page not found'));

app.listen(PORT, () => {
  console.log(`Ethereum ToDo List App running on Port ${PORT}`);
});
