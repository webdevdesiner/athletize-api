// /controllers/productController.js
const { getAllProducts, createProduct, deleteProduct, updateProduct: updateProductModel } = require ('../models/productModel.js');

const listarProdutos = (req, res) => {
  getAllProducts((err, results) => {
    if (err) return res.status(500).send(err);
    res.json(results);
  });
};

const adicionarProduto = (req, res) => {
  const produto = req.body;
  createProduct(produto, (err, result) => {
    if (err) return res.status(500).send(err);
    res.status(201).send({ id: result.insertId, ...produto });
  });
};

const excluirProduto = (req, res) => {
  const id = req.params.id;
  deleteProduct(id, (err, result) => {
    if (err) return res.status(500).send(err);

    // Verifique se algum produto foi excluído
    if (result.affectedRows === 0) {
      return res.status(404).send({ message: 'Produto não encontrado!' });
    }

    // Envia o status 204 sem corpo adicional, apenas um código de sucesso
    res.sendStatus(204); 
  });
};

const updateProduct = (req, res) => {
  const id = req.params.id;
  const produto = req.body;

  updateProductModel(id, produto, (err, result) => {
    if (err) {
      return res.status(500).json({ error: 'Erro ao atualizar produto' });
    }
    res.status(200).json({ message: 'Produto atualizado com sucesso', id, ...produto });
  });
};

const { getProductById } = require('../models/productModel');

const buscarProdutoPorId = (req, res) => {
  const id = req.params.id;

  getProductById(id, (err, results) => {
    if (err) return res.status(500).send(err);

    if (results.length === 0) {
      return res.status(404).send({ message: 'Produto não encontrado' });
    }

    res.status(200).json(results[0]);
  });
};


module.exports = {
  listarProdutos,
  adicionarProduto,
  excluirProduto,
  updateProduct,
  buscarProdutoPorId,
};
