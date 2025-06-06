const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db'); // Ajusta la ruta según tu estructura

const Rol = sequelize.define('Rol', {
  id: {
    type: DataTypes.STRING(100),
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
  tableName: 'roles',
  timestamps: false
});

module.exports = Rol;