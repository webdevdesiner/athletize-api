const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const db = require('./config/db'); // Importa a configuração do banco
const productRoutes = require('./routes/productRoutes');  // Importa as rotas de produtos

const app = express();
const port = 3000;

// Configuração de upload de arquivos
const path = require('path');
const multer  = require('multer');

// 1) Pasta onde as imagens serão salvas
const uploadFolder = path.join(__dirname, 'uploads');
app.use('/uploads', express.static(uploadFolder));

// 2) Configuração básica do multer
const storage = multer.diskStorage({
  destination: (req, file, cb) => cb(null, uploadFolder),
  filename:  (req, file, cb) => {
    // evitar nomes duplicados: timestamp + nome original
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random()*1E9);
    const ext = path.extname(file.originalname);
    cb(null, file.fieldname + '-' + uniqueSuffix + ext);
  }
});
const upload = multer({ storage });
// 3) Rota para upload de imagems


// Middlewares
app.use(cors());
app.use(bodyParser.json());

// Rota de teste
app.get('/', (req, res) => {
  res.send('API rodando!');
});

// ✅ ROTA da API
app.use('/api/produtos', productRoutes); // Usa as rotas de produtos


// Testar a conexão com o banco de dados
db.connect((err) => {
  if (err) {
    console.error('Erro ao conectar ao banco de dados:', err.message);
    return;
  }
  console.log('Conectado ao banco de dados com ID ' + db.threadId);
});

// Iniciar o servidor
app.listen(port, () => {
  console.log(`Servidor rodando em http://localhost:${port}`);
});
