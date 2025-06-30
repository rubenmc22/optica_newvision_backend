const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db');
const Usuario = require('./Usuario');

const TasaHistorial = sequelize.define('TasaHistorial', {
  id: {
    type: DataTypes.INTEGER(11),
    primaryKey: true,
    autoIncrement: true,
  },
  tasa_id: {
    type: DataTypes.STRING(20),
    allowNull: false,
    collate: 'utf8mb4_general_ci',
  },
  valor_nuevo: {
    type: DataTypes.DOUBLE,
    allowNull: false,
  },
  usu_cedula: {
    type: DataTypes.STRING(20),
    allowNull: false,
    collate: 'utf8mb4_general_ci',
  },
  tipo_cambio: {
    type: DataTypes.STRING(255),
    allowNull: false,
    collate: 'utf8mb4_general_ci',
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
  tableName: 'tasas_historial',
  timestamps: true,
  createdAt: 'created_at',
  updatedAt: 'updated_at',
});

TasaHistorial.belongsTo(Usuario, {
  foreignKey: 'usu_cedula',
  targetKey: 'cedula',
  as: 'usuario'
});

module.exports = TasaHistorial;