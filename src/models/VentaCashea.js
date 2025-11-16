const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db'); // Ajusta la ruta según tu estructura

const VentaCashea = sequelize.define('VentaCashea', {
  id: {
    type: DataTypes.BIGINT,
    primaryKey: true,
    autoIncrement: true,
    allowNull: false
  },
  venta_key: {
    type: DataTypes.STRING(100),
    allowNull: false
  },
  nivel_cashea: {
    type: DataTypes.STRING(50),
    allowNull: false
  },
  monto_inicial: {
    type: DataTypes.FLOAT,
    allowNull: false
  },
  cantidad_cuotas: {
    type: DataTypes.INTEGER,
    allowNull: false
  },
  monto_por_cuota: {
    type: DataTypes.FLOAT,
    allowNull: false
  },
  total_adelantado: {
    type: DataTypes.FLOAT,
    allowNull: false
  }
}, {
  tableName: 'ventas_cashea',
  timestamps: false
});

module.exports = VentaCashea;