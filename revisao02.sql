DROP DATABASE IF EXISTS revisao;
CREATE DATABASE IF NOT EXISTS revisao;

USE revisao;

CREATE TABLE IF NOT EXISTS jogos(
	id_jogos INT AUTO_INCREMENT PRIMARY KEY,
    nome_jogos VARCHAR(250) NOT NULL,
    genero_jogos VARCHAR(250) NOT NULL,
    ano_lancamento DATE NOT NULL,
    valor_jogo DECIMAL (10,2) NOT NULL,
    fk_plataforma INT

);

CREATE TABLE IF NOT EXISTS tbl_plataformas(
	id_plataforma INT AUTO_INCREMENT PRIMARY KEY,
    nome_plataforma VARCHAR(250) NOT NULL
);

ALTER TABLE jogos ADD CONSTRAINT FOREIGN KEY (fk_plataforma) REFERENCES jogos (id_jogos);

INSERT INTO tbl_plataformas (nome_plataforma) VALUES
("Playstation"),
("XBox"),
("Nintendo Switch"),
("PC");

INSERT INTO jogos (nome_jogos, genero_jogos, ano_lancamento, valor_jogo, fk_plataforma) VALUES 
('The Last of Us', 'Ação e Aventura', '2020-02-19', '109.99', 1),
    ('Counter strike', 'Tiro em Primeira Pessoa', '2010-02-02', '250.15', 1),
    ('GTA V', 'Ação e ficção', '2013-05-22', '315.99', 3),
    ('Gran turismo', 'sport', '2017-03-20', '421.99', 4),
    ('God of War', 'Ação e Aventura', '2015-01-25', '500.99', 3),
    ('Forza Horizon 5', 'Corrida', '2021-12-17', '450.17', 4),
    ('Animal Crossing: New Horizons', 'Simulação de Vida', '2019-09-29', '300.99', 4),
    ('Among Us', 'Multijogador online', '2018-08-30', '512.99', 1),
    ('Red Dead Redemption 2', 'Ação e Aventura', '2016-02-23', '319.99', 2),
    ('FIFA 23', 'Esportes', '2023-01-15', '255.99', 2);

UPDATE jogos SET nome_jogos = "Teste de Update" WHERE id_jogos = 5;

/*SELECT COM INNER JOIN, LIKE AND, OR E ORDER BY*/
SELECT tbl_jogos.nome_jogo, tbl_plataformas.nome_plataforma, tbl_jogos.valor_jogo
FROM tbl_jogos INNER JOIN tbl_plataformas 
ON tbl_jogos.fk_plataforma = tbl_plataformas.id_plataforma
WHERE id_jogo > 4 AND nome_plataforma NOT LIKE '%PC%' OR valor_jogo < '200.00'
ORDER BY valor_jogo DESC;

/*ALTERAÇÃO DO NOME DE UMA COLUNA*/
ALTER TABLE tbl_jogos CHANGE genero_jogo genero_jogo VARCHAR (672);

/*EXCLUSÃO DE DADOS EM UMA TABELA*/
DELETE FROM tbl_jogos WHERE id_jogo = 10;
