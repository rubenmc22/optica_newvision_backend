const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db'); // Ajusta la ruta según tu estructura

const VentaCasheaCuota = sequelize.define('VentaCasheaCuota', {
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
  numero: {
    type: DataTypes.INTEGER,
    allowNull: false
  },
  monto: {
    type: DataTypes.FLOAT,
    allowNull: false
  },
  fecha_vencimiento: {
    type: DataTypes.STRING(50),
    allowNull: false
  },
  pagada: {
    type: DataTypes.TINYINT,
    allowNull: false
  },
  seleccionada: {
    type: DataTypes.TINYINT,
    allowNull: false
  },
}, {
  tableName: 'ventas_cashea_cuotas',
  timestamps: false
});

module.exports = VentaCasheaCuota;