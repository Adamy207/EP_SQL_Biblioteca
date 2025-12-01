-- 02_selects.sql
-- Consultas SELECT para o sistema de Biblioteca Universitária

USE biblioteca_universitaria;

-- 1. Listar todos os livros com suas categorias
SELECT
    l.ID_LIVRO,
    l.titulo,
    c.nome_categoria AS categoria,
    l.status
FROM LIVRO l
JOIN CATEGORIA c ON l.ID_CATEGORIA = c.ID_CATEGORIA
ORDER BY c.nome_categoria, l.titulo;

-- 2. Listar os empréstimos com nome do usuário e título do livro
SELECT
    e.ID_EMPRESTIMO,
    u.nome  AS nome_usuario,
    l.titulo AS titulo_livro,
    e.data_emprestimo,
    e.data_prevista_devolucao,
    e.data_devolucao,
    e.valor_multa
FROM EMPRESTIMO e
JOIN USUARIO u ON e.ID_USUARIO = u.ID_USUARIO
JOIN LIVRO   l ON e.ID_LIVRO    = l.ID_LIVRO
ORDER BY e.data_emprestimo DESC;

-- 3. Listar apenas livros disponíveis
SELECT
    ID_LIVRO,
    titulo,
    status
FROM LIVRO
WHERE status = 'disponivel'
ORDER BY titulo;

-- 4. Top 3 usuários com mais empréstimos
SELECT
    u.ID_USUARIO,
    u.nome,
    COUNT(e.ID_EMPRESTIMO) AS total_emprestimos
FROM USUARIO u
LEFT JOIN EMPRESTIMO e ON u.ID_USUARIO = e.ID_USUARIO
GROUP BY u.ID_USUARIO, u.nome
ORDER BY total_emprestimos DESC
LIMIT 3;

-- 5. Listar reservas ativas com nome do usuário e livro
SELECT
    r.ID_RESERVA,
    u.nome  AS nome_usuario,
    l.titulo AS titulo_livro,
    r.data_reserva,
    r.data_validade,
    r.status_reserva
FROM RESERVA r
JOIN USUARIO u ON r.ID_USUARIO = u.ID_USUARIO
JOIN LIVRO   l ON r.ID_LIVRO    = l.ID_LIVRO
WHERE r.status_reserva = 'ativa'
ORDER BY r.data_reserva DESC;
