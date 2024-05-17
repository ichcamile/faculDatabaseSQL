DROP DATABASE IF EXISTS catalogo_filmes;
CREATE DATABASE IF NOT EXISTS catalogo_filmes;
USE catalogo_filmes;

CREATE TABLE IF NOT EXISTS generos (
	id_genero INT PRIMARY KEY auto_increment NOT NULL,
	nome_genero VARCHAR(50) NOT NULL 
);

CREATE TABLE IF NOT EXISTS diretor (
	id_diretor INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome_diretor VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL,
    quantidade_oscars INT NOT NULL,
    nacionalidade VARCHAR(155) NOT NULL
);

CREATE TABLE IF NOT EXISTS filmes(
	id_filmes INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome_filme VARCHAR (500) NOT NULL,
    data_do_lançamento DATE NOT NULL,
    duracao_filme INT NOT NULL,
    diretor_filme INT NOT NULL,
    CONSTRAINT fk_diretor_filme
        FOREIGN KEY (diretor_filme) REFERENCES diretor(id_diretor),
	genero_filme INT NOT NULL,
    CONSTRAINT fk_genero_filme
		FOREIGN KEY (genero_filme) REFERENCES generos(id_genero)
);


INSERT INTO generos (nome_genero) VALUES
('Ação'),
('Comédia'),
('Drama'),
('Ficção Científica'),
('Romance'),
('Terror'),
('Animação'),
('Fantasia'),
('Suspense'),
('Documentário');

INSERT INTO diretor (nome_diretor, data_nascimento, quantidade_oscars, nacionalidade) VALUES
('Steven Spielberg', '1946-12-18', 3, 'Estados Unidos'),
('Sofia Coppola', '1971-05-14', 1, 'Estados Unidos'),
('Martin Scorsese', '1942-11-17', 1, 'Estados Unidos'),
('Quentin Tarantino', '1963-03-27', 2, 'Estados Unidos'),
('Christopher Nolan', '1970-07-30', 0, 'Reino Unido'),
('Alfred Hitchcock', '1899-08-13', 1, 'Reino Unido'),
('Francis Ford Coppola', '1939-04-07', 5, 'Estados Unidos'),
('James Cameron', '1954-08-16', 3, 'Canadá'),
('Tim Burton', '1958-08-25', 0, 'Estados Unidos'),
('Peter Jackson', '1961-10-31', 3, 'Nova Zelândia'),
('Ridley Scott', '1937-11-30', 1, 'Reino Unido');

INSERT INTO filmes (nome_filme, data_do_lançamento, duracao_filme, diretor_filme, genero_filme) VALUES
('Jurassic Park', '1993-06-11', 127, 1, 4),
('Taxi Driver', '1976-02-08', 113, 2, 3),
('Pulp Fiction', '1994-10-14', 154, 3, 8),
('Inception', '2010-07-16', 148, 4, 4),
('Psycho', '1960-09-08', 109, 5, 6),
('The Godfather', '1972-03-24', 175, 6, 3),
('Avatar', '2009-12-18', 162, 7, 1),
('Edward Scissorhands', '1990-12-07', 105, 8, 2),
('The Lord of the Rings: The Fellowship of the Ring', '2001-12-19', 178, 9, 7),
('Alien', '1979-05-25', 117, 10, 4);

-- SELECT * FROM generos

SELECT * FROM filmes as a
	inner join generos as b
    on a.genero_filme = b.id_genero;
    
SELECT a.nome_filme, b.nome_genero
FROM filmes as a
	left join generos as b
    on a.genero_filme = b.id_genero
