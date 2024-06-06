/*criando um banco de dados de músicas e artistas*/
CREATE TABLE artistas (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(250),
    pais VARCHAR(250),
    genero VARCHAR(250));

INSERT INTO artistas (nome, pais, genero)
    VALUES ("Taylor Swift", "US", "Pop");
INSERT INTO artistas (nome, pais, genero)
    VALUES ("Led Zeppelin", "US", "Hard rock");
INSERT INTO artistas (nome, pais, genero)
    VALUES ("ABBA", "Sweden", "Disco");
INSERT INTO artistas (nome, pais, genero)
    VALUES ("Queen", "UK", "Rock");
INSERT INTO artistas (nome, pais, genero)
    VALUES ("Celine Dion", "Canada", "Pop");
INSERT INTO artistas (nome, pais, genero)
    VALUES ("Meatloaf", "US", "Hard rock");
INSERT INTO artistas (nome, pais, genero)
    VALUES ("Garth Brooks", "US", "Country");
INSERT INTO artistas (nome, pais, genero)
    VALUES ("Shania Twain", "Canada", "Country");
INSERT INTO artistas (nome, pais, genero)
    VALUES ("Rihanna", "US", "Pop");
INSERT INTO artistas (nome, pais, genero)
    VALUES ("Guns N' Roses", "US", "Hard rock");
INSERT INTO artistas (nome, pais, genero)
    VALUES ("Gloria Estefan", "US", "Pop");
INSERT INTO artistas (nome, pais, genero)
    VALUES ("Bob Marley", "Jamaica", "Reggae");
    
    SELECT * FROM artistas;

CREATE TABLE musicas (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    artista VARCHAR(250),
    titulo VARCHAR(250));

INSERT INTO musicas (artista, titulo)
    VALUES ("Taylor Swift", "Shake it off");
INSERT INTO musicas (artista, titulo)
    VALUES ("Rihanna", "Stay");
INSERT INTO musicas (artista, titulo)
    VALUES ("Celine Dion", "My heart will go on");
INSERT INTO musicas (artista, titulo)
    VALUES ("Celine Dion", "A new day has come");
INSERT INTO musicas (artista, titulo)
    VALUES ("Shania Twain", "Party for two");
INSERT INTO musicas (artista, titulo)
    VALUES ("Gloria Estefan", "Conga");
INSERT INTO musicas (artista, titulo)
    VALUES ("Led Zeppelin", "Stairway to heaven");
INSERT INTO musicas (artista, titulo)
    VALUES ("ABBA", "Mamma mia");
INSERT INTO musicas (artista, titulo)
    VALUES ("Queen", "Bicycle Race");
INSERT INTO musicas (artista, titulo)
    VALUES ("Queen", "Bohemian Rhapsody");
INSERT INTO musicas (artista, titulo)
    VALUES ("Guns N' Roses", "Don't cry");
    
/*criando listas de reprodução a partir desses dados. Nessa primeira etapa, selecione o titulo de todas as músicas cujo artista  é a banda "Queen"*/
SELECT titulo FROM musicas WHERE artista = "Queen";

/*vamos fazer uma lista de reprodução "Pop". Para se preparar, selecione o nome de todos os artistas do gênero "Pop".*/
SELECT nome FROM artistas WHERE genero = "Pop";

/*agora vamos criar a lista de reprodução "Pop", adicionando outra busca que vai selecionar o título de todas as músicas dos artistas do gênero "Pop". 
Vamos usar IN em uma sub-busca aninhada com base nas buscas anteriores.*/
SELECT titulo FROM musicas  WHERE artista IN (SELECT nome FROM artistas WHERE genero = "Pop");

/*buscar nomes que apareçam pelo menos duas vezes usando HAVING*/
SELECT artista FROM musicas GROUP BY artista HAVING COUNT(*) >=2;
/*note que não seria possível verificar o total de vezes que um artista aparece usando WHERE, já que WHERE lê linha por linha
e não o total, ou a média, ou a contagem de algo*/


