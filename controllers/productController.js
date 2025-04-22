// /controllers/productController.js
const { getAllProducts, createProduct, deleteProduct, updateProduct: updateProductModel } = require ('../models/productModel.js');

const listarProdutos = (req, res) => {
  getAllProducts((err, results) => {
    if (err) return res.status(500).send(err);
    res.json(results);
  });
};

const adicionarProduto = (req, res) => {
  console.log('Arquivo recebido:', req.file);
  const { nome, descricao, preco, estoque } = req.body;
  const foto = req.file ? req.file.filename : null;
  const fotoPath = req.file ? `/uploads/${req.file.filename}` : '';

  const produto = { nome, descricao, preco, estoque, foto: fotoPath };

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
  const { nome, descricao, preco, estoque } = req.body;
  const foto = req.file ? `/uploads/${req.file.filename}` : null;

  const produto = { nome, descricao, preco, estoque, foto };

  updateProductModel(id, produto, (err, result) => {
    if (err) return res.status(500).send(err);

    if (result.affectedRows === 0) {
      return res.status(404).send({ message: 'Produto não encontrado!' });
    }

    res.status(200).send({ message: 'Produto atualizado com sucesso!', produto });
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
