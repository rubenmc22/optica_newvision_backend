const fs = require('fs');

const FilesUtils = {
    readfile: (pathfile) => {
        try {
            const contenido = fs.readFileSync(pathfile, 'utf8');
            return contenido;
        } catch (error) {
            console.error("Error al leer el archivo HTML:", error);
            throw { message: 'Error interno.' };
        }
    }
};

module.exports = FilesUtils;
