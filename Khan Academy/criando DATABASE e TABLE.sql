CREATE DATABASE khan_academy;

CREATE TABLE compras (id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 
nome VARCHAR(250), 
quantidade INTEGER);

INSERT INTO compras VALUES (1, "Bananas", 4);
INSERT INTO compras VALUES (2, "Chiclete", 7);
INSERT INTO compras VALUES (3, "Refrigerante Zero", 3);
INSERT INTO compras (nome, quantidade) VALUES ("Mate", 2);
INSERT INTO compras (nome, quantidade) VALUES ("Pão", 4);

SELECT * FROM compras WHERE quantidade > 3 ORDER BY quantidade;
SELECT SUM(quantidade) FROM compras;
