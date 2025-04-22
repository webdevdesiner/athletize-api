const express = require('express');
const router = express.Router();
const multer = require('multer');
const path = require('path');

const productController = require('../controllers/productController');

// Configuração de armazenamento para imagens
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'uploads/'); // Certifique-se de que essa pasta existe
  },
  filename: (req, file, cb) => {
    const ext = path.extname(file.originalname);
    const filename = Date.now() + ext;
    cb(null, filename);
  }
});

const upload = multer({ storage });

const {
  listarProdutos,
  adicionarProduto,
  excluirProduto,
  updateProduct,
  buscarProdutoPorId
} = require('../controllers/productController');

// Rotas
router.get('/', listarProdutos);
router.get('/:id', buscarProdutoPorId);
router.post('/', upload.single('foto'), adicionarProduto); // agora com upload
router.put('/produtos/:id', productController.updateProduct)
router.delete('/:id', excluirProduto);

module.exports = router;
