const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db'); // Ajusta la ruta según tu estructura
const VentaPago = require('./VentaPago');
const VentaProducto = require('./VentaProducto');
const VentaCashea = require('./VentaCashea');
const VentaCasheaCuota = require('./VentaCasheaCuota');

const Venta = sequelize.define('Venta', {
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
  numero_control: {
    type: DataTypes.BIGINT,
    allowNull: false
  },
  sede: {
    type: DataTypes.STRING(50),
    allowNull: false
  },
  paciente_key: {
    type: DataTypes.STRING(70),
    allowNull: false
  },
  moneda: {
    type: DataTypes.STRING(70),
    allowNull: false
  },
  forma_pago: {
    type: DataTypes.STRING(255),
    allowNull: false
  },
  historia_medica_id: {
    type: DataTypes.STRING(14),
    allowNull: false
  },
  descuento: {
    type: DataTypes.FLOAT,
    allowNull: false
  },
  subtotal: {
    type: DataTypes.FLOAT,
    allowNull: false
  },
  total_descuento: {
    type: DataTypes.FLOAT,
    allowNull: false
  },
  total: {
    type: DataTypes.FLOAT,
    allowNull: false
  },
  observaciones: {
    type: DataTypes.TEXT,
    allowNull: true
  },
  fecha: {
    type: DataTypes.DATEONLY,
    allowNull: false
  },
  pago_completo: {
    type: DataTypes.TINYINT,
    allowNull: false
  },
  financiado: {
    type: DataTypes.TINYINT,
    allowNull: false
  },
  created_by: {
    type: DataTypes.STRING(20),
    allowNull: false
  },
  estatus_venta: {
    type: DataTypes.STRING(50),
    allowNull: false
  },
  estatus_pago: {
    type: DataTypes.STRING(50),
    allowNull: false
  },
  created_at: {
    type: DataTypes.DATE,
    allowNull: false
  },
  updated_at: {
    type: DataTypes.DATE,
    allowNull: false
  }
}, {
  tableName: 'ventas',
  timestamps: true,
  createdAt: 'created_at',
  updatedAt: 'updated_at',
});

Venta.hasOne(VentaCashea, {
  foreignKey: 'venta_key',
  sourceKey: 'venta_key',
  as: 'datos_cashea'
});

Venta.hasMany(VentaCasheaCuota, {
  foreignKey: 'venta_key',
  sourceKey: 'venta_key',
  as: 'cuotas_cashea'
});

Venta.hasMany(VentaPago, {
  foreignKey: 'venta_key',
  sourceKey: 'venta_key',
  as: 'array_pagos'
});

Venta.hasMany(VentaProducto, {
  foreignKey: 'venta_key',
  sourceKey: 'venta_key',
  as: 'array_productos'
});

module.exports = Venta;