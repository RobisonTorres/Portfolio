CREATE DATABASE Universidade; -- Criar Banco de Dados.
Go
USE Universidade;
Go
CREATE TABLE Cursos (
    id_curso INT IDENTITY(1,1) PRIMARY KEY,
    nome_curso VARCHAR(100) NOT NULL,
    qntd_semestre INT,
	preco DECIMAL(18,2) CHECK (preco >= 0),
    salas_disponiveis INT,
	nota_mec INT,
	docente_responsavel VARCHAR(100),
    telefone_docente VARCHAR(20),
    email_docente VARCHAR(255)
);

CREATE TABLE Disciplinas (
    id_disciplina INT IDENTITY(1,1) PRIMARY KEY,
    nome_disciplina VARCHAR(100) NOT NULL,
    duracao INT,
	preco DECIMAL(10,2) CHECK (preco >= 0),
    requer_laboratorio VARCHAR(3),
	capacidade_alunos INT
);

CREATE TABLE Alunos (
    ra_aluno INT IDENTITY(1,1) PRIMARY KEY,
    nome_aluno VARCHAR(100) NOT NULL,
    cpf VARCHAR(14),
	rg VARCHAR(20),
    endereco VARCHAR(255), 
    email VARCHAR(255),
    telefone VARCHAR(20),
	data_matricula DATETIME DEFAULT GETDATE(),
	situacao_curso VARCHAR(15), 
	historico TEXT,
	fk_id_curso INT,
	FOREIGN KEY(fk_id_curso) REFERENCES Cursos(id_curso)
);

CREATE TABLE Notas_Faltas (
	id INT IDENTITY(1,1) PRIMARY KEY,
	nota DECIMAL(3,2) CHECK (nota BETWEEN 0 AND 10),
    falta INT,
	fk_ra_aluno INT,
	fk_id_disciplina INT,
	FOREIGN KEY(fk_ra_aluno) REFERENCES Alunos(ra_aluno),
	FOREIGN KEY(fk_id_disciplina) REFERENCES Disciplinas(id_disciplina)
);

CREATE TABLE Cursos_Disciplinas (
    fk_id_curso INT,
    fk_id_disciplina INT,
    FOREIGN KEY (fk_id_curso) REFERENCES Cursos(id_curso),
    FOREIGN KEY (fk_id_disciplina) REFERENCES Disciplinas(id_disciplina)
);

CREATE TABLE Professores (
    id_professor INT IDENTITY(1,1) PRIMARY KEY,
    nome_professor VARCHAR(100) NOT NULL,
    cpf VARCHAR(14),
	rg VARCHAR(20),
    endereco VARCHAR(255), 
    email VARCHAR(255),
    telefone VARCHAR(20),
	formacao_academica TEXT
);

CREATE TABLE Classes (
    id INT IDENTITY(1,1) PRIMARY KEY,
    classe VARCHAR(10) NOT NULL,
    horario TIME,
	fk_id_disciplina INT,
	fk_id_professor INT,
	FOREIGN KEY (fk_id_disciplina) REFERENCES Disciplinas(id_disciplina),
    FOREIGN KEY (fk_id_professor) REFERENCES Professores(id_professor)
);
