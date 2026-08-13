CREATE DATABASE empresa;
USE empresa;

CREATE TABLE setor (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
sigla VARCHAR(5),
localizacao VARCHAR(45) NOT NULL,
ramal VARCHAR(6) UNIQUE
);

CREATE TABLE funcionario (
id INT PRIMARY KEY AUTO_INCREMENT,
id_setor INT,
nome VARCHAR(45) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE,
matricula VARCHAR(45) NOT NULL UNIQUE,
cargo VARCHAR(45) NOT NULL,
FOREIGN KEY (id_setor) REFERENCES setor(id)
);

CREATE TABLE equipamento (
id INT PRIMARY KEY AUTO_INCREMENT,
id_setor INT,
num_patrimonio VARCHAR(45) NOT NULL UNIQUE,
nome VARCHAR(45) NOT NULL,
tipo VARCHAR(45),
status ENUM ('Disponível', 'Em Uso', 'Em Manutenção', 'Baixado') NOT NULL,
registro DATETIME,
FOREIGN KEY (id_setor) REFERENCES setor(id)
); 

CREATE TABLE entrega (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_funcionario INT NOT NULL,
    id_equipamento INT NOT NULL,
    data_entrega DATETIME NOT NULL,
    data_devolucao DATETIME NULL,
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id),
    FOREIGN KEY (id_equipamento) REFERENCES equipamento(id)
);

-- ========================================================
-- 1. POVOANDO A TABELA SETOR (5 registros)
-- ========================================================
INSERT INTO setor (id, nome, sigla, localizacao, ramal) VALUES
(1, 'Tecnologia da Informação', 'TI', 'Bloco A - Sala 101', '4001'),
(2, 'Recursos Humanos', 'RH', 'Bloco B - Sala 202', '4002'),
(3, 'Financeiro', 'FIN', 'Bloco B - Sala 203', '4003'),
(4, 'Operações e Logística', 'OP', 'Galpão Central', '4004'),
(5, 'Jurídico', 'JUR', 'Bloco A - Sala 105', '4005');

-- ========================================================
-- 2. POVOANDO A TABELA FUNCIONARIO (15 registros)
-- ========================================================
INSERT INTO funcionario (id, id_setor, nome, cpf, matricula, cargo) VALUES
(1, 1, 'Lucas Andrade', '11122233301', 'MAT202601', 'Desenvolvedor Senior'),
(2, 1, 'Mariana Costa', '11122233302', 'MAT202602', 'Analista de Suporte'),
(3, 1, 'Carlos Eduardo', '11122233303', 'MAT202603', 'Engenheiro de DevOps'),
(4, 2, 'Fernanda Silva', '11122233304', 'MAT202604', 'Coordenadora de RH'),
(5, 2, 'Beatriz Lima', '11122233305', 'MAT202605', 'Analista de Recrutamento'),
(6, 3, 'Roberto Gomez', '11122233306', 'MAT202606', 'Analista Financeiro'),
(7, 3, 'Juliana Mendes', '11122233307', 'MAT202607', 'Contadora'),
(8, 4, 'Gabriel Santos', '11122233308', 'MAT202608', 'Supervisor de Logística'),
(9, 4, 'Amanda Rocha', '11122233309', 'MAT202609', 'Assistente Operacional'),
(10, 4, 'Rodrigo Oliveira', '11122233310', 'MAT202610', 'Conferente'),
(11, 5, 'Patricia Xavier', '11122233311', 'MAT202611', 'Advogada Senior'),
(12, 5, 'Thiago Martins', '11122233312', 'MAT202612', 'Assistente Jurídico'),
(13, 1, 'Camila Souza', '11122233313', 'MAT202613', 'UX Designer'),
(14, 2, 'Diego Alves', '11122233314', 'MAT202614', 'Analista de DP'),
(15, 3, 'Vanessa Ribeiro', '11122233315', 'MAT202615', 'Auditora Interna');

