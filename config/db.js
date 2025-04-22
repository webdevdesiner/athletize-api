const mysql = require('mysql2');



const connection = mysql.createConnection({
  host: 'localhost', // ou o IP do servidor
  user: 'root',
  password: '',
  database: 'athletizedb'
});

// teste de conexão.
connection.connect((err) => {
  if (err) {
    console.error('Erro ao conectar ao banco de dados:', err);
    return;
  }
  console.log('Conectado ao banco de dados MySQL');
});

module.exports = connection;
