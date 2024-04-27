-- Drop do banco de dados aula_2604 se já existir
DROP DATABASE IF EXISTS aula_2604;

-- Criação do banco de dados aula_2604 se ainda não existir
CREATE DATABASE IF NOT EXISTS aula_2604;

-- Seleção do banco de dados aula_2604 para uso
USE aula_2604;

-- Criação da tabela tbl_jogos com quatro colunas: id_games (chave primária autoincrementada), title_games, plataform_games e age_games
CREATE TABLE tbl_jogos(
    id_games INT PRIMARY KEY AUTO_INCREMENT,
    title_games VARCHAR(255),
    plataform_games VARCHAR(255),
    age_games VARCHAR(255)
);

-- Inserção de dados na tabela tbl_jogos
INSERT INTO tbl_jogos (title_games, plataform_games, age_games) 
VALUES
('Age Of Empires', 'PC', 'Livre'),
('God Of War', 'Playstation', '18'),
('Fortnite', 'Xbox', '14'),
('Smite', 'Nintendo', '12'),
('Fifa 2024', 'Playstation', 'Livre'),
('A Ascenção de Ronin', 'Playstation', '18'),
('GTA', 'Xbox', '18');

-- Alteração do tipo de dados da coluna age_games de VARCHAR(255) para VARCHAR(150)
ALTER TABLE tbl_jogos CHANGE age_games age_games VARCHAR(150);

-- Adição de uma nova coluna chamada preco_jogo do tipo DECIMAL(10, 2)
ALTER TABLE tbl_jogos ADD COLUMN preco_jogo DECIMAL(10, 2);

-- Atualização dos valores da coluna preco_jogo para alguns registros específicos
UPDATE tbl_jogos SET preco_jogo = 199.99 WHERE id_games = 2;
UPDATE tbl_jogos SET preco_jogo = 999.99 WHERE id_games = 3;
UPDATE tbl_jogos SET preco_jogo = 19.90 WHERE id_games = 4;
UPDATE tbl_jogos SET preco_jogo = 49.90 WHERE id_games = 5;
UPDATE tbl_jogos SET preco_jogo = 19.90 WHERE id_games = 6;
UPDATE tbl_jogos SET preco_jogo = 249.99 WHERE id_games = 7;

-- Adição de uma nova coluna chamada qualquer_coisa do tipo DECIMAL(10, 2)
ALTER TABLE tbl_jogos ADD COLUMN qualquer_coisa DECIMAL(10, 2);

-- Remoção da coluna qualquer_coisa da tabela tbl_jogos
ALTER TABLE tbl_jogos DROP COLUMN qualquer_coisa;

-- Exclusão do registro onde id_games é igual a 7
DELETE FROM tbl_jogos WHERE id_games = 7;
 
-- Excluir um elemento, de uma linha
UPDATE tbl_jogos SET plataform_games = NULL WHERE id_games = 5;

-- Exibir jogos que não sejam da nintendo
-- SELECT * FROM tbl_jogos WHERE plataform_games <> 'Nintendo';
-- SELECT tbl_jogos FROM tbl_jogos WHERE id_games <> 4;
-- SELECT * FROM tbl_jogos WHERE platform_games NOT LIKE "%Nintendo%"; 
-- Seleção de todos os registros da tabela tbl_jogos
-- SELECT * FROM tbl_jogos;
-- SELECT * FROM tbl_jogos WHERE id_games > 1 AND age_games <> "%";

-- exercicio 1
SELECT title_games, age_games, preco_jogo from tbl_jogos WHERE age_game <> "Livre" 
OR plataform_games = "PC"

-- exercicio 2
SELECT * FROM tbl_jogos WHERE title_games LIKE "%a%" OR age_games = "Livre" ORDER BY preco_jogo DESC;
