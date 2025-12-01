-- 03_updates_deletes.sql
-- Comandos UPDATE e DELETE para o sistema de Biblioteca Universitária

USE biblioteca_universitaria;

-- =========================
-- UPDATES
-- =========================

-- 1. Registrar devolução atrasada do empréstimo 3 com multa de 5.00
UPDATE EMPRESTIMO
SET data_devolucao = CURRENT_DATE,
    valor_multa    = 5.00
WHERE ID_EMPRESTIMO = 3;

-- Atualizar o status do livro do empréstimo 3 para 'disponivel'
UPDATE LIVRO
SET status = 'disponivel'
WHERE ID_LIVRO = (
    SELECT ID_LIVRO
    FROM EMPRESTIMO
    WHERE ID_EMPRESTIMO = 3
);

-- 2. Alterar tipo de usuário (exemplo: Bruno virou professor)
UPDATE USUARIO
SET tipo_usuario = 'professor'
WHERE ID_USUARIO = 2;

-- 3. Marcar reservas expiradas automaticamente
UPDATE RESERVA
SET status_reserva = 'expirada'
WHERE status_reserva = 'ativa'
  AND data_validade < CURRENT_DATE;

-- =========================
-- DELETES
-- =========================

-- 1. Remover reservas expiradas há mais de 30 dias
-- MySQL syntax: CURRENT_DATE - INTERVAL 30 DAY
DELETE FROM RESERVA
WHERE status_reserva = 'expirada'
  AND data_validade < (CURRENT_DATE - INTERVAL 30 DAY);

-- 2. Remover empréstimos antigos de um usuário específico
DELETE FROM EMPRESTIMO
WHERE ID_USUARIO = 4
  AND data_emprestimo < '2025-01-01';

-- 3. Excluir autor que não possui mais livros associados
DELETE FROM AUTOR
WHERE ID_AUTOR = 4
  AND ID_AUTOR NOT IN (
      SELECT ID_AUTOR FROM LIVRO_AUTOR
  );
