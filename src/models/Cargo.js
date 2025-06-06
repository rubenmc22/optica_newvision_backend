const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db'); // Ajusta la ruta según tu estructura

const Cargo = sequelize.define('Cargo', {
  id: {
    type: DataTypes.STRING(50),
    primaryKey: true,
    allowNull: false,
    collate: 'utf8mb4_general_ci'
  },
  nombre: {
    type: DataTypes.STRING(255),
    allowNull: false,
    collate: 'utf8mb4_general_ci'
  }
}, {
  tableName: 'cargos',
  timestamps: false
});

module.exports = Cargo;