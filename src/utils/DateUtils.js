const moment = require('moment');

const DateUtils = {
    getDate: () => {
        const fechaHora = moment().format('YYYY-MM-DD HH:mm:ss');
        return fechaHora;
    }
};

module.exports = DateUtils;