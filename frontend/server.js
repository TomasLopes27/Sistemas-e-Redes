const express = require('express');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 8080;

// Muda isto se o teu projeto Angular tiver outro nome que não seja 'frontend'
const distFolder = path.join(__dirname, 'dist/frontend');

app.use(express.static(distFolder));

app.get('*', (req, res) => {
  res.sendFile(path.join(distFolder, 'index.html'));
});

app.listen(PORT, () => {
  console.log(`Servidor Angular em produção na porta ${PORT}`);
});
