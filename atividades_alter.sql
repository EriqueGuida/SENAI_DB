CREATE DATABASE atividades_alter;

USE atividades_alter;

/* ============================================================
   TABELAS BASE PARA OS EXERCÍCIOS DE ALTER TABLE
   (NÃO ALTERE ESSA PARTE)
   ============================================================ */



/* ---------------------- PACIENTES ---------------------- */
CREATE TABLE pacientes (
    id_paciente VARCHAR(100),   -- deveria ser INT
    nome INT,                   -- deveria ser VARCHAR
    data_nascimento VARCHAR(8), -- deveria ser DATE
    altura VARCHAR(5),          -- deveria ser DECIMAL(4,2)
    peso BOOLEAN                -- deveria ser DECIMAL(5,2)
);
-- Exercício 1 (pacientes)
-- Ajustar o tipo da coluna id_paciente de VARCHAR(100) para INT.
ALTER TABLE pacientes MODIFY COLUMN id_paciente INT;

-- Exercício 2 (pacientes)
-- Ajustar o tipo da coluna nome de INT para VARCHAR(100).
ALTER TABLE pacientes MODIFY COLUMN nome VARCHAR(100);

-- Exercício 3 (pacientes)
-- Ajustar o tipo da coluna data_nascimento para DATE.
ALTER TABLE pacientes MODIFY COLUMN data_nascimento DATE;

-- Exercício 4 (pacientes)
-- Adicionar a coluna telefone VARCHAR(20) para armazenar o telefone do paciente.
ALTER TABLE pacientes ADD COLUMN telefone VARCHAR(20);

-- Exercício 5 (pacientes)
-- Renomear a coluna altura para altura_metros e já corrigir o tipo para DECIMAL(4,2).
ALTER TABLE pacientes CHANGE altura altura_metros DECIMAL(4, 2);



/* ------------------ VEICULOS_EMPRESA ------------------- */
CREATE TABLE veiculos_empresa (
    id_veiculo TEXT,        -- deveria ser INT
    placa DATE,             -- deveria ser CHAR(7)
    modelo INT,             -- deveria ser VARCHAR
    ano VARCHAR(10),        -- deveria ser INT
    valor BOOLEAN           -- deveria ser DECIMAL(10,2)
);
-- Exercício 6 (veiculos_empresa)
-- Ajustar o tipo da coluna placa de DATE para CHAR(7).
ALTER TABLE veiculos_empresa MODIFY COLUMN placa CHAR(7);

-- Exercício 7 (veiculos_empresa)
-- Ajustar o tipo da coluna valor para DECIMAL(10,2).
ALTER TABLE veiculos_empresa MODIFY COLUMN valor DECIMAL(10, 2);

-- Exercício 8 (veiculos_empresa)
-- Adicionar a coluna cor VARCHAR(30) para armazenar a cor do veículo.
ALTER TABLE veiculos_empresa ADD COLUMN cor VARCHAR(30);

-- Exercício 9 (veiculos_empresa)
-- Renomear a coluna modelo para modelo_veiculo, mantendo o tipo VARCHAR(60)
-- (se necessário, já aproveite para ajustar o tipo para VARCHAR(60))
ALTER TABLE veiculos_empresa CHANGE COLUMN modelo modelo_veiculo VARCHAR(60);


/* ------------------ CONTAS_BANCARIAS ------------------- */
CREATE TABLE contas_bancarias (
    numero_conta DATE,      -- deveria ser CHAR(10)
    titular BOOLEAN,        -- deveria ser VARCHAR
    saldo VARCHAR(15),      -- deveria ser DECIMAL(10,2)
    limite INT,             -- deveria ser DECIMAL(10,2)
    ativa VARCHAR(10)       -- poderia ser BOOLEAN ou ENUM('ativa','inativa')
);
-- Exercício 10 (contas_bancarias)
-- Ajustar o tipo da coluna numero_conta para CHAR(10).
ALTER TABLE contas_bancarias MODIFY COLUMN numero_conta CHAR(10);

-- Exercício 11 (contas_bancarias)
-- Ajustar o tipo da coluna saldo para DECIMAL(10,2).
ALTER TABLE contas_bancarias MODIFY COLUMN saldo DECIMAL(10, 2);

-- Exercício 12 (contas_bancarias)
-- Adicionar a coluna data_abertura DATE para registrar quando a conta foi criada.
ALTER TABLE contas_bancarias ADD COLUMN data_abertura DATE;



/* ------------------------ TURMAS ------------------------ */
CREATE TABLE turmas (
    id_turma VARCHAR(20),   -- deveria ser INT
    nome BOOLEAN,           -- deveria ser VARCHAR
    carga_horaria VARCHAR(5), -- deveria ser INT
    sala INT,
    turno INT               -- poderia ser ENUM('manhã','tarde','noite')
);
-- Exercício 13 (turmas)
-- Renomear a coluna nome para nome_turma e ajustar o tipo para VARCHAR(80).
ALTER TABLE turmas CHANGE COLUMN nome nome_turma VARCHAR(80);

-- Exercício 14 (turmas)
-- Adicionar a coluna modalidade ENUM('presencial','online') para indicar o tipo de turma.
ALTER TABLE turmas ADD COLUMN modalidade ENUM('presencial', 'online');



/* -------------------- RESERVAS_SALA -------------------- */
CREATE TABLE reservas_sala (
    id_reserva VARCHAR(50), -- deveria ser INT
    id_turma DATE,          -- deveria ser INT (FK de turmas)
    data_reserva INT,       -- deveria ser DATE
    hora_inicio VARCHAR(10),-- deveria ser TIME
    observacao BOOLEAN      -- deveria ser VARCHAR(255)
);
-- Exercício 15 (reservas_sala)
-- Ajustar o tipo da coluna data_reserva para DATE e o tipo da coluna hora_inicio para TIME.
ALTER TABLE reservas_sala MODIFY COLUMN data_reserva DATE;
ALTER TABLE reservas_sala MODIFY COLUMN hora_inicio TIME;


/* ============================================================
   EXERCÍCIOS – ESCREVA OS COMANDOS ALTER TABLE ABAIXO
   (NÃO USE INDEX AINDA)
   ============================================================ */
/* ------------------- DESAFIO FINAL --------------------- */

-- Desafio (reservas_sala)
-- Após concluir os ajustes anteriores na tabela reservas_sala,
-- excluir a coluna observacao (DROP COLUMN).