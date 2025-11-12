const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db');

const Sede = sequelize.define('Sede', {
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
  },
  direccion: {
    type: DataTypes.TEXT,
    allowNull: true,
    collate: 'utf8mb4_general_ci'
  },
  telefono: {
    type: DataTypes.STRING(20),
    allowNull: true,
    collate: 'utf8mb4_general_ci'
  },
  email: {
    type: DataTypes.STRING(255),
    allowNull: true,
    collate: 'utf8mb4_general_ci'
  },
  direccion_fiscal: {
    type: DataTypes.TEXT,
    allowNull: true,
    collate: 'utf8mb4_general_ci'
  }
}, {
  tableName: 'sedes',
  timestamps: false
});

module.exports = Sede;