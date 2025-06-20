const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db');
const Rol = require('./Rol');
const Cargo = require('./Cargo');

const Usuario = sequelize.define('Usuario', {
  id: {
    type: DataTypes.INTEGER(11),
    primaryKey: true,
    autoIncrement: true,
  },
  rol_id: {
    type: DataTypes.STRING(100),
    allowNull: false,
    collate: 'utf8mb4_general_ci',
  },
  cedula: {
    type: DataTypes.STRING(20),
    allowNull: false,
    collate: 'utf8mb4_general_ci',
    unique: true,
  },
  nombre: {
    type: DataTypes.STRING(255),
    allowNull: true,
    collate: 'utf8mb4_general_ci',
  },
  password: {
    type: DataTypes.STRING(255),
    allowNull: false,
    collate: 'utf8mb4_general_ci',
  },
  correo: {
    type: DataTypes.STRING(255),
    allowNull: true,
    collate: 'utf8mb4_general_ci',
    unique: true,
  },
  telefono: {
    type: DataTypes.STRING(20),
    allowNull: true,
    collate: 'utf8mb4_general_ci',
  },
  fecha_nacimiento: {
    type: DataTypes.DATEONLY,
    allowNull: true,
  },
  ruta_imagen: {
    type: DataTypes.TEXT,
    allowNull: true,
    collate: 'utf8mb4_general_ci',
  },
  avatar_url: {
    type: DataTypes.TEXT,
    allowNull: true,
    collate: 'utf8mb4_general_ci',
  },
  activo: {
    type: DataTypes.TINYINT(4),
    allowNull: false,
    defaultValue: 1,
    get() {
      return this.getDataValue('activo') === 1;
    },
    set(value) {
      this.setDataValue('activo', value ? 1 : 0);
    }
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
  deleted_at: {
    type: DataTypes.DATE,
    allowNull: true,
  },
}, {
  tableName: 'usuarios',
  timestamps: true,
  createdAt: 'created_at',
  updatedAt: 'updated_at',
  paranoid: true,
  deletedAt: 'deleted_at'
});

// Relación N:1 con Rol
Usuario.belongsTo(Rol, {
  foreignKey: 'rol_id',
  as: 'rol'
});
Usuario.belongsTo(Cargo, {
  foreignKey: 'cargo_id',
  as: 'cargo'
});

module.exports = Usuario;