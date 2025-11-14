const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db'); // Ajusta la ruta según tu estructura

const Venta = sequelize.define('Venta', {
  id: {
    type: DataTypes.STRING(50),
    primaryKey: true,
    allowNull: false,
    collate: 'utf8mb4_general_ci'
  }
}, {
  tableName: 'ventas',
  timestamps: false
});

module.exports = Venta;