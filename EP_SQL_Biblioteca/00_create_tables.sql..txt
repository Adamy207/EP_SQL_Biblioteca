-- 00_create_tables.sql
-- Criação das tabelas do sistema de Biblioteca Universitária

CREATE DATABASE IF NOT EXISTS biblioteca_universitaria;

USE biblioteca_universitaria;

CREATE TABLE IF NOT EXISTS USUARIO (
    ID_USUARIO   INT PRIMARY KEY,
    nome         VARCHAR(100)    NOT NULL,
    tipo_usuario VARCHAR(20)     NOT NULL,
    matricula    VARCHAR(20)     NOT NULL UNIQUE,
    email        VARCHAR(100)    NOT NULL UNIQUE,
    telefone     VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS CATEGORIA (
    ID_CATEGORIA   INT PRIMARY KEY,
    nome_categoria VARCHAR(60)   NOT NULL,
    descricao      VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS LIVRO (
    ID_LIVRO       INT PRIMARY KEY,
    titulo         VARCHAR(150)  NOT NULL,
    ano_publicacao INT,
    editora        VARCHAR(100),
    isbn           VARCHAR(20),
    status         VARCHAR(20)   NOT NULL,
    ID_CATEGORIA   INT NOT NULL,
    FOREIGN KEY (ID_CATEGORIA) REFERENCES CATEGORIA(ID_CATEGORIA)
);

CREATE TABLE IF NOT EXISTS AUTOR (
    ID_AUTOR      INT PRIMARY KEY,
    nome          VARCHAR(100)  NOT NULL,
    nacionalidade VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS LIVRO_AUTOR (
    ID_LIVRO INT NOT NULL,
    ID_AUTOR INT NOT NULL,
    PRIMARY KEY (ID_LIVRO, ID_AUTOR),
    FOREIGN KEY (ID_LIVRO) REFERENCES LIVRO(ID_LIVRO),
    FOREIGN KEY (ID_AUTOR) REFERENCES AUTOR(ID_AUTOR)
);

CREATE TABLE IF NOT EXISTS EMPRESTIMO (
    ID_EMPRESTIMO           INT PRIMARY KEY,
    data_emprestimo         DATE        NOT NULL,
    data_prevista_devolucao DATE        NOT NULL,
    data_devolucao          DATE,
    valor_multa             DECIMAL(8,2) DEFAULT 0,
    ID_USUARIO              INT NOT NULL,
    ID_LIVRO                INT NOT NULL,
    FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO(ID_USUARIO),
    FOREIGN KEY (ID_LIVRO) REFERENCES LIVRO(ID_LIVRO)
);

CREATE TABLE IF NOT EXISTS RESERVA (
    ID_RESERVA     INT PRIMARY KEY,
    data_reserva   DATE        NOT NULL,
    data_validade  DATE        NOT NULL,
    status_reserva VARCHAR(20) NOT NULL,
    ID_USUARIO     INT NOT NULL,
    ID_LIVRO       INT NOT NULL,
    FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO(ID_USUARIO),
    FOREIGN KEY (ID_LIVRO) REFERENCES LIVRO(ID_LIVRO)
);
