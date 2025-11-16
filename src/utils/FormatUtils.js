const FormatUtils = {
    int(valor) {
        return parseInt(valor);
    },

    float(valor) {
        return parseFloat( Number(valor).toFixed(2) );
    },

    boolean(valor) {
        if([1,'1','true',true].includes(valor)) {
            return true;
        } else if([0,'0','false',false].includes(valor)) {
            return false;
        } else {
            return null;
        }
    }
};

module.exports = FormatUtils;