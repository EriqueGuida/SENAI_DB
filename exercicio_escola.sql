DROP DATABASE exercicio_escola;
CREATE DATABASE exercicio_escola;
USE exercicio_escola;

CREATE TABLE aluno (
id_aluno INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL
);

CREATE TABLE aluno_telefone (
id_alunoTelefone INT PRIMARY KEY AUTO_INCREMENT,
id_aluno INT NOT NULL,
telefone VARCHAR(20) NOT NULL UNIQUE,
FOREIGN KEY(id_aluno) REFERENCES aluno(id_aluno)
);

CREATE TABLE aluno_email (
id_alunoEmail INT PRIMARY KEY AUTO_INCREMENT,
id_aluno INT NOT NULL,
email VARCHAR(150) NOT NULL UNIQUE,
FOREIGN KEY(id_aluno) REFERENCES aluno(id_aluno)
);

CREATE TABLE professor (
id_professor INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE
);

CREATE TABLE professor_email (
id_professorEmail INT PRIMARY KEY NOT NULL,
id_professor INT NOT NULL,
email VARCHAR(150) NOT NULL UNIQUE,
FOREIGN KEY(id_professor) REFERENCES professor(id_professor)
);

CREATE TABLE professor_telefone (
id_professorTelefone INT PRIMARY KEY AUTO_INCREMENT,
id_professor INT NOT NULL,
telefone VARCHAR(20) NOT NULL UNIQUE,
FOREIGN KEY(id_professor) REFERENCES professor(id_professor)
);

CREATE TABLE curso (
id_curso INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
carga_horaria INT NOT NULL
CHECK(carga_horaria > 0 )
);

CREATE TABLE curso_modalidade (
id_cursoModalidade INT PRIMARY KEY AUTO_INCREMENT,
id_curso INT NOT NULL,
modalidade VARCHAR(50) NOT NULL,
FOREIGN KEY(id_curso) REFERENCES curso(id_curso)
);

CREATE TABLE disciplina (
id_disciplina INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
carga_horaria INT NOT NULL
CHECK(carga_horaria > 0)
);

CREATE TABLE bibliografias (
id_bibliografia INT PRIMARY KEY AUTO_INCREMENT,
id_disciplina INT NOT NULL,
referencia VARCHAR(300) NOT NULL,
FOREIGN KEY(id_disciplina) REFERENCES disciplina(id_disciplina)
);

CREATE TABLE grade_curricular (
id_curso INT NOT NULL,
id_disciplina INT NOT NULL,
PRIMARY KEY(id_curso, id_disciplina),
FOREIGN KEY(id_curso) REFERENCES curso(id_curso),
FOREIGN KEY(id_disciplina) REFERENCES disciplina(id_disciplina)
);

CREATE TABLE turma (
id_turma INT PRIMARY KEY AUTO_INCREMENT,
id_curso INT NOT NULL,
nome VARCHAR(45) NOT NULL,
FOREIGN KEY(id_curso) REFERENCES curso(id_curso)
);

CREATE TABLE turma_professor (
id_turma INT NOT NULL,
id_curso INT NOT NULL,
id_professor INT NOT NULL,
PRIMARY KEY(id_turma, id_curso, id_professor),
FOREIGN KEY(id_turma) REFERENCES turma(id_turma),
FOREIGN KEY(id_curso) REFERENCES curso(id_curso),
FOREIGN KEY(id_professor) REFERENCES professor(id_professor)
);

CREATE TABLE horarios (
id_horario INT PRIMARY KEY AUTO_INCREMENT,
id_turma INT NOT NULL,
dia_semana VARCHAR(20) NOT NULL,
hora_inicio TIME NOT NULL,
hora_final TIME NOT NULL,
FOREIGN KEY(id_turma) REFERENCES turma(id_turma)
);

CREATE TABLE matricula (
id_matricula INT PRIMARY KEY AUTO_INCREMENT,
id_turma INT NOT NULL,
id_aluno INT NOT NULL,
data_matricula INT NOT NULL,
FOREIGN KEY(id_turma) REFERENCES turma(id_turma),
FOREIGN KEY(id_aluno) REFERENCES aluno(id_aluno)
);

CREATE TABLE documento (
id_documento INT PRIMARY KEY AUTO_INCREMENT,
id_matricula INT NOT NULL,
nome_documento VARCHAR(100) NOT NULL,
numero_documento VARCHAR(45) NOT NULL UNIQUE,
data_entrega DATE NOT NULL,
FOREIGN KEY(id_matricula) REFERENCES matricula(id_matricula)
);
