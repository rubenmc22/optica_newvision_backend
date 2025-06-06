const nodemailer = require('nodemailer');

const transporter = nodemailer.createTransport({
    // host: 'mail.apollogroupsport.com',
    // port: 465,
    service: "gmail",
    secure: true,
    auth: {
      user: process.env.EMAIL_USER,
      pass: process.env.EMAIL_PASS
    },
    connectionTimeout: 10000,
    socketTimeout: 10000,
    logger: true,
    debug: true
});

const correo = {
    send: async (to, subject, html) => {
        try {
            // Configurar el correo
            const mailOptions = {
                // from: process.env.EMAIL_USER,
                from: `"${process.env.EMAIL_NAME}" <${process.env.EMAIL_USER}>`,
                to, // Destinatario
                subject, // Asunto
                html: html, // Cuerpo del correo (HTML opcional),
                headers: {
                    'X-Mailer': 'NodeMailer',
                    'X-Priority': '1'
                }
            };
    
            const info = await transporter.sendMail(mailOptions);
            console.log('Correo enviado:', info.messageId);
            return info;
        } catch (err) {
            console.error('Error al enviar el correo:', err);
            throw err;
        }
    }
};

module.exports = correo;
