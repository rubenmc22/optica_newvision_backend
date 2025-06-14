const Tasa = require("../models/tasa");
const VerificationUtils = require("../utils/VerificationUtils");
const axios = require('axios');
const cheerio = require('cheerio');
const { Op } = require('sequelize');
const TasaHistorial = require("../models/TasaHistorial");

const TasasController = {
    get: async (req, res) => {
        try {
            if (!req.user) {
                throw { message: "Sesion invalida." };
            }

            await asegurar_existencia_tasas();
            
            const id = req.params.id;
            let tasas = [];
            
            // Consultamos las tasas
            if (id) {
                tasas = await Tasa.findAll({
                    where: { id: id },
                    attributes: ['id','nombre','simbolo','valor','updated_at']
                });
            } else {
                tasas = await Tasa.findAll({
                    attributes: ['id','nombre','simbolo','valor','updated_at']
                });
            }

            /**
             * Fin
             */
            res.status(200).json({ message: 'ok', tasas: tasas });
        } catch (err) {
            console.error(err);
            res.status(400).json(err);
        }
    },
    
    update: async (req, res) => {
        try {
            if (!req.user) {
                throw { message: "Sesion invalida." };
            }

            await asegurar_existencia_tasas();

            const id = req.params.id;
            const {
                valor: valor,
            } = req.body;

            const objTasa = await Tasa.findOne({ where: { id: id } });
            if(!objTasa) {
                throw { message: `La tasa enviada no existe: '${id}'` };
            }
            if(!VerificationUtils.verify_numero(valor)) {
                throw { message: `El valor enviado no es numerico: '${valor}'` };
            }

            let valor_numerico = Number(valor);
            valor_numerico = Number(valor_numerico.toFixed(4));

            const valor_anterior = objTasa.valor;

            objTasa.valor = valor_numerico;
            await objTasa.save();

            if(objTasa.valor != valor_anterior) {
                await TasaHistorial.create({
                    tasa_id: id,
                    valor_nuevo: valor,
                    usu_cedula: req.user.cedula,
                });
            }
            
            res.status(200).json({ message: 'ok', tasa: objTasa });
        } catch (err) {
            console.error(err);
            res.status(400).json(err);
        }
    },
    
    update_with_bcv: async (req, res) => {
        try {
            if (!req.user) {
                throw { message: "Sesion invalida." };
            }

            await asegurar_existencia_tasas();
            const tasas_bcv = await obtenerDolarBCV();
            if(typeof tasas_bcv === 'string') {
                throw { message: tasas_bcv };
            }

            for(const tasa_id of ['dolar', 'euro']) {
                const objTasa = await Tasa.findOne({ where: { id: tasa_id } });

                let valor_numerico = Number(tasas_bcv[tasa_id]);
                valor_numerico = Number(valor_numerico.toFixed(4));

                const valor_anterior = objTasa.valor;

                objTasa.valor = valor_numerico;
                await objTasa.save();

                if(objTasa.valor != valor_anterior) {
                    await TasaHistorial.create({
                        tasa_id: objTasa.id,
                        valor_nuevo: objTasa.valor,
                        usu_cedula: req.user.cedula,
                    });
                }
            }

            const tasas = await Tasa.findAll({
                where: { id: { [Op.in]: ['dolar', 'euro'] } },
                attributes: ['id', 'nombre', 'simbolo', 'valor', 'updated_at']
            });

            res.status(200).json({ message: 'ok', tasa: tasas });
        } catch (err) {
            console.error(err);
            res.status(400).json(err);
        }
    },
};

async function asegurar_existencia_tasas() {
    // Creamos las tasas si no existen
    const tasas_existentes = ['dolar','euro'];
    for(const tasa_existente of tasas_existentes) {
        const existingTasa = await Tasa.count({ where: { id: tasa_existente } }) > 0;
        if (!existingTasa) {
            const objTasa = await Tasa.create({
                id: tasa_existente,
                nombre: tasa_existente,
                simbolo: "$",
                valor: 1,
            });
        }
    }
}

async function obtenerDolarBCV() {
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
    console.error(`Error al obtener el valor de las tasas: ${error}`);
    return `Error al obtener el valor de las tasas.`;
  }
}

module.exports = TasasController;