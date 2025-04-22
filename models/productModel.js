// models/productModel.js
const db = require('../config/db'); // Importa a configuração do banco de dados

const getAllProducts = (callback) => {
  db.query('SELECT * FROM produtos', callback);
};

const getProductById = (id, callback) => {
  db.query('SELECT * FROM produtos WHERE id = ?', [id], callback);
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

const updateProduct = (id, produto, callback) => {
  const { nome, descricao, preco, estoque, foto } = produto;
  db.query(
    'UPDATE produtos SET nome = ?, descricao = ?, preco = ?, estoque = ?, foto = ? WHERE id = ?',
    [nome, descricao, preco, estoque, foto, id],
    callback
  );
};



module.exports = {
  getAllProducts,
  createProduct,
  deleteProduct,
  updateProduct,
  getProductById,
};