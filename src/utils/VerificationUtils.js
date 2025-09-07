const crypto = require('crypto');

const VerificationUtils = {
    verify_cedula(valor) {
        return (/^\d{4,}$/.test(valor));
    },

    verify_correo(valor) {
        return (valor && /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(valor));
    },

    verify_clave(valor) {
        return (valor && valor.length >= 6);
    },

    verify_nombre(valor) {
        return (valor && valor.trim().length > 1);
    },

    verify_telefono(valor) {
        // Verifica el formato si hay un valor
        return (/^\d{10,14}$/.test(valor));
    },

    verify_fecha(valor) {
        // Si el valor está vacío, nulo o indefinido, es válido (opcional)
        if (!valor || valor.trim() === '') {
            return true;
        }

        // Si tiene valor, verifica que sea una fecha en formato YYYY-MM-DD
        return /^\d{4}-\d{2}-\d{2}$/.test(valor);
    },

    verify_otp(valor) {
        return (/^\d{6}$/.test(valor));
    },

    verify_numero(valor) {
        return !isNaN(valor) && !isNaN(parseFloat(valor));
    },

    verify_boolean(valor) {
        return typeof valor === 'boolean';
    }
};

module.exports = VerificationUtils;