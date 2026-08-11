CREATE DATABASE aeroporto;
USE aeroporto;

CREATE TABLE voos(
	idVoo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	destino VARCHAR(100) NOT NULL,
	origem VARCHAR(100) NOT NULL,
	horarioSaida TIME NOT NULL,
	horarioChegada TIME
);

CREATE TABLE clientes(
	idCliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	email VARCHAR(150) NOT NULL,
	preferencial BOOLEAN DEFAULT FALSE NOT NULL
);

CREATE TABLE aeronave(
	idAeronave INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	tipo VARCHAR(45) NOT NULL,
	numPoltronas INT NOT NULL
);


CREATE TABLE trecho(
	idTrecho INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	idVoo INT NOT NULL,
	idAeronave INT NOT NULL,
	aeroportoOrigem VARCHAR(100) NOT NULL,
	aeroportoDestino VARCHAR(100) NOT NULL,
	horarioDeSaida DATETIME NOT NULL,
	horarioDeChegada DATETIME NOT NULL,
	ordem INT NOT NULL,
	FOREIGN KEY (idVoo) REFERENCES voos(idVoo),
	FOREIGN KEY (idAeronave) REFERENCES aeronave(idAeronave)
);

CREATE TABLE poltronas(
	idPoltrona INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	classe VARCHAR(1) NOT NULL,
	idAeronave INT NOT NULL,
	numeroAssento VARCHAR(10) NOT NULL,
	lado VARCHAR(20) NOT NULL,
	FOREIGN KEY(idAeronave) REFERENCES aeronave(idAeronave)
);


CREATE TABLE reserva(
	idReserva INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	idTrecho INT NOT NULL,
	idPoltrona INT NOT NULL,
	idCliente int NOT NULL,
	statusReserva VARCHAR(45),
	FOREIGN KEY(idTrecho) REFERENCES trecho(idTrecho),
	FOREIGN KEY(idPoltrona) REFERENCES poltronas(idPoltrona),
	FOREIGN KEY(idCliente) REFERENCES clientes(idCliente)	
);


-- INSERTS --


USE aeroporto;

-- 1. Inserindo os Clientes
INSERT INTO clientes (nome, email, preferencial) VALUES
('João', 'joao@siga.com.br', TRUE),
('Marcos', 'marcos@siga.com.br', FALSE),
('Kaue', 'kaue@siga.com.br', TRUE);
INSERT INTO clientes (nome, email, preferencial) VALUES
('Michael Scott', 'michael.scott@dundermifflin.com', TRUE),
('Dwight Schrute', 'dwight.schrute@dundermifflin.com', TRUE),
('Jim Halpert', 'jim.halpert@dundermifflin.com', FALSE),
('Pam Beesly', 'pam.beesly@dundermifflin.com', FALSE),
('Stanley Hudson', 'stanley.hudson@dundermifflin.com', TRUE),
('Kevin Malone', 'kevin.malone@dundermifflin.com', FALSE),
('Angela Martin', 'angela.martin@dundermifflin.com', FALSE),
('Oscar Martinez', 'oscar.martinez@dundermifflin.com', TRUE),
('Phyllis Vance', 'phyllis.vance@vancerefrigeration.com', TRUE),
('Ryan Howard', 'ryan.howard@wuphf.com', FALSE);


-- 2. Inserindo as Aeronaves
INSERT INTO aeronave (tipo, numPoltronas) VALUES
('Boeing 737', 150),
('Airbus A320', 180);
INSERT INTO aeronave (tipo, numPoltronas) VALUES
('Embraer E195', 118),
('Airbus A330', 250),
('Boeing 777', 300),
('ATR 72', 70),
('Boeing 787 Dreamliner', 242),
('Cessna Grand Caravan', 14),
('Airbus A350', 350),
('Embraer E190', 100),
('Bombardier CRJ900', 90),
('Boeing 737 MAX', 200);


-- 3. Inserindo os Voos (As rotas gerais)
-- Obs: O horarioSaida e horarioChegada aqui são TIME
INSERT INTO voos (origem, destino, horarioSaida, horarioChegada) VALUES
('Chapecó (XAP)', 'São Paulo (GRU)', '06:00:00', '10:30:00'),
('Florianópolis (FLN)', 'Brasília (BSB)', '14:00:00', '16:30:00');
INSERT INTO voos (origem, destino, horarioSaida, horarioChegada) VALUES
('Scranton (SCR)', 'Nova York (JFK)', '08:00:00', '09:00:00'),
('Scranton (SCR)', 'Stamford (SFC)', '10:00:00', '11:15:00'),
('Nova York (JFK)', 'Utica (UCA)', '13:00:00', '14:30:00'),
('Scranton (SCR)', 'Akron (CAK)', '15:00:00', '16:45:00'),
('Nashua (ASH)', 'Scranton (SCR)', '07:30:00', '09:00:00'),
('Tallahassee (TLH)', 'Scranton (SCR)', '11:00:00', '14:00:00'),
('Scranton (SCR)', 'Binghamton (BGM)', '16:00:00', '16:45:00'),
('Rochester (ROC)', 'Nova York (JFK)', '06:00:00', '07:30:00'),
('Syracuse (SYR)', 'Scranton (SCR)', '18:00:00', '19:15:00'),
('Scranton (SCR)', 'Camden (CMD)', '20:00:00', '21:00:00');