-- ========================================================
-- 3. POVOANDO A TABELA EQUIPAMENTO (20 registros)
-- ========================================================
INSERT INTO equipamento (id, id_setor, num_patrimonio, nome, tipo, status, registro) VALUES
(1, 1, 'PAT-2026-001', 'Notebook Dell Latitude 5420', 'Notebook', 'Em Uso', '2026-01-10 09:00:00'),
(2, 1, 'PAT-2026-002', 'Notebook Lenovo ThinkPad E14', 'Notebook', 'Em Uso', '2026-01-10 09:15:00'),
(3, 1, 'PAT-2026-003', 'MacBook Pro 14 M3', 'Notebook', 'Em Uso', '2026-01-12 10:30:00'),
(4, 1, 'PAT-2026-004', 'Monitor Dell 27 4K', 'Monitor', 'Em Uso', '2026-01-15 11:00:00'),
(5, 1, 'PAT-2026-005', 'Monitor LG UltraWide 29', 'Monitor', 'Disponível', '2026-01-15 11:30:00'),
(6, 2, 'PAT-2026-006', 'Notebook HP ProBook 440', 'Notebook', 'Em Uso', '2026-01-20 14:00:00'),
(7, 2, 'PAT-2026-007', 'Impressora HP LaserJet Pro', 'Impressora', 'Disponível', '2026-01-22 08:30:00'),
(8, 3, 'PAT-2026-008', 'Notebook Dell Vostro 3510', 'Notebook', 'Em Uso', '2026-02-01 09:00:00'),
(9, 3, 'PAT-2026-009', 'Calculadora Financeira HP 12C', 'Acessório', 'Disponível', '2026-02-02 10:00:00'),
(10, 4, 'PAT-2026-010', 'Coletor de Dados Zebra TC21', 'Coletor', 'Em Uso', '2026-02-05 07:30:00'),
(11, 4, 'PAT-2026-011', 'Coletor de Dados Zebra TC21', 'Coletor', 'Em Manutenção', '2026-02-05 07:35:00'),
(12, 4, 'PAT-2026-012', 'Radio Comunicador Motorola', 'Comunicação', 'Em Uso', '2026-02-10 13:00:00'),
(13, 5, 'PAT-2026-013', 'Notebook Lenovo ThinkPad L14', 'Notebook', 'Em Uso', '2026-02-12 15:00:00'),
(14, 5, 'PAT-2026-014', 'Scanner Epson WorkForce', 'Scanner', 'Disponível', '2026-02-15 16:20:00'),
(15, 1, 'PAT-2026-015', 'Servidor Rack Dell PowerEdge', 'Servidor', 'Em Uso', '2026-01-05 08:00:00'),
(16, 1, 'PAT-2026-016', 'Switch Cisco 24 Portas', 'Redes', 'Em Uso', '2026-01-05 08:30:00'),
(17, 2, 'PAT-2026-017', 'Tablet Samsung Galaxy Tab S8', 'Tablet', 'Em Manutenção', '2026-02-18 11:10:00'),
(18, 3, 'PAT-2026-018', 'Monitor Samsung 24 LED', 'Monitor', 'Disponível', '2026-02-20 10:00:00'),
(19, 4, 'PAT-2026-019', 'Impressora de Etiqueta Zebra', 'Impressora', 'Em Uso', '2026-02-22 09:40:00'),
(20, 5, 'PAT-2026-020', 'Projector Epson PowerLite', 'Projetor', 'Disponível', '2026-02-25 14:15:00');

-- ========================================================
-- 4. POVOANDO A TABELA ENTREGA (25 registros)
-- ========================================================
INSERT INTO entrega (id, id_funcionario, id_equipamento, data_entrega, data_devolucao) VALUES
-- Histórico antigo (já devolvidos)
(1, 1, 5, '2026-01-16 09:00:00', '2026-02-01 18:00:00'),
(2, 2, 7, '2026-01-23 08:30:00', '2026-02-10 17:00:00'),
(3, 4, 17, '2026-01-25 10:00:00', '2026-02-17 12:00:00'),
(4, 6, 9, '2026-02-03 11:00:00', '2026-02-15 16:30:00'),
(5, 8, 11, '2026-02-06 08:00:00', '2026-02-20 09:00:00'),
(6, 11, 14, '2026-02-16 14:00:00', '2026-02-28 17:00:00'),
(7, 13, 5, '2026-02-02 09:30:00', '2026-03-01 18:00:00'),
(8, 3, 18, '2026-02-21 10:15:00', '2026-03-05 12:00:00'),
(9, 5, 20, '2026-02-26 14:30:00', '2026-02-27 18:00:00'),
(10, 9, 11, '2026-02-21 08:00:00', '2026-03-10 11:00:00'),
(11, 7, 9, '2026-02-16 09:00:00', '2026-03-12 17:30:00'),
(12, 10, 19, '2026-02-23 07:30:00', '2026-03-15 16:00:00'),
(13, 12, 20, '2026-03-01 13:00:00', '2026-03-02 17:00:00'),
(14, 15, 18, '2026-03-06 09:00:00', '2026-03-20 18:00:00'),

-- Entregas ativas (data_devolucao NULL - Equipamentos em uso no momento)
(15, 1, 1, '2026-01-11 09:00:00', NULL),
(16, 2, 2, '2026-01-11 09:30:00', NULL),
(17, 13, 3, '2026-01-13 11:00:00', NULL),
(18, 3, 4, '2026-01-16 08:30:00', NULL),
(19, 4, 6, '2026-01-21 14:30:00', NULL),
(20, 6, 8, '2026-02-02 09:15:00', NULL),
(21, 8, 10, '2026-02-06 08:00:00', NULL),
(22, 9, 12, '2026-02-11 13:30:00', NULL),
(23, 11, 13, '2026-02-13 15:30:00', NULL),
(24, 1, 15, '2026-01-06 09:00:00', NULL),
(25, 10, 19, '2026-03-16 08:00:00', NULL);