DROP DATABASE IF EXISTS revisaocarros;
CREATE DATABASE IF NOT EXISTS revisaocarros;

USE revisaocarros;

CREATE TABLE tbl_carros(
	id_carro INT AUTO_INCREMENT PRIMARY KEY,
    nome_carro VARCHAR(250) NOT NULL,
    data_de_lancamento DATE NOT NULL,
	kilometros DECIMAL(10,2) NOT NULL,
    fkmarca_carro INT NOT NULL
);

CREATE TABLE tbl_marcarro(
	id_marca INT AUTO_INCREMENT PRIMARY KEY,
    nome_marca VARCHAR(250),
    dono_marca VARCHAR(250)
);

ALTER TABLE tbl_carros ADD CONSTRAINT FOREIGN KEY (fkmarca_carro) REFERENCES tbl_marcarro (id_marca);

INSERT INTO tbl_marcarro (nome_marca, dono_marca)
VALUES 
("Marca A", "Dono do A"),
("Marca B", "Dono do B"),
("Marca C", "Dono do C");

INSERT INTO tbl_carros (nome_carro, data_de_lancamento, kilometros, fkmarca_carro)
VALUES 
("Carro A", "2020-01-01", "235.54", 1),
("Carro B", "2019-05-15", "245.54", 2),
("Carro C", "2021-11-20", "87.54", 3),
("Carro C2", "2024-11-20", "178.50", 3);

UPDATE tbl_carros SET nome_carro = "Land Rover" WHERE id_carro = 4;
ALTER TABLE tbl_carros CHANGE kilometros kilometros INT NOT NULL;
DELETE FROM tbl_carros WHERE id_carro = 1;
/*
SELECT tbl_carros.nome_carro, tbl_carros.fkmarca_carro, tbl_marcarro.nome_marca
FROM tbl_marcarro INNER JOIN tbl_carros 
ON tbl_marcarro.id_marca = tbl_carros.fkmarca_carro


WHERE id_carro > 2 AND nome_carro NOT LIKE "%Carro A%" OR kilometros < "100"

ORDER BY id_carro DESC;*/


SELECT * FROM tbl_carros;




