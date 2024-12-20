const express = require("express");
const cors = require("cors");
const mysql = require("mysql2/promise");

//creo el servidor
const api = express();

//configuro el servidor
api.use(cors());
api.use(express.json());


//funcio per conectarme a la BD

async function getDBConnection() {
    const connection = await mysql.createConnection({
        host: "cadey.h.filess.io",
        user: "anime_madcloser",
        password: "8d83d64da45e162d65b3c7ede386ea0e9de02e79",
        database: "anime_madcloser"
    });
    connection.connect();
    return connection;
}


//escuchar el puerto
const port = 4001;
api.listen(port, () => {
    console.log(`Server is running. Go to http://localhost:${port}`); //para saber si se levanta bien
})

        // endpoints //

/*
    - conectar a la DB
    - consulta a la base de datos para obtener todos los animes --> SELECT
    - cerrar la conexión
    - enviar respuesta a frontend
*/


//Leer-Listar todas las entradas existentes
api.get("/api/anime", async (req, res) => {
    const connection = await getDBConnection();
    const query = "SELECT * FROM anime";
    const [result] = await connection.query(query); //await perque la funcio es asincrona
    //console.log(result);
    connection.end();
    res.status(200).json({
        info: { count: result.length },
        results: result
    })
});

// Eliminar un personaje 
api.delete("/api/anime/:id", async (req, res) => {
    const connection = await getDBConnection();
    const query = "DELETE from anime_madcloser.characters WHERE id = ?";
    const [result] = await connection.query(query, [req.params.id]);
    console.log(result);
    res.status(200).json({ success: true });
});

//Insertar una entrada en su entidad principal
api.post("/api/anime", async (req, res) => {
    //console.log(req.body);
    const { name, type, chapters } = req.body;
    // si frontend no me envía los datos, le lanzo un error
    if (!type || !chapters || !name) {
        res.status(400).json({
            success: false,
            message: "Missing fields"
        })
    } else {
        const connection = await getDBConnection();
        const query = "INSERT INTO anime(name, type, chapters ) VALUES (?, ?, ?)";
        const [result] = await connection.query(query, [name, type, chapters]);
        //console.log(result);
        connection.end();
        res.status(201).json({
            success: true,
            id: result.insertId
        });
    }
}) 


//Actualizar una entrada existente

api.put("/api/anime/:id", async (req, res) => {
    const id = req.params.id;
    const { name, type, chapters } = req.body;

    const connection = await getDBConnection();
    const query = "UPDATE anime SET name = ?, type = ?, chapters = ? WHERE id = ?";
    const [result] = await connection.query(query, [
        name, type, chapters, id
    ]);
    connection.end();
    res.status(200).json({ success: true });
});
