CREATE DATABASE Ficha_Tecnica;
USE Ficha_Tecnica;

DROP DATABASE Ficha_tecnica;


CREATE TABLE cargos(
	id_Cargo INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	Cargo VARCHAR(100) NOT NULL
);

ficha_tecnicaCREATE TABLE Dependentes(
	id_dependente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_funcionario INT NOT NULL,
	nome VARCHAR(100) NOT NULL,
	Data_nascimento DATE NOT NULL,
	FOREIGN KEY(id_funcionario) REFERENCES funcionario(id_funcionario)
);


CREATE TABLE Setor(
	id_setor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Departamento VARCHAR(50) NOT NULL
);


funcionarioCREATE TABLE funcionario(
	id_funcionario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	matricula INT NOT NULL,
	Nome VARCHAR(100) NOT NULL,
	data_Nascimento DATE NOT NULL,
	nacionalidade VARCHAR(50) NOT NULL,
	sexo VARCHAR(15) NOT NULL,
	estado_civil VARCHAR(25),
	RG VARCHAR(15) NOT NULL,
	CPF VARCHAR(15) NOT NULL,
	Endereco VARCHAR(150) NOT NULL,
	telefone VARCHAR(21) NOT NULL,
	data_admissao DATE NOT NULL
);


CREATE TABLE cargo_funcionario (
	id_cargo_funcionario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_cargo INT NOT NULL,
	id_funcionario INT NOT NULL,
	data_inicio DATE NOT NULL,
	data_final DATE,
	FOREIGN KEY(id_cargo) REFERENCES cargos(id_cargo),
	FOREIGN KEY(id_funcionario) REFERENCES funcionario(id_funcionario)
);


CREATE TABLE func_setor(
	id_func_setor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_setor INT NOT NULL,
	id_funcionario INT NOT NULL,
	data_inicio DATE NOT NULL,
	data_fim DATE,
	FOREIGN KEY(id_setor) REFERENCES setor(id_setor),
	FOREIGN KEY(id_funcionario) REFERENCES funcionario(id_funcionario)
);
