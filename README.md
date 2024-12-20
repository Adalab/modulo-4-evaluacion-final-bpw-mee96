![Gif de ejemplo](https://www.icegif.com/wp-content/uploads/2023/01/icegif-1823.gif)


# API Anime Documentation

## Descripción
Este API permite gestionar una base de datos de animes y personajes, permitiendo realizar operaciones CRUD (Crear, Leer, Actualizar y Eliminar) en las entidades `anime` y `characters`.

## URL base
La URL base del API es:
```
http://localhost:4001/api
```

---

## Endpoints

### 1. Obtener todos los animes
**GET** `/anime`

#### Descripción
Obtiene una lista de todos los animes registrados en la base de datos.

#### Ejemplo de solicitud:
```bash
GET http://localhost:4001/api/anime
```

#### Respuesta:
```json
{
  "info": { "count": 5 },
  "results": [
    {
      "id": 1,
      "name": "Jujutsu Kaisen",
      "type": "Shonen",
      "chapters": 24
    },
    {
      "id": 2,
      "name": "Tensei Shitara Slime Datta Ken",
      "type": "Isekai",
      "chapters": 74
    }
  ]
}
```

---

### 2. Insertar un nuevo anime
**POST** `/anime`

#### Descripción
Inserta un nuevo anime en la base de datos.

#### Cuerpo de la solicitud (JSON):
```json
{
  "name": "Nombre del Anime",
  "type": "Tipo del Anime",
  "chapters": #num capitulos
}
```

#### Ejemplo de solicitud:
```bash
POST http://localhost:4001/api/anime
Content-Type: application/json

{
  "name": "Horomiya",
  "type": "Shojo",
  "chapters": 23
}
```

#### Respuesta:
```json
{
  "success": true,
  "id": 6
}
```

---

### 3. Actualizar un anime existente
**PUT** `/anime/:id`

#### Descripción
Actualiza la información de un anime existente.

#### Parámetros de la URL:
- `id`: ID del anime que se desea actualizar.

#### Cuerpo de la solicitud (JSON):
```json
{
  "name": "Nuevo Nombre",
  "type": "Nuevo Tipo",
  "chapters": 12
}
```

#### Ejemplo de solicitud:
```bash
PUT http://localhost:4001/api/anime/1
Content-Type: application/json

{
  "name": "jjk",
  "type": "Acción",
  "chapters": 26
}
```

#### Respuesta:
```json
{
  "success": true
}
```

---

### 4. Eliminar un personaje
**DELETE** `/anime/:id`

#### Descripción
Elimina un personaje.

#### Parámetros de la URL:
- `id`: ID del personaje que se desea eliminar.

#### Ejemplo de solicitud:
```bash
DELETE http://localhost:4001/api/anime/22
```

#### Respuesta:
```json
{
  "success": true
}
```

---

## Errores comunes

- **400 Bad Request:** Cuando faltan campos obligatorios en el cuerpo de la solicitud (POST o PUT).
- **404 Not Found:** Cuando el recurso solicitado no existe.
- **500 Internal Server Error:** Problemas con el servidor o la base de datos.

---

## Tecnologías utilizadas
- Node.js
- Express.js
- MySQL

---

## Configuración del entorno
Asegúrate de configurar correctamente los datos de conexión a la base de datos en el archivo `index.js`:
```javascript
const connection = await mysql.createConnection({
    host: "cadey.h.filess.io",
    user: "anime_madcloser",
    password: "8d83d64da45e162d65b3c7ede386ea0e9de02e79",
    database: "anime_madcloser"
});
```

## Instalación

Sigue estos pasos para instalar y ejecutar la aplicación en tu máquina local, hay una carpeta llamda db con el código de la bd por si también se quiere hacer en local:

### 1. Clonar el repositorio

`git clone https://github.com/Adalab/modulo-4-evaluacion-final-bpw-mee96.git`

### 2. Instalar dependencias

`cd modulo-4-evaluacion-final-bpw-mee96`  
`npm install`

### 3. Inicio de la aplicación

`npm run dev`



