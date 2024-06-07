/*CRIANDO UMA TABELA DE EXERCÍCIOS PARA VERIFICAR MEU RITMO CARDÍACO* PARA EXEMPLICAR O USO DO CASE*/

CREATE TABLE exercicios_logs
    (id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    atividade VARCHAR(250),
    minutos INTEGER, 
    calorias INTEGER,
    frequencia_cardio INTEGER);

INSERT INTO exercicios_logs(atividade, minutos, calorias, frequencia_cardio) VALUES ("bicicleta", 30, 100, 110);
INSERT INTO exercicios_logs(atividade, minutos, calorias, frequencia_cardio) VALUES ("bicicleta", 10, 30, 105);
INSERT INTO exercicios_logs(atividade, minutos, calorias, frequencia_cardio) VALUES ("dança", 15, 200, 120);
INSERT INTO exercicios_logs(atividade, minutos, calorias, frequencia_cardio) VALUES ("dança", 15, 165, 120);
INSERT INTO exercicios_logs(atividade, minutos, calorias, frequencia_cardio) VALUES ("pular corda", 30, 70, 90);
INSERT INTO exercicios_logs(atividade, minutos, calorias, frequencia_cardio) VALUES ("pular corda", 25, 72, 80);
INSERT INTO exercicios_logs(atividade, minutos, calorias, frequencia_cardio) VALUES ("remar", 30, 70, 90);
INSERT INTO exercicios_logs(atividade, minutos, calorias, frequencia_cardio) VALUES ("escalar", 60, 80, 85);

/*SEGUNDO PESQUISA NA INTERNET A FREQUÊNCIA CARDÍACA MÁXIMA (FCM) É ENCONTRADA SE SUBTRAIRMOS 220 MENOS A SUA IDADE. 
AQUI USAREI A MINHA IDADE: 35 ANOS, ENTÃO, MINHA FCM SERIA 220-35 = 185*/

/*CONTANDO SE HÁ ALGUM REGISTRO ONDE MINHA FMC CHEGA NO LIMITE MÁXIMO*/
SELECT COUNT(*) AS atividades_com_FMC_no_max FROM exercicios_logs WHERE frequencia_cardio > (220-30);

/*VERIFICANDO AGORA SE MINHA FMC CHEGA NA ZONA ALVO, QUE É ENTRE 90 E 50% DE BATIMENTOS DA FMC*/
SELECT atividade, COUNT(*) FROM exercicios_logs WHERE
	frequencia_cardio >= ROUND(0.5 * (220-30))
    AND frequencia_cardio <= ROUND(0.9 * (220-30))
    GROUP BY atividade;
/*EXISTEM 4 REGISTROS PARA FREQUÊNCIAS CARDÍACAS QUE ESTÃO ENTRE 50 E 90 DA FMC SENDO 2 DE BICICLETA E 2 DE DANÇA*/

/*MAS AGORA E SE EU QUISER SABER AS OUTRAS ZONAS DE FMC ALÉM DA ZONA ALVO (ENTRE 50 E 90%)?
PARA ISSO VAMOS USAR O CASE*/

/*CASE*/
SELECT atividade, frequencia_cardio,
	CASE
		WHEN frequencia_cardio > (220-30) THEN "FCM ultrapassada"
        WHEN frequencia_cardio > ROUND(0.9 * (220-30)) THEN "acima da zona alvo de FCM"
        WHEN frequencia_cardio > ROUND(0.5 * (220-30)) THEN "dentro da zona alvo de FCM"
        ELSE "abaixo da zona alvo de FCM"
        END AS "FMC"
 FROM exercicios_logs;
 
 /*RESUMO DE QUANTAS OCORRÊNCIAS ESTÃO EM CADA UMA DAS ZONAS DE FMC*/
SELECT COUNT(*) AS contagem, atividade,
    CASE
        WHEN frequencia_cardio > ROUND(0.9 * (220-30)) THEN "acima da zona alvo de FCM"
        WHEN frequencia_cardio > ROUND(0.5 * (220-30)) THEN "dentro da zona alvo de FCM"
        ELSE "abaixo da zona alvo de FCM"
    END AS FMC
FROM exercicios_logs
GROUP BY atividade,
    CASE
        WHEN frequencia_cardio > ROUND(0.9 * (220-30)) THEN "acima da zona alvo de FCM"
        WHEN frequencia_cardio > ROUND(0.5 * (220-30)) THEN "dentro da zona alvo de FCM"
        ELSE "abaixo da zona alvo de FCM"
    END
ORDER BY contagem;
