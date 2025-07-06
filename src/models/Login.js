const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db');
const Sede = require('./Sede');
const Usuario = require('./Usuario');

const Login = sequelize.define('Login', {
  id: {
    type: DataTypes.INTEGER(11),
    primaryKey: true,
    autoIncrement: true,
    allowNull: false
  },
  sede_id: {
    type: DataTypes.STRING(50),
    allowNull: false,
    collate: 'utf8mb4_general_ci'
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
  timestamps: true,
  createdAt: 'created_at',
  updatedAt: 'updated_at',
  underscored: true,
  collate: 'utf8mb4_general_ci'
});

Login.belongsTo(Sede, {
  foreignKey: 'sede_id',
  as: 'sede'
});
Login.belongsTo(Usuario, {
  foreignKey: 'usu_cedula',
  as: 'usuario'
});

module.exports = Login;