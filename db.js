const mysql = require('mysql')
    //connnect with db
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password:'',
    // password: '12345',
    database: 'nodemysql'
});
db.connect((err) => {
    if (err)
        console.log('Got an error', err);
    else
        console.log('Successfully connected to db');
});
module.exports = db;