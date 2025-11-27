
const express = require('express');
const app = express();
const PORT = 8080;

app.get('/', (req, res) => {
  res.send('<h1>Bulletin Board App is Running!</h1>');
});

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