-- 4. Inserindo as Poltronas
-- Usando a sua lógica de Classes 'A' e 'B'
INSERT INTO poltronas (classe, idAeronave, numeroAssento, lado) VALUES
('A', 1, '11', 'Janela'),     -- Poltrona 1 do Boeing (idAeronave 1)
('A', 1, '12', 'Corredor'),   -- Poltrona 2 do Boeing
('B', 1, '10', 'Janela'),    -- Poltrona 3 do Boeing
('B', 1, '11', 'Corredor'),  -- Poltrona 4 do Boeing
('A', 2, '1', 'Janela');     -- Poltrona 5 do Airbus (idAeronave 2)
INSERT INTO poltronas (classe, idAeronave, numeroAssento, lado) VALUES
('A', 3, '1', 'Janela'),     -- Poltrona do Embraer E195
('A', 3, '2', 'Corredor'),   -- Poltrona do Embraer E195
('B', 4, '15', 'Janela'),    -- Poltrona do Airbus A330
('B', 4, '16', 'Corredor'),  -- Poltrona do Airbus A330
('C', 5, '30', 'Janela'),    -- Poltrona do Boeing 777
('A', 6, '1', 'Corredor'),   -- Poltrona do ATR 72
('B', 7, '12', 'Janela'),    -- Poltrona do Boeing 787
('A', 8, '3', 'Corredor'),   -- Poltrona do Cessna
('C', 9, '25', 'Janela'),    -- Poltrona do Airbus A350
('A', 10, '2', 'Janela');    -- Poltrona do Embraer E190


-- O Voo 1 fará XAP -> CWB (Ordem 1) e depois CWB -> GRU (Ordem 2)
INSERT INTO trecho (idVoo, idAeronave, aeroportoOrigem, aeroportoDestino, horarioDeSaida, horarioDeChegada, ordem) VALUES
(1, 1, 'Chapecó (XAP)', 'Curitiba (CWB)', '2026-06-15 06:00:00', '2026-06-15 07:30:00', 1),
(1, 1, 'Curitiba (CWB)', 'São Paulo (GRU)', '2026-06-15 08:30:00', '2026-06-15 10:30:00', 2),
(2, 2, 'Florianópolis (FLN)', 'Brasília (BSB)', '2026-06-16 14:00:00', '2026-06-16 16:30:00', 1);
INSERT INTO trecho (idVoo, idAeronave, aeroportoOrigem, aeroportoDestino, horarioDeSaida, horarioDeChegada, ordem) VALUES
(3, 3, 'Scranton (SCR)', 'Nova York (JFK)', '2026-08-10 08:00:00', '2026-08-10 09:00:00', 1),
(4, 4, 'Scranton (SCR)', 'Stamford (SFC)', '2026-08-11 10:00:00', '2026-08-11 11:15:00', 1),
(5, 5, 'Nova York (JFK)', 'Utica (UCA)', '2026-08-12 13:00:00', '2026-08-12 14:30:00', 1),
(6, 6, 'Scranton (SCR)', 'Akron (CAK)', '2026-08-13 15:00:00', '2026-08-13 16:45:00', 1),
(7, 7, 'Nashua (ASH)', 'Scranton (SCR)', '2026-08-14 07:30:00', '2026-08-14 09:00:00', 1),
(8, 8, 'Tallahassee (TLH)', 'Scranton (SCR)', '2026-08-15 11:00:00', '2026-08-15 14:00:00', 1),
(9, 9, 'Scranton (SCR)', 'Binghamton (BGM)', '2026-08-16 16:00:00', '2026-08-16 16:45:00', 1),
(10, 10, 'Rochester (ROC)', 'Nova York (JFK)', '2026-08-17 06:00:00', '2026-08-17 07:30:00', 1),
(11, 11, 'Syracuse (SYR)', 'Scranton (SCR)', '2026-08-18 18:00:00', '2026-08-18 19:15:00', 1),
(12, 12, 'Scranton (SCR)', 'Camden (CMD)', '2026-08-19 20:00:00', '2026-08-19 21:00:00', 1);


