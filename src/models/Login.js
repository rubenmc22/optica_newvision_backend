const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db');

const Login = sequelize.define('Login', {
  id: {
    type: DataTypes.INTEGER(11),
    primaryKey: true,
    autoIncrement: true,
    allowNull: false
  },
  usu_cedula: {
    type: DataTypes.STRING(20),
    allowNull: false,
    collate: 'utf8mb4_general_ci'
  },
  token: {
    type: DataTypes.TEXT,
    allowNull: false,
    collate: 'utf8mb4_general_ci'
  },
  ip: {
    type: DataTypes.STRING(15),
    allowNull: false,
    collate: 'utf8mb4_general_ci'
  },
  created_at: {
    type: DataTypes.DATE,
    allowNull: false,
    defaultValue: DataTypes.NOW
  },
  updated_at: {
    type: DataTypes.DATE,
    allowNull: false,
    defaultValue: DataTypes.NOW
  }
}, {
  tableName: 'logins',
  timestamps: true, // Habilita created_at y updated_at automáticos
  createdAt: 'created_at',
  updatedAt: 'updated_at',
  underscored: true, // Usa snake_case para los nombres de campos
  collate: 'utf8mb4_general_ci'
});

module.exports = Login;