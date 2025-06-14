const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db');

const Tasa = sequelize.define('Usuario', {
  id: {
    type: DataTypes.STRING(20),
    primaryKey: true,
    collate: 'utf8mb4_general_ci',
  },
  nombre: {
    type: DataTypes.STRING(255),
    allowNull: false,
    collate: 'utf8mb4_general_ci',
  },
  simbolo: {
    type: DataTypes.STRING(3),
    allowNull: false,
    collate: 'utf8mb4_general_ci',
  },
  valor: {
    type: DataTypes.DOUBLE,
    allowNull: false,
  },
  created_at: {
    type: DataTypes.DATE,
    allowNull: false,
    defaultValue: DataTypes.NOW,
  },
  updated_at: {
    type: DataTypes.DATE,
    allowNull: false,
    defaultValue: DataTypes.NOW,
  },
}, {
  tableName: 'tasas',
  timestamps: true,
  createdAt: 'created_at',
  updatedAt: 'updated_at',
});

module.exports = Tasa;