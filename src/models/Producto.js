const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db');
const Sede = require('./Sede');

const Producto = sequelize.define('Producto', {
    id: {
        type: DataTypes.INTEGER(11),
        primaryKey: true,
        autoIncrement: true,
    },
    sede_id: {
        type: DataTypes.STRING(50),
        allowNull: false,
        collate: 'utf8mb4_general_ci'
    },
    nombre: {
        type: DataTypes.STRING(255),
        allowNull: false,
        collate: 'utf8mb4_general_ci'
    },
    marca: {
        type: DataTypes.STRING(255),
        allowNull: false,
        collate: 'utf8mb4_general_ci'
    },
    color: {
        type: DataTypes.STRING(255),
        allowNull: false,
        collate: 'utf8mb4_general_ci'
    },
    codigo: {
        type: DataTypes.STRING(255),
        allowNull: false,
        collate: 'utf8mb4_general_ci'
    },
    material: {
        type: DataTypes.STRING(255),
        allowNull: false,
        collate: 'utf8mb4_general_ci'
    },
    proveedor: {
        type: DataTypes.STRING(255),
        allowNull: false,
        collate: 'utf8mb4_general_ci'
    },
    categoria: {
        type: DataTypes.STRING(255),
        allowNull: false,
        collate: 'utf8mb4_general_ci'
    },
    stock: {
        type: DataTypes.INTEGER(11),
        allowNull: false
    },
    precio: {
        type: DataTypes.DOUBLE,
        allowNull: false
    },
    moneda: {
        type: DataTypes.STRING(20),
        allowNull: false,
        collate: 'utf8mb4_general_ci'
    },
    activo: {
        type: DataTypes.TINYINT(4),
        allowNull: false,
        defaultValue: 0,
        get() {
            return this.getDataValue('activo') === 1;
        },
        set(value) {
            this.setDataValue('activo', value ? 1 : 0);
        }
    },
    descripcion: {
        type: DataTypes.TEXT,
        allowNull: false,
        collate: 'utf8mb4_general_ci'
    },
    imagen_url: {
        type: DataTypes.TEXT,
        allowNull: true,
        collate: 'utf8mb4_general_ci'
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
    }
}, {
    tableName: 'productos',
    timestamps: true,
    createdAt: 'created_at',
    updatedAt: 'updated_at',
    paranoid: true,
    deletedAt: 'deleted_at'
});

Producto.belongsTo(Sede, {
  foreignKey: 'sede_id',
  as: 'sede'
});

module.exports = Producto; 