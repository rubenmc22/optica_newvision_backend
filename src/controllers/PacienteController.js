const VerificationUtils = require('../utils/VerificationUtils');
const Paciente = require('./../models/Paciente');

const PacienteController = {
    add: async (req, res) => {
        try {
            if (!req.user) {
                throw { message: "Sesion invalida." };
            }

            const {
                nombreCompleto: nombre,
                cedula: cedula,
                telefono: telefono,
                email: email,
                fechaNacimiento: fecha_nacimiento,
                ocupacion: ocupacion,
                genero: genero,
                direccion: direccion,
                redesSociales: redes_sociales,
            } = req.body;

            const paciente_id = `${req.sede.id}-${cedula}`;

            const cant = await Paciente.count({ where: { pkey: paciente_id } });
            if(cant > 0) {
                throw { message: `Ya esta registrada la cedula '${cedula}' en la sede '${req.sede.nombre}'.` };
            }
            if (!VerificationUtils.verify_cedula(cedula)) {
                throw { message: "La cedula no es valida." };
            }
            if (!VerificationUtils.verify_nombre(nombre)) {
                throw { message: "El nombre no puede estar vacio." };
            }
            if (!VerificationUtils.verify_fecha(fecha_nacimiento)) {
                throw { message: "La fecha no tiene el formato correcto" };
            }
            if (telefono != null && !VerificationUtils.verify_telefono(telefono)) {
                throw { message: "El telefono debe contener 11 digitos." };
            }
            if (email != null && !VerificationUtils.verify_correo(email)) {
                throw { message: "El correo no es valido." };
            }
            if(!['m','f'].includes(genero.toLowerCase())) {
                throw { message: "El genero debe ser 'm' (Masculino) o 'f' (Femenino)." };
            }
            if(!validar_array_redes_sociales(redes_sociales)) {
                throw { message: "Las redes sociales enviadas no tienen el formato esperado: [{platform, username}]" };
            }

            const paciente = await Paciente.create({
                pkey: paciente_id,
                sede_id: req.sede.id,
                cedula: cedula,
                nombre: nombre,
                fecha_nacimiento: fecha_nacimiento,
                telefono: (telefono == null) ? "" : telefono,
                email: (email == null) ? "" : email,
                ocupacion: (ocupacion == null) ? "" : ocupacion,
                genero: genero.toLowerCase(),
                direccion: (direccion == null) ? "" : direccion,
                redes_sociales: redes_sociales
            });
            
            const objPaciente = paciente.get({ plain: true });
            objPaciente.key = objPaciente.pkey;
            delete objPaciente.id;
            delete objPaciente.pkey;
            res.status(200).json({ message: 'ok', paciente: objPaciente });
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

            const id = req.params.id;
            const objPaciente = await Paciente.findOne({ where: { pkey: id } });
            if(!objPaciente) {
                throw { message: "El paciente enviado no existe." };
            }
            if(objPaciente.sede_id != req.sede.id) {
                throw { message: "No se puede modificar pacientes de otras sedes." };
            }
            
            const {
                nombreCompleto: nombre,
                cedula: cedula,
                telefono: telefono,
                email: email,
                fechaNacimiento: fecha_nacimiento,
                ocupacion: ocupacion,
                genero: genero,
                direccion: direccion,
                redesSociales: redes_sociales,
            } = req.body;

            if (!VerificationUtils.verify_cedula(cedula)) {
                throw { message: "La cedula no es valida." };
            }
            if (!VerificationUtils.verify_nombre(nombre)) {
                throw { message: "El nombre no puede estar vacio." };
            }
            if (!VerificationUtils.verify_fecha(fecha_nacimiento)) {
                throw { message: "La fecha no tiene el formato correcto" };
            }
            if (telefono != null && !VerificationUtils.verify_telefono(telefono)) {
                throw { message: "El telefono debe contener 11 digitos." };
            }
            if (email != null && !VerificationUtils.verify_correo(email)) {
                throw { message: "El correo no es valido." };
            }
            if(!['m','f'].includes(genero.toLowerCase())) {
                throw { message: "El genero debe ser 'm' (Masculino) o 'f' (Femenino)." };
            }
            if(!validar_array_redes_sociales(redes_sociales)) {
                throw { message: "Las redes sociales enviadas no tienen el formato esperado: [{platform, username}]" };
            }

            if(objPaciente.cedula != cedula) {
                const paciente_id = `${req.sede.id}-${cedula}`;
                const cant = await Paciente.count({ where: { pkey: paciente_id } });
                if(cant > 0) {
                    throw { message: `Ya esta registrada la cedula '${cedula}' en la sede '${req.sede.nombre}'.` };
                }

                objPaciente.pkey = paciente_id;
                objPaciente.cedula = cedula;
            }

            objPaciente.nombre = nombre;
            objPaciente.fecha_nacimiento = fecha_nacimiento;
            objPaciente.telefono = (telefono == null) ? "" : telefono;
            objPaciente.email = (email == null) ? "" : email;
            objPaciente.ocupacion = (ocupacion == null) ? "" : ocupacion;
            objPaciente.genero = genero.toLowerCase();
            objPaciente.direccion = (direccion == null) ? "" : direccion;
            objPaciente.redes_sociales = redes_sociales;
            objPaciente.save();
            
            const paciente = objPaciente.get({ plain: true });
            paciente.key = paciente.pkey;
            delete paciente.id;
            delete paciente.pkey;
            res.status(200).json({ message: 'ok', paciente: paciente });
        } catch (err) {
            console.error(err);
            res.status(400).json(err);
        }
    },
    
    get: async (req, res) => {
        try {
            if (!req.user) {
                throw { message: "Sesion invalida." };
            }

            const paciente_id = req.params.id;
            let pacientes = [];

            if (paciente_id) {
                pacientes = await Paciente.findAll({
                    where: { pkey: paciente_id },
                    attributes: [['pkey', 'key'],'cedula','nombre','fecha_nacimiento','telefono','email','ocupacion','genero','direccion','redes_sociales','created_at','updated_at'],
                    include: ['sede']
                });
            } else {
                pacientes = await Paciente.findAll({
                    attributes: [['pkey', 'key'],'cedula','nombre','fecha_nacimiento','telefono','email','ocupacion','genero','direccion','redes_sociales','created_at','updated_at'],
                    include: ['sede']
                });
            }
            
            res.status(200).json({ message: 'ok', pacientes: pacientes });
        } catch (err) {
            console.error(err);
            res.status(400).json(err);
        }
    },
    
    delete: async (req, res) => {
        try {
            if (!req.user) {
                throw { message: "Sesion invalida." };
            }

            const paciente_id = req.params.id;

            const paciente = await Paciente.findOne({ where: { pkey: paciente_id } });
            if (!paciente) {
                throw { message: "Paciente no existe." };
            }
            if(paciente.sede_id != req.sede.id) {
                throw { message: "No se puede eliminar pacientes de otras sedes." };
            }
            await paciente.destroy();
            
            res.status(200).json({ message: 'ok' });
        } catch (err) {
            console.error(err);
            res.status(400).json(err);
        }
    },
};

function validar_array_redes_sociales(redes) {
  return (
    Array.isArray(redes) &&
    redes.every(item =>
      typeof item === 'object' &&
      item !== null &&
      'platform' in item &&
      'username' in item
    )
  );
}

module.exports = PacienteController;