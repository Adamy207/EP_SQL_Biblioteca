-- 01_inserts.sql
-- População inicial do banco de dados da Biblioteca Universitária

USE biblioteca_universitaria;

-- 1. Inserir usuários
INSERT INTO USUARIO (ID_USUARIO, nome, tipo_usuario, matricula, email, telefone) VALUES
(1, 'Ana Silva',        'estudante',   '20230001', 'ana.silva@uni.edu',      '(41) 99999-0001'),
(2, 'Bruno Costa',      'estudante',   '20230002', 'bruno.costa@uni.edu',    '(41) 99999-0002'),
(3, 'Carla Menezes',    'professor',   'P001',     'carla.menezes@uni.edu',  '(41) 99999-0003'),
(4, 'Diego Fernandes',  'bibliotecario','B001',    'diego.fernandes@uni.edu','(41) 99999-0004');

-- 2. Inserir categorias
INSERT INTO CATEGORIA (ID_CATEGORIA, nome_categoria, descricao) VALUES
(1, 'Programação',   'Livros de desenvolvimento de software e programação.'),
(2, 'Banco de Dados','Livros sobre modelagem, SQL e administração de bancos.'),
(3, 'Matemática',    'Livros de cálculo, álgebra e estatística.');

-- 3. Inserir autores
INSERT INTO AUTOR (ID_AUTOR, nome, nacionalidade) VALUES
(1, 'C.J. Date',           'Britânica'),
(2, 'Thomas H. Cormen',    'Americana'),
(3, 'Abraham Silberschatz','Indiana'),
(4, 'Robert Lafore',       'Americana');

-- 4. Inserir livros
INSERT INTO LIVRO (ID_LIVRO, titulo, ano_publicacao, editora, isbn, status, ID_CATEGORIA) VALUES
(1, 'Introdução a Sistemas de Banco de Dados', 2011, 'Pearson',    '9780136086208', 'disponivel', 2),
(2, 'Algoritmos: Teoria e Prática',            2009, 'Campus',     '9788535236996', 'disponivel', 1),
(3, 'Estruturas de Dados em C++',              2003, 'Bookman',    '9788536301235', 'disponivel', 1),
(4, 'Fundamentos de Banco de Dados',           2010, 'McGraw-Hill','9788576054012', 'disponivel', 2),
(5, 'Cálculo Volume 1',                         2000, 'LTC',        '9788521612100', 'disponivel', 3);

-- 5. Relacionar livros e autores
INSERT INTO LIVRO_AUTOR (ID_LIVRO, ID_AUTOR) VALUES
(1, 3),
(2, 2),
(3, 4),
(4, 1),
(5, 2);

-- 6. Inserir empréstimos
INSERT INTO EMPRESTIMO (ID_EMPRESTIMO, data_emprestimo, data_prevista_devolucao, data_devolucao, valor_multa, ID_USUARIO, ID_LIVRO) VALUES
(1, '2025-03-01', '2025-03-10', '2025-03-09',  0.00, 1, 1),
(2, '2025-03-05', '2025-03-12', '2025-03-20', 15.00, 2, 2),
(3, '2025-03-10', '2025-03-17', NULL,          0.00, 1, 3);

-- Atualizar status dos livros emprestados
UPDATE LIVRO SET status = 'emprestado' WHERE ID_LIVRO IN (1, 2, 3);

-- 7. Inserir reservas
INSERT INTO RESERVA (ID_RESERVA, data_reserva, data_validade, status_reserva, ID_USUARIO, ID_LIVRO) VALUES
(1, '2025-03-02', '2025-03-05', 'expirada', 2, 1),
(2, '2025-03-15', '2025-03-20', 'ativa',    3, 4),
(3, '2025-03-18', '2025-03-25', 'ativa',    1, 5);
