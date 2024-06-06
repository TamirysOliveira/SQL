CREATE TABLE livros (
    id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    autor VARCHAR(250),
    titulo VARCHAR(250),
    qnt_palavras INTEGER);
    
INSERT INTO livros (autor, titulo, qnt_palavras)
    VALUES ("J.K. Rowling", "Harry Potter and the Philosopher's Stone", 79944);
INSERT INTO livros (autor, titulo, qnt_palavras)
    VALUES ("J.K. Rowling", "Harry Potter and the Chamber of Secrets", 85141);
INSERT INTO livros (autor, titulo, qnt_palavras)
    VALUES ("J.K. Rowling", "Harry Potter and the Prisoner of Azkaban", 107253);
INSERT INTO livros (autor, titulo, qnt_palavras)
    VALUES ("J.K. Rowling", "Harry Potter and the Goblet of Fire", 190637);
INSERT INTO livros (autor, titulo, qnt_palavras)
    VALUES ("J.K. Rowling", "Harry Potter and the Order of the Phoenix", 257045);
INSERT INTO livros (autor, titulo, qnt_palavras)
    VALUES ("J.K. Rowling", "Harry Potter and the Half-Blood Prince", 168923);
INSERT INTO livros (autor, titulo, qnt_palavras)
    VALUES ("J.K. Rowling", "Harry Potter and the Deathly Hallows", 197651);
INSERT INTO livros (autor, titulo, qnt_palavras)
    VALUES ("Stephenie Meyer", "Twilight", 118501);
INSERT INTO livros (autor, titulo, qnt_palavras)
    VALUES ("Stephenie Meyer", "New Moon", 132807);
INSERT INTO livros (autor, titulo, qnt_palavras)
    VALUES ("Stephenie Meyer", "Eclipse", 147930);
INSERT INTO livros (autor, titulo, qnt_palavras)
    VALUES ("Stephenie Meyer", "Breaking Dawn", 192196);
INSERT INTO livros (autor, titulo, qnt_palavras)
    VALUES ("J.R.R. Tolkien", "The Hobbit", 95022);
INSERT INTO livros (autor, titulo, qnt_palavras)
    VALUES ("J.R.R. Tolkien", "Fellowship of the Ring", 177227);
INSERT INTO livros (autor, titulo, qnt_palavras)
    VALUES ("J.R.R. Tolkien", "Two Towers", 143436);
INSERT INTO livros (autor, titulo, qnt_palavras)
    VALUES ("J.R.R. Tolkien", "Return of the King", 134462);
    
/*fazer uma seleção de todos os autores que escreveram mais de 1 milhão de palavras, usando GROUP BY e HAVING. 
A tabela de resultados deve incluir o autor, "author", e a contagem total de palavras como uma coluna "total_palavras".*/
SELECT autor, SUM(qnt_palavras) AS total_palavras FROM livros GROUP BY autor HAVING total_palavras > 1000000;
 
 /*Agora, vamos selecionar todos os autores que escreveram mais de uma média de 150.000 palavras por livro. 
 Sua tabela de resultados deve incluir o autor e a média de palavras como uma coluna "media_palavras".*/
 SELECT autor, AVG(qnt_palavras) AS media_palavras FROM livros GROUP BY autor HAVING media_palavras > 150000;
 
 /*note que nomear as colunas de soma, média, mínimo, máximo etc ajuda na hora de filtra-las
 Também, não teria como fazer o filtro da média, ou mesmo a soma de palavras, usando WHERE, visto que WHERE funciona linha por linha e não com um total*/