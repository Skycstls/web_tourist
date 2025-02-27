const express = require('express');
const app = express();
const port = 3000;


const fs = require('fs');
const path = require('path');

const publicPath = path.join(__dirname, 'public');

app.use(express.static(publicPath));

app.get('/list-files', (req, res) => {
    fs.readdir(publicPath, (err, files) => {
        if (err) {
            return res.status(500).json({ error: 'Error al leer la carpeta' });
        }
        res.json({ files });
    });
});

app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`);
    }
);