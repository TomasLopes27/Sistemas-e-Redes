const express = require('express');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 10000;

// Serve os ficheiros estáticos da build Angular SSR
const distFolder = path.join(__dirname, 'dist/frontend/browser');

app.use(express.static(distFolder));

app.get('*', (req, res) => {
  res.sendFile(path.join(distFolder, 'index.html'));
});

app.listen(PORT, () => {
  console.log(`Servidor Angular em produção na porta ${PORT}`);
});
