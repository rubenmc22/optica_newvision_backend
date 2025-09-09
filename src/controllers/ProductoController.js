const Tasa = require('../models/Tasa');
const VerificationUtils = require('../utils/VerificationUtils');
const Producto = require('./../models/Producto');
const Categoria = require('./../models/Categoria');
const { Op } = require('sequelize');
const upload = require('../config/uploader');
const multer = require('multer');
const fs = require('fs');
const path = require('path');

const ProductoController = {
    add: async (req, res) => {
        try {
            if (!req.user) {
                throw { message: "Sesion invalida." };
            }

            req.nombre_imagen = `product-${Date.now()}`;
            upload.single('imagen')(req, res, async (err) => {
                if (err) {
                    if (err instanceof multer.MulterError) {
                        return res.status(400).json({ message: err.message });
                    } else if (err) {
                        return res.status(400).json({ message: err.message });
                    }
                }

                const {
                    nombre,
                    marca,
                    color,
                    material,
                    proveedor,
                    categoria,
                    stock,
                    precio,
                    moneda,
                    activo: activo_string,
                    descripcion
                } = req.body;

                const activo = (activo_string === 'true' || activo_string === true || activo_string === 1 || activo_string === "1");

                if (!VerificationUtils.verify_nombre(nombre)) {
                    return res.status(400).json({ message: "El nombre no puede quedar vacio." });
                }
                if (!VerificationUtils.verify_nombre(marca)) {
                    return res.status(400).json({ message: "La marca no puede quedar vacio." });
                }
                if (!VerificationUtils.verify_nombre(color)) {
                    return res.status(400).json({ message: "El color no puede quedar vacio." });
                }
                if (!VerificationUtils.verify_nombre(material)) {
                    return res.status(400).json({ message: "El material no puede quedar vacio." });
                }
                if (!VerificationUtils.verify_nombre(proveedor)) {
                    return res.status(400).json({ message: "El proveedor no puede quedar vacio." });
                }
                if (!VerificationUtils.verify_nombre(categoria)) {
                    return res.status(400).json({ message: "La categoria no puede quedar vacio." });
                }
                if (!VerificationUtils.verify_numero(stock)) {
                    return res.status(400).json({ message: "El stock debe ser numerico" });
                }
                if (!VerificationUtils.verify_numero(precio)) {
                    return res.status(400).json({ message: "El precio debe ser numerico" });
                }
                if (!VerificationUtils.verify_boolean(activo)) {
                    return res.status(400).json({ message: "El parametro 'activo' debe ser booleano." });
                }

                const objTasa = await Tasa.findOne({ where: { id: moneda } });
                if (!objTasa) {
                    return res.status(400).json({ message: "La moneda enviada no existe: " + moneda + "." });
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
                    return res.status(400).json({ message: "Ya existe un producto con el mismo nombre, marca, color y categoria en la sede actual." });
                }

                const objProducto = await Producto.create({
                    sede_id: req.sede.id,
                    nombre: nombre,
                    marca: marca,
                    color: color,
                    codigo: null,
                    material: material,
                    proveedor: proveedor,
                    categoria: categoria,
                    stock: stock,
                    precio: precio,
                    moneda: objTasa.id,
                    activo: activo,
                    descripcion: descripcion,
                    imagen_url: "/public/images/product-generic-image.jpg?t=" + Date.now()
                });

                objProducto.codigo = `PR-${objProducto.id.toString().padStart(6, '0')}`;
                await objProducto.save();

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

                if (req.file) {
                    // Renombra el archivo subido con el ID del producto
                    const extension = path.extname(req.file.filename);
                    const nuevoNombre = `product-${objProducto.id}${extension}`;
                    const oldPath = path.join("./public/images", req.nombre_imagen + extension);
                    const newPath = path.join("./public/images", nuevoNombre);

                    // Renombra el archivo en el sistema de archivos
                    fs.renameSync(oldPath, newPath);

                    // Actualiza la URL de la imagen en el producto
                    objProducto.imagen_url = `/public/images/${nuevoNombre}?t=${Date.now()}`;
                    await objProducto.save();
                    producto_output.imagen_url = objProducto.imagen_url;
                }
                
                res.status(200).json({ message: 'ok', producto: producto_output });
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

            req.nombre_imagen = `product-${Date.now()}`;
            upload.single('imagen')(req, res, async (err) => {
                if (err) {
                    if (err instanceof multer.MulterError) {
                        return res.status(400).json({ message: err.message });
                    } else if (err) {
                        return res.status(400).json({ message: err.message });
                    }
                }

                const {
                    nombre,
                    marca,
                    color,
                    material,
                    proveedor,
                    categoria,
                    stock,
                    precio,
                    moneda,
                    activo: activo_string,
                    descripcion
                } = req.body;

                const activo = (activo_string === 'true' || activo_string === true || activo_string === 1 || activo_string === "1");

                if (!VerificationUtils.verify_nombre(nombre)) {
                    return res.status(400).json({ message: "El nombre no puede quedar vacio." });
                }
                if (!VerificationUtils.verify_nombre(marca)) {
                    return res.status(400).json({ message: "La marca no puede quedar vacio." });
                }
                if (!VerificationUtils.verify_nombre(color)) {
                    return res.status(400).json({ message: "El color no puede quedar vacio." });
                }
                if (!VerificationUtils.verify_nombre(material)) {
                    return res.status(400).json({ message: "El material no puede quedar vacio." });
                }
                if (!VerificationUtils.verify_nombre(proveedor)) {
                    return res.status(400).json({ message: "El proveedor no puede quedar vacio." });
                }
                if (!VerificationUtils.verify_nombre(categoria)) {
                    return res.status(400).json({ message: "La categoria no puede quedar vacio." });
                }
                if (!VerificationUtils.verify_numero(stock)) {
                    return res.status(400).json({ message: "El stock debe ser numerico" });
                }
                if (!VerificationUtils.verify_numero(precio)) {
                    return res.status(400).json({ message: "El precio debe ser numerico" });
                }
                if (!VerificationUtils.verify_boolean(activo)) {
                    return res.status(400).json({ message: "El parametro 'activo' debe ser booleano." });
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
                    return res.status(400).json({ message: "Ya existe un producto con el mismo nombre, marca, color y categoria en la sede actual." });
                }

                objProducto.nombre = nombre;
                objProducto.marca = marca;
                objProducto.color = color;
                objProducto.material = material;
                objProducto.proveedor = proveedor;
                objProducto.categoria = categoria;
                objProducto.stock = stock;
                objProducto.precio = precio;
                objProducto.moneda = moneda;
                objProducto.activo = activo;
                objProducto.descripcion = descripcion;

                await objProducto.save();

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

                if (req.file) {
                    // Renombra el archivo subido con el ID del producto
                    const extension = path.extname(req.file.filename);
                    const nuevoNombre = `product-${objProducto.id}${extension}`;
                    const oldPath = path.join("./public/images", req.nombre_imagen + extension);
                    const newPath = path.join("./public/images", nuevoNombre);

                    // Renombra el archivo en el sistema de archivos
                    fs.renameSync(oldPath, newPath);

                    // Actualiza la URL de la imagen en el producto
                    objProducto.imagen_url = `/public/images/${nuevoNombre}?t=${Date.now()}`;
                    await objProducto.save();
                    producto_output.imagen_url = objProducto.imagen_url;
                }

                res.status(200).json({ message: 'ok', producto: producto_output });
            });
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
                const existe_imagen = (producto.imagen_url !== null && limpiarYValidarRuta(producto.imagen_url));
                const ruta_imagen = (existe_imagen) ? (producto.imagen_url) : ("/public/images/product-generic-image.jpg?t=" + Date.now());

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
                    imagen_url: ruta_imagen,
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

    get_categorias: async (req, res) => {
        try {
            if (!req.user) {
                throw { message: "Sesion invalida." };
            }

            const categorias_db = await Categoria.findAll({});

            res.status(200).json({ message: 'ok', categorias: categorias_db });
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

function limpiarYValidarRuta(inputUrl, baseDir = __dirname) {
  // Elimina el query string si existe
  const rutaSinQuery = inputUrl.split('?')[0];

  // Construye la ruta absoluta del archivo
  const rutaAbsoluta = path.join("./../..", rutaSinQuery);

  // Verifica si el archivo existe
  const existeArchivo = fs.existsSync(rutaAbsoluta);

  return existeArchivo;
}

module.exports = ProductoController;