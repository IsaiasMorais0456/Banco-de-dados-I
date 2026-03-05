-- Com base no exemplo executado em laboratório do UNOESC_BANK, crie um banco de dados e seu script SQL para especificar --
-- o controle de agendamento dos atendimentos aos clientes de uma manicure e pedicure. Defina livremente os campos que identificam os -- 
-- atributos necessários para o banco de dados. --

CREATE DATABASE salao;
USE salao;


CREATE TABLE cliente(
	id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	telefone VARCHAR(16) NOT NULL
);  




CREATE TABLE profissionais(
	id_profissional INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	especialidade VARCHAR(50) NOT NULL
);

CREATE TABLE produtos(
	id_produto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	marca VARCHAR(50) NOT NULL,
	nome VARCHAR(50) NOT NULL,
	quantidade INT NOT NULL
);

CREATE TABLE agendamento(
	id_agendamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	data_inicio DATE NOT NULL,
	data_fim DATE NOT NULL,
	id_cliente INT NOT NULL, 
	id_profissional INT NOT NULL,
	FOREIGN KEY (id_profissional) REFERENCES profissionais(id_profissional),
	FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);


CREATE TABLE pagamentos(
	id_pagamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	forma_pagamento VARCHAR(20) NOT NULL,
	valor FLOAT NOT NULL,
	data_pagamento DATETIME NOT NULL,
	comprovante VARCHAR(100) NOT NULL,
	id_cliente INT NOT NULL,
	FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);


CREATE TABLE servicos(
	id_servico INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	preco DECIMAL(10,2) NOT NULL,
	duracao TIME NOT NULL,
	id_produto INT NOT NULL,
	id_profissional INT NOT NULL,
	id_cliente INT NOT NULL,
	FOREIGN KEY (id_produto) REFERENCES produtos(id_produto),
	FOREIGN KEY (id_profissional) REFERENCES profissionais(id_profissional),
	FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);






