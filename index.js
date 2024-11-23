const express = require('express');
const app = express();

app.get('/', (req, res) => {
  return res.send('If you made it here, your Docker web-app is working!');
});

app.listen(3000, () => {
  console.log('Web server listening on http://localhost:3000');
})
