const HistorialMedico = require('../models/HistorialMedico');
const Paciente = require('../models/Paciente');
const VerificationUtils = require('../utils/VerificationUtils');

const HistorialMedicoController = {
    add: async (req, res) => {
        try {
            if (!req.user) {
                throw { message: "Sesion invalida." };
            }

            const {
                pacienteId,
                datosConsulta,
                examenOcular,
                diagnosticoTratamiento,
                recomendaciones,
                conformidad,
            } = req.body;

            const objPaciente = await Paciente.findOne({ where: { pkey: pacienteId } });
            if (!objPaciente) {
                throw { message: `El paciente no existe.` };
            }

            const now = new Date();
            const fecha = now.toISOString().slice(0, 10);
            const hora = now.toTimeString().slice(0, 5);
            const fecha_especial = fecha.replaceAll("-", "");

            const count_registros_hoy = await HistorialMedico.count({
                where: { fecha: fecha }
            });
            const count_especial = (count_registros_hoy + 1).toString().padStart(3, '0');
            
            const objHistorial = await HistorialMedico.create({
                // ========================================
                numero: `H-${fecha_especial}-${count_especial}`,
                fecha: fecha,
                hora: hora,
                paciente_id: objPaciente.pkey,
                // ========================================
                motivo_consulta: datosConsulta.motivo,
                otro_motivo_consulta: datosConsulta.otroMotivo,
                medico: datosConsulta.medico,
                asesor: datosConsulta.asesor,
                cedula_asesor: datosConsulta.cedulaAsesor,
                // ========================================
                examen_ocular_lensometria: examenOcular.lensometria,
                examen_ocular_refraccion: examenOcular.refraccion,
                examen_ocular_refraccion_final: examenOcular.refraccionFinal,
                examen_ocular_avsc_avae_otros: examenOcular.avsc_avae_otros,
                // ========================================
                diagnostico: diagnosticoTratamiento.diagnostico,
                tratamiento: diagnosticoTratamiento.tratamiento,
                // ========================================
                recomendaciones: recomendaciones,
                // ========================================
                conformidad_nota: conformidad.notaConformidad,
                conformidad_firma_paciente: conformidad.firmaPaciente,
                conformidad_firma_medico: conformidad.firmaMedico,
                conformidad_firma_asesor: conformidad.firmaAsesor,
                // ========================================
                created_by: req.user.cedula,
                updated_by: req.user.cedula,
                // ========================================
            });

            const historial = objHistorial.get({ plain: true });
            const historial_medico = {
                id: historial.id,
                nHistoria: historial.numero,
                fecha: historial.fecha,
                horaEvaluacion: historial.hora,
                pacienteId: historial.paciente_id,

                datosConsulta: {
                    motivo: historial.motivo_consulta,
                    otroMotivo: historial.otro_motivo_consulta,
                    medico: historial.medico,
                    asesor: historial.asesor,
                    cedulaAsesor: historial.cedula_asesor,
                },

                antecedentes: {
                    usuarioLentes: objPaciente.tiene_lentes,
                    fotofobia: objPaciente.fotofobia,
                    traumatismoOcular: objPaciente.traumatismo_ocular,
                    traumatismoOcularDescripcion: objPaciente.traumatismo_ocular_descripcion,
                    cirugiaOcular: objPaciente.cirugia_ocular,
                    cirugiaOcularDescripcion: objPaciente.cirugia_ocular_descripcion,
                    alergicoA: objPaciente.alergias,
                    antecedentesPersonales: objPaciente.antecedentes_personales,
                    antecedentesFamiliares: objPaciente.antecedentes_familiares,
                    patologias: objPaciente.patologias,
                    patologiaOcular: objPaciente.patologia_ocular
                },

                examenOcular: {
                    lensometria: historial.examen_ocular_lensometria,
                    refraccion: historial.examen_ocular_refraccion,
                    refraccionFinal: historial.examen_ocular_refraccion_final,
                    avsc_avae_otros: historial.examen_ocular_avsc_avae_otros,
                },

                diagnosticoTratamiento: {
                    diagnostico: historial.diagnostico,
                    tratamiento: historial.tratamiento,
                },

                recomendaciones: historial.recomendaciones,

                conformidad: {
                    notaConformidad: historial.conformidad_nota,
                    firmaPaciente: historial.conformidad_firma_paciente,
                    firmaMedico: historial.conformidad_firma_medico,
                    firmaAsesor: historial.conformidad_firma_asesor,
                },

                auditoria: {
                    fechaCreacion: historial.created_at,
                    fechaActualizacion: historial.updated_at,
                    creadoPor: historial.created_by,
                    actualizadoPor: historial.updated_by,
                }
            };

            res.status(200).json({ message: 'ok', historial_medico: historial_medico });
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

            const historial_numero = req.params.id;
            const objHistorial = await HistorialMedico.findOne({ where: { numero: historial_numero } });
            if (!objHistorial) {
                throw { message: `Historial medico '${historial_numero}' no existe.` };
            }

            const objPaciente = await Paciente.findOne({ where: { pkey: objHistorial.paciente_id } });
            if (!objPaciente) {
                throw { message: `El paciente del historial medico '${historial_numero}' no existe.` };
            }

            if(objPaciente.sede_id != req.sede.id) {
                throw { message: "No se puede modificar historial medicos de pacientes de otras sedes." };
            }
            
            const {
                datosConsulta,
                examenOcular,
                diagnosticoTratamiento,
                recomendaciones,
                conformidad,
            } = req.body;

            // ========================================
            objHistorial.motivo_consulta = datosConsulta.motivo;
            objHistorial.otro_motivo_consulta = datosConsulta.otroMotivo;
            objHistorial.medico = datosConsulta.medico;
            objHistorial.asesor = datosConsulta.asesor;
            objHistorial.cedula_asesor = datosConsulta.cedulaAsesor;
            // ========================================
            objHistorial.examen_ocular_lensometria = examenOcular.lensometria;
            objHistorial.examen_ocular_refraccion = examenOcular.refraccion;
            objHistorial.examen_ocular_refraccion_final = examenOcular.refraccionFinal;
            objHistorial.examen_ocular_avsc_avae_otros = examenOcular.avsc_avae_otros;
            // ========================================
            objHistorial.diagnostico = diagnosticoTratamiento.diagnostico;
            objHistorial.tratamiento = diagnosticoTratamiento.tratamiento;
            // ========================================
            objHistorial.recomendaciones = recomendaciones;
            // ========================================
            objHistorial.conformidad_nota = conformidad.notaConformidad;
            objHistorial.conformidad_firma_paciente = conformidad.firmaPaciente;
            objHistorial.conformidad_firma_medico = conformidad.firmaMedico;
            objHistorial.conformidad_firma_asesor = conformidad.firmaAsesor;
            // ========================================
            objHistorial.updated_by = req.user.cedula;
            // ========================================
            objHistorial.save();

            res.status(200).json({ message: 'ok', historial_medico: objHistorial });
        } catch (err) {
            console.error(err);
            res.status(400).json(err);
        }
    },
    
    get_all: async (req, res) => {
        try {
            if (!req.user) {
                throw { message: "Sesion invalida." };
            }

            const historial_numero = req.params.id;
            let historiales_bd = [];

            if (historial_numero) {
                historiales_bd = await HistorialMedico.findAll({
                    where: { numero: historial_numero },
                    include: ['paciente']
                });
            } else {
                historiales_bd = await HistorialMedico.findAll({
                    include: ['paciente']
                });
            }

            let historiales_output = [];
            for(let historial of historiales_bd) {
                historiales_output.push({
                    id: historial.id,
                    nHistoria: historial.numero,
                    fecha: historial.fecha,
                    horaEvaluacion: historial.hora,
                    pacienteId: historial.paciente_id,

                    datosConsulta: {
                        motivo: historial.motivo_consulta,
                        otroMotivo: historial.otro_motivo_consulta,
                        medico: historial.medico,
                        asesor: historial.asesor,
                        cedulaAsesor: historial.cedula_asesor,
                    },

                    antecedentes: {
                        usuarioLentes: historial.paciente.tiene_lentes,
                        fotofobia: historial.paciente.fotofobia,
                        traumatismoOcular: historial.paciente.traumatismo_ocular,
                        traumatismoOcularDescripcion: historial.paciente.traumatismo_ocular_descripcion,
                        cirugiaOcular: historial.paciente.cirugia_ocular,
                        cirugiaOcularDescripcion: historial.paciente.cirugia_ocular_descripcion,
                        alergicoA: historial.paciente.alergias,
                        antecedentesPersonales: historial.paciente.antecedentes_personales,
                        antecedentesFamiliares: historial.paciente.antecedentes_familiares,
                        patologias: historial.paciente.patologias,
                        patologiaOcular: historial.paciente.patologia_ocular
                    },

                    examenOcular: {
                        lensometria: historial.examen_ocular_lensometria,
                        refraccion: historial.examen_ocular_refraccion,
                        refraccionFinal: historial.examen_ocular_refraccion_final,
                        avsc_avae_otros: historial.examen_ocular_avsc_avae_otros,
                    },

                    diagnosticoTratamiento: {
                        diagnostico: historial.diagnostico,
                        tratamiento: historial.tratamiento,
                    },

                    recomendaciones: historial.recomendaciones,

                    conformidad: {
                        notaConformidad: historial.conformidad_nota,
                        firmaPaciente: historial.conformidad_firma_paciente,
                        firmaMedico: historial.conformidad_firma_medico,
                        firmaAsesor: historial.conformidad_firma_asesor,
                    },

                    auditoria: {
                        fechaCreacion: historial.created_at,
                        fechaActualizacion: historial.updated_at,
                        creadoPor: historial.created_by,
                        actualizadoPor: historial.updated_by,
                    }
                });
            }
            
            res.status(200).json({ message: 'ok', historiales_medicos: historiales_output });
        } catch (err) {
            console.error(err);
            res.status(400).json(err);
        }
    },

    get_paciente: async (req, res) => {
            if (!req.user) {
                throw { message: "Sesion invalida." };
            }

            const paciente_id = req.params.paciente_id;
            let historiales_bd = [];

            historiales_bd = await HistorialMedico.findAll({
                where: { paciente_id: paciente_id },
                include: ['paciente']
            });

            let historiales_output = [];
            for(let historial of historiales_bd) {
                historiales_output.push({
                    id: historial.id,
                    nHistoria: historial.numero,
                    fecha: historial.fecha,
                    horaEvaluacion: historial.hora,
                    pacienteId: historial.paciente_id,

                    datosConsulta: {
                        motivo: historial.motivo_consulta,
                        otroMotivo: historial.otro_motivo_consulta,
                        medico: historial.medico,
                        asesor: historial.asesor,
                        cedulaAsesor: historial.cedula_asesor,
                    },

                    antecedentes: {
                        usuarioLentes: historial.paciente.tiene_lentes,
                        fotofobia: historial.paciente.fotofobia,
                        traumatismoOcular: historial.paciente.traumatismo_ocular,
                        traumatismoOcularDescripcion: historial.paciente.traumatismo_ocular_descripcion,
                        cirugiaOcular: historial.paciente.cirugia_ocular,
                        cirugiaOcularDescripcion: historial.paciente.cirugia_ocular_descripcion,
                        alergicoA: historial.paciente.alergias,
                        antecedentesPersonales: historial.paciente.antecedentes_personales,
                        antecedentesFamiliares: historial.paciente.antecedentes_familiares,
                        patologias: historial.paciente.patologias,
                        patologiaOcular: historial.paciente.patologia_ocular
                    },

                    examenOcular: {
                        lensometria: historial.examen_ocular_lensometria,
                        refraccion: historial.examen_ocular_refraccion,
                        refraccionFinal: historial.examen_ocular_refraccion_final,
                        avsc_avae_otros: historial.examen_ocular_avsc_avae_otros,
                    },

                    diagnosticoTratamiento: {
                        diagnostico: historial.diagnostico,
                        tratamiento: historial.tratamiento,
                    },

                    recomendaciones: historial.recomendaciones,

                    conformidad: {
                        notaConformidad: historial.conformidad_nota,
                        firmaPaciente: historial.conformidad_firma_paciente,
                        firmaMedico: historial.conformidad_firma_medico,
                        firmaAsesor: historial.conformidad_firma_asesor,
                    },

                    auditoria: {
                        fechaCreacion: historial.created_at,
                        fechaActualizacion: historial.updated_at,
                        creadoPor: historial.created_by,
                        actualizadoPor: historial.updated_by,
                    }
                });
            }
            
            res.status(200).json({ message: 'ok', historiales_medicos: historiales_output });
    },
    
    delete: async (req, res) => {
        try {
            if (!req.user) {
                throw { message: "Sesion invalida." };
            }

            const historial_numero = req.params.id;

            const objHistorial = await HistorialMedico.findOne({ where: { numero: historial_numero } });
            if (!objHistorial) {
                throw { message: `Historial medico '${historial_numero}' no existe.` };
            }

            const objPaciente = await Paciente.findOne({ where: { pkey: objHistorial.paciente_id } });
            if (!objPaciente) {
                throw { message: `El paciente del historial medico '${historial_numero}' no existe.` };
            }

            if(objPaciente.sede_id != req.sede.id) {
                throw { message: "No se puede eliminar historial medicos de pacientes de otras sedes." };
            }
            
            await objHistorial.destroy();
            
            res.status(200).json({ message: 'ok' });
        } catch (err) {
            console.error(err);
            res.status(400).json(err);
        }
    },
};

module.exports = HistorialMedicoController;
