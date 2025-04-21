const express = require( 'express');
const router = express.Router();

const {
    listarProdutos,
    adicionarProduto,
  } = require('../controllers/productController'); // <-- require o controller correto

  const { excluirProduto } = require('../controllers/productController');



router.get('/', listarProdutos);
router.post('/', adicionarProduto);
router.delete('/:id', excluirProduto);


module.exports = router;

