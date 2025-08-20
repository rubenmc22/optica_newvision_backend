const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db');

const HistorialRastreoBcv = sequelize.define('HistorialMedico', {
  id: {
    type: DataTypes.INTEGER(11),
    primaryKey: true,
    autoIncrement: true,
  },
  fecha: {
    type: DataTypes.DATEONLY,
    allowNull: false,
  },
  hora: {
    type: DataTypes.STRING(8),
    allowNull: true,
    collate: 'utf8mb4_general_ci'
  },
  rastreado: {
    type: DataTypes.TINYINT(4),
    allowNull: false
  },
  respuesta: {
    type: DataTypes.TEXT,
    allowNull: true,
    collate: 'utf8mb4_general_ci'
  },
  comentario: {
    type: DataTypes.TEXT,
    allowNull: true,
    collate: 'utf8mb4_general_ci'
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
  tableName: 'historial_rastreo_bcv',
  timestamps: true,
  createdAt: 'created_at',
  updatedAt: 'updated_at',
});

module.exports = HistorialRastreoBcv;
