CREATE DATABASE escola_inscricoes;
USE escola_inscricoes;

CREATE TABLE escola(
	id_escola INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 	nome VARCHAR(100) NOT NULL,
 	cidade VARCHAR(50) NOT NULL,
 	estado VARCHAR(50) NOT NULL
);

CREATE TABLE miniCurso(
	id_miniCurso INT NOT NULL AUTO_INCREMENT primary KEY,
	titulo VARCHAR(100) NOT NULL,
	carga_horaria INT NOT NULL,
	id_escola INT NOT NULL,
	FOREIGN KEY (id_escola) REFERENCES escola(id_escola)
);

CREATE TABLE pessoa(
	id_pessoa INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	cpf VARCHAR(14) NOT NULL,
	email VARCHAR(100) NOT NULL,
	id_escola INT NOT NULL,
	FOREIGN KEY (id_escola) REFERENCES escola(id_escola)
);


CREATE TABLE palestra(
	id_palestra INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  
	titulo VARCHAR(100) NOT NULL,
	palestrante VARCHAR(100) NOT NULL,
	id_escola INT NOT NULL,
	FOREIGN KEY (id_escola) REFERENCES escola(id_escola)
);

CREATE TABLE inscricao(
	id_inscricao INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_escola INT NOT NULL,
	id_palestra INT NOT NULL,
	id_miniCurso INT NOT NULL,
	data_inscricao TIMESTAMP NOT NULL,
	FOREIGN KEY (id_escola) REFERENCES escola(id_escola),
	FOREIGN KEY (id_palestra) REFERENCES palestra(id_palestra),
	FOREIGN KEY (id_miniCurso) REFERENCES minicurso(id_miniCurso)
);