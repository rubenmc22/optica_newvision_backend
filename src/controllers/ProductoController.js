const Tasa = require('../models/Tasa');
const VerificationUtils = require('../utils/VerificationUtils');
const Producto = require('./../models/Producto');
const { Op } = require('sequelize');
const upload = require('../config/uploader');
const multer = require('multer');

const ProductoController = {
    add: async (req, res) => {
        try {
            if (!req.user) {
                throw { message: "Sesion invalida." };
            }

            const {
                nombre,
                marca,
                color,
                codigo,
                material,
                proveedor,
                categoria,
                stock,
                precio,
                moneda,
                activo,
                descripcion
            } = req.body;

            if (!VerificationUtils.verify_nombre(nombre)) {
                throw { message: "El nombre no puede quedar vacio." };
            }
            if (!VerificationUtils.verify_nombre(marca)) {
                throw { message: "La marca no puede quedar vacio." };
            }
            if (!VerificationUtils.verify_nombre(color)) {
                throw { message: "El color no puede quedar vacio." };
            }
            if (!VerificationUtils.verify_nombre(codigo)) {
                throw { message: "El codigo no puede quedar vacio." };
            }
            if (!VerificationUtils.verify_nombre(material)) {
                throw { message: "El material no puede quedar vacio." };
            }
            if (!VerificationUtils.verify_nombre(proveedor)) {
                throw { message: "El proveedor no puede quedar vacio." };
            }
            if (!VerificationUtils.verify_nombre(categoria)) {
                throw { message: "La categoria no puede quedar vacio." };
            }
            if (!VerificationUtils.verify_numero(stock)) {
                throw { message: "El stock debe ser numerico" };
            }
            if (!VerificationUtils.verify_numero(precio)) {
                throw { message: "El precio debe ser numerico" };
            }
            if (!VerificationUtils.verify_boolean(activo)) {
                throw { message: "El parametro 'activo' debe ser booleano." };
            }

            const objTasa = await Tasa.findOne({ where: { id: moneda } });
            if (!objTasa) {
                throw { message: "La moneda enviada no existe: " + moneda + "." };
            }

            const count = await Producto.count({
                where: {
                    sede_id: req.sede.id,
                    nombre: nombre,
                    marca: marca,
                    color: color,
                    categoria: categoria
                }
            });
            if (count > 0) {
                throw { message: "Ya existe un producto con el mismo nombre, marca, color y categoria en la sede actual." };
            }

            const objProducto = await Producto.create({
                sede_id: req.sede.id,
                nombre: nombre,
                marca: marca,
                color: color,
                codigo: codigo,
                material: material,
                proveedor: proveedor,
                categoria: categoria,
                stock: stock,
                precio: precio,
                moneda: objTasa.id,
                activo: activo,
                descripcion: descripcion
            });

            const producto = objProducto.get({ plain: true });
            const producto_output = {
                id: producto.id,
                sede_id: producto.sede_id,
                nombre: producto.nombre,
                marca: producto.marca,
                color: producto.color,
                codigo: producto.codigo,
                material: producto.material,
                proveedor: producto.proveedor,
                categoria: producto.categoria,
                stock: producto.stock,
                precio: producto.precio,
                moneda: producto.moneda,
                activo: producto.activo,
                descripcion: producto.descripcion,
                imagen_url: producto.imagen_url,
                created_at: producto.created_at,
                updated_at: producto.updated_at,
            };
            res.status(200).json({ message: 'ok', producto: producto_output });
        } catch (err) {
            console.error(err);
            res.status(400).json(err);
        }
    },

    upload_image: async (req, res) => {
        try {
            if (!req.user) {
                throw { message: "Sesion invalida." };
            }

            const id = req.params.id;
            const objProducto = await Producto.findOne({ where: { id: id } });
            if (!objProducto) {
                throw { message: "El producto enviado no existe." };
            }

            // Usamos el middleware de Multer para manejar la subida
            req.nombre_imagen = `product-${objProducto.id}`;
            upload.single('imagen')(req, res, async (err) => {
                if (err) {
                    if (err instanceof multer.MulterError) {
                        return res.status(400).json({ error: err.message });
                    } else if (err) {
                        return res.status(400).json({ error: err.message });
                    }
                }

                if (!req.file) {
                    return res.status(400).json({ error: 'No se subió ningún archivo o el formato no es válido' });
                }

                // La imagen se guardó correctamente
                const imageUrl = `/public/images/${req.file.filename}`;
                objProducto.imagen_url = imageUrl+"?t=" + Date.now();
                objProducto.save();

                res.status(200).json({ message: 'ok', image_url: objProducto.imagen_url });
            });
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
            const objProducto = await Producto.findOne({ where: { id: id } });
            if (!objProducto) {
                throw { message: "El producto enviado no existe." };
            }
            if (objProducto.sede_id != req.sede.id) {
                throw { message: "No se puede modificar productos de otras sedes." };
            }

            const {
                nombre,
                marca,
                color,
                codigo,
                material,
                proveedor,
                categoria,
                stock,
                precio,
                moneda,
                activo,
                descripcion
            } = req.body;

            if (!VerificationUtils.verify_nombre(nombre)) {
                throw { message: "El nombre no puede quedar vacio." };
            }
            if (!VerificationUtils.verify_nombre(marca)) {
                throw { message: "La marca no puede quedar vacio." };
            }
            if (!VerificationUtils.verify_nombre(color)) {
                throw { message: "El color no puede quedar vacio." };
            }
            if (!VerificationUtils.verify_nombre(codigo)) {
                throw { message: "El codigo no puede quedar vacio." };
            }
            if (!VerificationUtils.verify_nombre(material)) {
                throw { message: "El material no puede quedar vacio." };
            }
            if (!VerificationUtils.verify_nombre(proveedor)) {
                throw { message: "El proveedor no puede quedar vacio." };
            }
            if (!VerificationUtils.verify_nombre(categoria)) {
                throw { message: "La categoria no puede quedar vacio." };
            }
            if (!VerificationUtils.verify_numero(stock)) {
                throw { message: "El stock debe ser numerico" };
            }
            if (!VerificationUtils.verify_numero(precio)) {
                throw { message: "El precio debe ser numerico" };
            }
            if (!VerificationUtils.verify_boolean(activo)) {
                throw { message: "El parametro 'activo' debe ser booleano." };
            }

            const count = await Producto.count({
                where: {
                    id: { [Op.ne]: objProducto.id },
                    sede_id: req.sede.id,
                    nombre: nombre,
                    marca: marca,
                    color: color,
                    categoria: categoria
                }
            });
            if (count > 0) {
                throw { message: "Ya existe un producto con el mismo nombre, marca, color y categoria en la sede actual." };
            }

            objProducto.nombre = nombre;
            objProducto.marca = marca;
            objProducto.color = color;
            objProducto.codigo = codigo;
            objProducto.material = material;
            objProducto.proveedor = proveedor;
            objProducto.categoria = categoria;
            objProducto.stock = stock;
            objProducto.precio = precio;
            objProducto.moneda = moneda;
            objProducto.activo = activo;
            objProducto.descripcion = descripcion;

            objProducto.save();

            const producto = objProducto.get({ plain: true });
            const producto_output = {
                id: producto.id,
                sede_id: producto.sede_id,
                nombre: producto.nombre,
                marca: producto.marca,
                color: producto.color,
                codigo: producto.codigo,
                material: producto.material,
                proveedor: producto.proveedor,
                categoria: producto.categoria,
                stock: producto.stock,
                precio: producto.precio,
                moneda: producto.moneda,
                activo: producto.activo,
                descripcion: producto.descripcion,
                imagen_url: producto.imagen_url,
                created_at: producto.created_at,
                updated_at: producto.updated_at,
            };

            res.status(200).json({ message: 'ok', producto: producto_output });
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

            const producto_id = req.params.id;
            let productos_db = [];

            if (producto_id) {
                productos_db = await Producto.findAll({
                    where: { pkey: producto_id }
                });
            } else {
                productos_db = await Producto.findAll({});
            }

            let productos_output = [];
            for (let producto of productos_db) {
                productos_output.push({
                    id: producto.id,
                    sede_id: producto.sede_id,
                    nombre: producto.nombre,
                    marca: producto.marca,
                    color: producto.color,
                    codigo: producto.codigo,
                    material: producto.material,
                    proveedor: producto.proveedor,
                    categoria: producto.categoria,
                    stock: producto.stock,
                    precio: producto.precio,
                    moneda: producto.moneda,
                    activo: producto.activo,
                    descripcion: producto.descripcion,
                    imagen_url: producto.imagen_url,
                    created_at: producto.created_at,
                    updated_at: producto.updated_at,
                });
            }

            res.status(200).json({ message: 'ok', productos: productos_output });
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

            const producto_id = req.params.id;

            const producto = await Producto.findOne({ where: { id: producto_id } });
            if (!producto) {
                throw { message: "Producto no existe." };
            }
            if (producto.sede_id != req.sede.id) {
                throw { message: "No se puede eliminar productos de otras sedes." };
            }
            await producto.destroy();

            res.status(200).json({ message: 'ok' });
        } catch (err) {
            console.error(err);
            res.status(400).json(err);
        }
    },
};

module.exports = ProductoController;