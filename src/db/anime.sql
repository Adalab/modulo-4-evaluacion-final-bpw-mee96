CREATE TABLE anime(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
type VARCHAR (20),
chapters INT

);

INSERT INTO anime(name, type, chapters)
VALUES('Jujutsu Kaisen', 'Shonen', 24 ),
('Tensei Shitara Slime Datta Ken', 'Isekai', 74),
('Given', 'BL', 11),
('Higurashi no naku koro ni', 'Terror', 98),
('Neon Genesis Evangelion','Mechas', 26);


CREATE TABLE characters(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    anime_id INT, 
    birth_date DATE, 
    race VARCHAR(50) NOT NULL, 
    role VARCHAR(50), 
    gender VARCHAR(20),
    powers TEXT,
    FOREIGN KEY (anime_id) REFERENCES anime(id)
);

INSERT INTO characters(name, anime_id, birth_date, race, role, gender, powers)
VALUES
('Yuji Itadori', 1, '2001-03-20', 'Humano', 'Protagonista', 'Masculino', 'Poseído por Sukuna, gran fuerza física'),
('Satoru Gojo', 1, '1989-12-07', 'Humano', 'Sensei', 'Masculino', 'Técnicas de límite infinito, el más fuerte'),
('Rimuru Tempest', 2, NULL, 'Slime', 'Protagonista', 'Sin género', 'Control absoluto de habilidades mágicas'),
('Milim Nava', 2, NULL, 'Demonio', 'Aliada', 'Femenino', 'Rey Demonio con fuerza descomunal'),
('Mafuyu Sato', 3, '1997-12-31', 'Humano', 'Protagonista', 'Masculino', 'Voz impresionante para el canto'),
('Ritsuka Uenoyama', 3, '1998-06-01', 'Humano', 'Protagonista', 'Masculino', 'Guitarrista talentoso y líder de la banda'),
('Rika Furude', 4, '1983-08-21', 'Humano', 'Protagonista', 'Femenino', 'Conocimiento de bucles temporales'),
('Keiichi Maebara', 4, '1983-04-13', 'Humano', 'Protagonista', 'Masculino', 'Habilidades de deducción y valentía'),
('Shinji Ikari', 5, '2001-06-06', 'Humano', 'Protagonista', 'Masculino', 'Piloto del EVA-01'),
('Rei Ayanami', 5, NULL, 'Clon', 'Protagonista', 'Femenino', 'Piloto del EVA-00 con habilidades misteriosas');



--compruebo que la clave forranea funciona buscando los personajes de jujutsu kaisen

SELECT characters.name AS characters_name
FROM characters
JOIN anime ON characters.anime_id = anime.id
WHERE anime.name = 'Jujutsu Kaisen';

--me devuelve una tabla con yuji y gojo, funciona



--comprovacions querys per als endpoints

SELECT * FROM anime

DELETE from anime_madcloser.characters WHERE id = 2 //borra el anime allotjat al id 2

UPDATE anime_madcloser.anime SET name = 'jjk', type = 'accio', chapters = 1 WHERE id = 1