-- 6. Inserindo as Reservas
INSERT INTO reserva (idTrecho, idPoltrona, idCliente, statusReserva) VALUES
(1, 1, 1, 'Confirmada'), 
(2, 1, 1, 'Confirmada'), 
(1, 3, 2, 'Pendente'),   
(3, 5, 3, 'Confirmada');
INSERT INTO reserva (idTrecho, idPoltrona, idCliente, statusReserva) VALUES
(4, 6, 4, 'Confirmada'),    -- Michael Scott indo para NY ver a diretoria
(5, 7, 5, 'Confirmada'),    -- Dwight indo para Stamford
(6, 8, 6, 'Cancelada'),     -- Jim ia para Utica, mas desistiu
(7, 9, 7, 'Confirmada'),    -- Pam Beesly
(8, 10, 8, 'Confirmada'),   -- Stanley Hudson indo para o Florida Stanley
(9, 11, 9, 'Pendente'),     -- Kevin Malone esqueceu de pagar
(10, 12, 10, 'Confirmada'), -- Angela Martin
(11, 13, 11, 'Confirmada'), -- Oscar Martinez
(12, 14, 12, 'Confirmada'), -- Phyllis Vance
(13, 15, 13, 'Cancelada');  -- Ryan Howard tentou fugir de Scranton



-- SELECTS --


-- Esse select simula a emissão da passagem. 
-- Ele busca quem é a pessoa, de onde ela sai, para onde vai, qual a poltrona e em qual avião. Puxa dados de quase todas as tabelas.
USE aeroporto;
SELECT 
    c.nome AS Passageiro,
    CASE WHEN c.preferencial = TRUE THEN 'VIP' ELSE 'Padrão' END AS Categoria,
    t.aeroportoOrigem AS Embarque,
    t.aeroportoDestino AS Desembarque,
    DATE_FORMAT(t.horarioDeSaida, '%d/%m/%Y %H:%i') AS DataSaida,
    CONCAT(p.numeroAssento, p.classe) AS Assento,
    a.tipo AS Aeronave,
    r.statusReserva AS Status
FROM reserva r
INNER JOIN clientes c ON r.idCliente = c.idCliente -- Os inner joins para cruzar os dados das duas tabelas com base no mesmo id
INNER JOIN trecho t ON r.idTrecho = t.idTrecho
INNER JOIN poltronas p ON r.idPoltrona = p.idPoltrona
INNER JOIN aeronave a ON t.idAeronave = a.idAeronave
ORDER BY t.horarioDeSaida, c.nome;


-- Aeronave que mais trabalha --
-- Select para saber qual avião está sendo mais alocado em trechos diferentes.
SELECT 
    a.tipo AS ModeloAeronave,
    a.numPoltronas AS CapacidadeMaxima,
    COUNT(t.idTrecho) AS QuantidadeDeTrechos
FROM aeronave a
INNER JOIN trecho t ON a.idAeronave = t.idAeronave
GROUP BY a.idAeronave, a.tipo, a.numPoltronas
ORDER BY QuantidadeDeTrechos DESC;


-- Destino final mais escolhido

SELECT 
    v.destino AS DestinoFinal, 
    COUNT(r.idReserva) AS TotalPassagensVendidas
FROM reserva r
INNER JOIN trecho t ON r.idTrecho = t.idTrecho
INNER JOIN voos v ON t.idVoo = v.idVoo
GROUP BY v.idVoo, v.destino
ORDER BY TotalPassagensVendidas DESC
LIMIT 1;


-- Poltrona mais escolhida 

SELECT 
    p.numeroAssento AS Assento,
    p.lado AS Localizacao,
    p.classe AS Classe,
    a.tipo AS ModeloAeronave,
    COUNT(r.idReserva) AS VezesReservada
FROM reserva r
INNER JOIN poltronas p ON r.idPoltrona = p.idPoltrona
INNER JOIN aeronave a ON p.idAeronave = a.idAeronave
GROUP BY p.idPoltrona, p.numeroAssento, p.lado, p.classe, a.tipo
ORDER BY VezesReservada DESC
LIMIT 1;


-- Taxa de Ocupação por Trecho

SELECT 
    t.aeroportoOrigem AS Origem,
    t.aeroportoDestino AS Destino,
    a.tipo AS Aeronave,
    a.numPoltronas AS Capacidade,
    COUNT(r.idReserva) AS AssentosOcupados,
    -- Cálculo de Porcentagem: (Ocupados * 100) / Capacidade
    CONCAT(ROUND((COUNT(r.idReserva) * 100.0) / a.numPoltronas, 2), '%') AS TaxaOcupacao
FROM trecho t
INNER JOIN aeronave a ON t.idAeronave = a.idAeronave
LEFT JOIN reserva r ON t.idTrecho = r.idTrecho AND r.statusReserva = 'Confirmada'
GROUP BY t.idTrecho, t.aeroportoOrigem, t.aeroportoDestino, a.tipo, a.numPoltronas
ORDER BY TaxaOcupacao DESC;






