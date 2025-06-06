require('dotenv').config();
const express = require('express');
const routes = require('./routes/apiRoute');
const { testConnection } = require('./config/db');
const cors = require('cors');
const Usuario = require('./models/Usuario');
const path = require('path');

const app = express();
const port = process.env.PORT || 3000;

// Conectamos con la base de datos
testConnection();

// Middleware
app.use(cors());
app.use(express.json());

// Configuración para servir archivos estáticos
app.use('/public', express.static(path.join(__dirname, '../public')));

// Rutas
app.get('/', async (req, res) => {
  res.json({ message: "Hello world 3" });
});

app.use('/api', routes);

// Iniciar servidor
app.listen(port, () => {
  console.log(`Servidor corriendo en http://localhost:${port}`);
});