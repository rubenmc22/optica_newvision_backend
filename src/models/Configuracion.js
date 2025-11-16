const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db');

const Configuracion = sequelize.define('Configuracion', {
    clave: {
        type: DataTypes.STRING,
        primaryKey: true,
        allowNull: false
    },
    valor: {
        type: DataTypes.STRING,
        allowNull: false
    },
    descripcion: {
        type: DataTypes.STRING,
        allowNull: true
    }
}, {
    tableName: 'configuraciones',
    timestamps: false
});

module.exports = Configuracion;