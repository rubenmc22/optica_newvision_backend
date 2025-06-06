const crypto = require('crypto');
const Otp = require('../models/Otp');

const OtpUtils = {
    GenerarOTP: () => {
        let codigo = crypto.randomInt(0, 1000000);
        let otp = String(codigo).padStart(6, '0');
        return otp;
    }
};

module.exports = OtpUtils;