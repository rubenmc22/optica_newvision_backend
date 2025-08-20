const cron = require('node-cron');
const DateUtils = require('../utils/DateUtils');
const axios = require('axios');
const cheerio = require('cheerio');
const HistorialRastreoBcv = require('../models/HistorialRastreoBcv');
const Tasa = require('../models/Tasa');
const TasaHistorial = require('../models/TasaHistorial');

module.exports = () => {
  cron.schedule('*/1 * * * *', async () => {
    const ahora = new Date();
    const timestamp = Date.now();
    const date = DateUtils.getDate();
    const horas = ahora.getHours().toString().padStart(2, '0');
    const minutos = ahora.getMinutes().toString().padStart(2, '0');
    const segundos = ahora.getSeconds().toString().padStart(2, '0');

    try {
        // Validar rastreo
        const array_tasas = await Tasa.findAll({
            where: { rastreo_bcv: 1 }
        });

        if(array_tasas.length < 1) {
            return;
        }

        const tasas_bcv = await obtenerTasasBCV();
        if(typeof tasas_bcv === 'string') {
            throw { message: tasas_bcv };
        }

        let tasas_guardadas = {};

        for(let objTasa of array_tasas) {
            if(tasas_bcv[objTasa.id] === undefined) {
                continue;
            }
            tasas_guardadas[objTasa.id] = tasas_bcv[objTasa.id];
            let valor_numerico = Number(tasas_bcv[objTasa.id]);
            valor_numerico = Number(valor_numerico.toFixed(4));

            objTasa.valor = valor_numerico;
            objTasa.ultimo_tipo_cambio = 'Automatico con BCV';
            await objTasa.save();

            await TasaHistorial.create({
                tasa_id: objTasa.id,
                valor_nuevo: objTasa.valor,
                usu_cedula: null,
                tipo_cambio: 'Automatico con BCV',
            });
        }

        await HistorialRastreoBcv.create({
            fecha: date,
            hora: `${horas}:${minutos}:${segundos}`,
            rastreado: 1,
            respuesta: JSON.stringify(tasas_guardadas),
            comentario: null
        });
    } catch(err) {
        await HistorialRastreoBcv.create({
            fecha: date,
            hora: `${horas}:${minutos}:${segundos}`,
            rastreado: 0,
            respuesta: null,
            comentario: err.message
        });
        console.error("Error al consultar las tasas: " + err.message);
    }
  });
};

async function obtenerTasasBCV() {
  try {
    let output = { dolar: "", euro: "" };

    // Hacer la solicitud HTTP
    const { data } = await axios.get('https://www.bcv.org.ve/', {
      httpsAgent: new (require('https').Agent)({ rejectUnauthorized: false }) // Ignorar verificación SSL
    });

    // Cargar el HTML en Cheerio
    const $ = cheerio.load(data);

    // Extraer el contenido del elemento con id "dolar"
    const valor_dolar = $('#dolar .centrado').text().trim();
    output.dolar = valor_dolar.replace(',','.');
    
    const valor_euro = $('#euro .centrado').text().trim();
    output.euro = valor_euro.replace(',','.');

    return output;
  } catch (error) {
    return error;
  }
}
