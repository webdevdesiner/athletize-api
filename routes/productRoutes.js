const express = require( 'express');
const router = express.Router();

const {
    listarProdutos,
    adicionarProduto,
  } = require('../controllers/productController'); // <-- require o controller correto

  const { excluirProduto } = require('../controllers/productController');
  const { updateProduct } = require('../controllers/productController');
  const { buscarProdutoPorId } = require('../controllers/productController'); // <-- require o controller correto



router.get('/', listarProdutos);
router.post('/', adicionarProduto);
router.delete('/:id', excluirProduto);
router.put('/:id', updateProduct); // <-- Corrigido para usar o método PUT
router.get('/:id', buscarProdutoPorId);


module.exports = router;

