const crypto = require('crypto');

const HashUtils = {
    generate: (value) => {
        return crypto.createHash('md5').update(String(value)).digest('hex');
    }
};

module.exports = HashUtils;