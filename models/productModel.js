// models/productModel.js
const db = require('../config/db'); // Importa a configuração do banco de dados

const getAllProducts = (callback) => {
  db.query('SELECT * FROM produtos', callback);
};

const createProduct = (produto, callback) => {
  const { nome, descricao, preco , estoque, foto } = produto;
  db.query(
    'INSERT INTO produtos (nome, descricao, preco, estoque, foto) VALUES (?, ?, ?, ?, ?)',
    [nome, descricao, preco, estoque, foto],
    callback
  );
};

const deleteProduct = (id, callback) => {
  db.query('DELETE FROM produtos WHERE id = ?', [id], callback);
};


module.exports = {
  getAllProducts,
  createProduct,
  deleteProduct
};