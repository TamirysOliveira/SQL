CREATE TABLE exercise_logs
    (id INTEGER PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(300),
    minutes INTEGER, 
    calories INTEGER,
    heart_rate INTEGER);

INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("biking", 30, 100, 110);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("biking", 10, 30, 105);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("dancing", 15, 200, 120);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("tree climbing", 30, 70, 90);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("tree climbing", 25, 72, 80);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("rowing", 30, 70, 90);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("hiking", 60, 80, 85);

CREATE TABLE drs_favorites
    (id INTEGER PRIMARY KEY,
    type VARCHAR(250),
    reason VARCHAR(300));
    
    
INSERT INTO drs_favorites(type, reason) VALUES ("biking", "Improves endurance and flexibility.");
INSERT INTO drs_favorites(type, reason) VALUES ("hiking", "Increases cardiovascular health.");

/* IN */
/* o comando abaixo é igual a SELECT * FROM exercise_logs WHERE type = "hiking" OR type ="biking" OR type = "tree climbing");*/
SELECT * FROM exercise_logs WHERE type IN ("biking", "hiking", "tree climbing");

/* selecionar os valores de uma tabela externa */
SELECT * FROM exercise_logs WHERE type IN (SELECT type FROM drs_favorites);

/* LIKE */
/* usando LIKE para saber quais exercícios em exercises_log que o médico recomendou em drs_favorite que sejam benéfica ao coração, ou seja, que a col reaon tenha a palavra
cardiovascular*/
SELECT * FROM exercise_logs WHERE type IN (SELECT type FROM drs_favorites WHERE reason LIKE "%cardiovascular%");


