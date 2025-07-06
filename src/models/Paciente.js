const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db');
const Sede = require('./Sede');

const Paciente = sequelize.define('Paciente', {
  id: {
    type: DataTypes.STRING(70),
    primaryKey: true,
    allowNull: false,
    collate: 'utf8mb4_general_ci'
  },
  sede_id: {
    type: DataTypes.STRING(50),
    allowNull: false,
    collate: 'utf8mb4_general_ci'
  },
  cedula: {
    type: DataTypes.STRING(20),
    allowNull: false,
    collate: 'utf8mb4_general_ci'
  },
  nombre: {
    type: DataTypes.STRING(255),
    allowNull: false,
    collate: 'utf8mb4_general_ci'
  },
  fecha_nacimiento: {
    type: DataTypes.DATEONLY,
    allowNull: false,
  },
  telefono: {
    type: DataTypes.STRING(20),
    allowNull: false,
    collate: 'utf8mb4_general_ci'
  },
  email: {
    type: DataTypes.STRING(255),
    allowNull: false,
    collate: 'utf8mb4_general_ci'
  },
  ocupacion: {
    type: DataTypes.TEXT,
    allowNull: false,
    collate: 'utf8mb4_general_ci'
  },
  genero: {
    type: DataTypes.STRING(1),
    allowNull: false,
    collate: 'utf8mb4_general_ci'
  },
  direccion: {
    type: DataTypes.TEXT,
    allowNull: false,
    collate: 'utf8mb4_general_ci'
  },
  redes_sociales: {
    type: DataTypes.JSON,
    allowNull: false,
    validate: {
      isArray(value) {
        if (!Array.isArray(value)) {
          throw new Error('redes_sociales debe ser un arreglo.');
        }
      }
    },
    get() {
      const raw = this.getDataValue('redes_sociales');
      return Array.isArray(raw) ? raw : [];
    },
    set(value) {
      if (!Array.isArray(value)) {
        throw new Error('redes_sociales debe ser un arreglo.');
      }
      this.setDataValue('redes_sociales', value);
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
  tableName: 'pacientes',
  timestamps: true,
  createdAt: 'created_at',
  updatedAt: 'updated_at',
  paranoid: true,
  deletedAt: 'deleted_at'
});

Paciente.belongsTo(Sede, {
  foreignKey: 'sede_id',
  as: 'sede'
});

module.exports = Paciente;