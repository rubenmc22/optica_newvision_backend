const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db');

const Otp = sequelize.define('Otp', {
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
  otp: {
    type: DataTypes.STRING(8),
    allowNull: false,
    collate: 'utf8mb4_general_ci'
  },
  ip: {
    type: DataTypes.STRING(15),
    allowNull: false,
    collate: 'utf8mb4_general_ci'
  },
  correo: {
    type: DataTypes.STRING(255),
    allowNull: false,
    collate: 'utf8mb4_general_ci'
  },
  activo: {
    type: DataTypes.TINYINT(4),
    allowNull: false,
    defaultValue: 1 // Asumiendo que 1 = activo, 0 = inactivo
  },
  verificado: {
    type: DataTypes.TINYINT(4),
    allowNull: false,
    defaultValue: 0 // Asumiendo que 0 = no verificado, 1 = verificado
  },
  historial: {
    type: DataTypes.TEXT('long'),
    allowNull: false,
    collate: 'utf8mb4_bin',
    get() {
      const rawValue = this.getDataValue('historial');
      return rawValue ? JSON.parse(rawValue) : []; // Retorna array vacío si es null
    },
    set(value) {
      // Asegura que siempre se guarde como array
      const finalValue = Array.isArray(value) ? value : [value];
      this.setDataValue('historial', JSON.stringify(finalValue));
    },
    defaultValue: '[]'
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
  tableName: 'otps',
  timestamps: true, // Habilita created_at y updated_at automáticos
  createdAt: 'created_at',
  updatedAt: 'updated_at',
  underscored: true, // Usa snake_case para los nombres de campos
  collate: 'utf8mb4_general_ci'
});

module.exports = Otp;