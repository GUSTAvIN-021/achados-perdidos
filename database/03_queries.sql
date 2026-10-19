
-- APD3 - Consultas SQL
-- Sistema de Achados e Perdidos

-- 1. Listar todos os objetos
SELECT * FROM objeto;

-- 2. Listar objetos perdidos
SELECT nome, descricao, data_ocorrencia
FROM objeto
WHERE status = 'PERDIDO';

-- 3. Ordenar objetos por data
SELECT nome, data_ocorrencia, status
FROM objeto
ORDER BY data_ocorrencia DESC;

-- 4. Objetos e usuarios
SELECT o.nome AS objeto, u.nome AS usuario
FROM objeto o
INNER JOIN usuario u
ON o.id_usuario = u.id_usuario;

-- 5. Objetos, usuarios e locais
SELECT
    o.nome AS objeto,
    u.nome AS usuario,
    l.nome AS local,
    o.status
FROM objeto o
INNER JOIN usuario u ON o.id_usuario = u.id_usuario
INNER JOIN local l ON o.id_local = l.id_local;

-- 6. Quantidade de objetos por local
SELECT
    l.nome AS local,
    COUNT(o.id_objeto) AS quantidade
FROM local l
LEFT JOIN objeto o ON l.id_local = o.id_local
GROUP BY l.id_local, l.nome
ORDER BY quantidade DESC;

-- 7. Quantidade de objetos por status
SELECT status, COUNT(*) AS quantidade
FROM objeto
GROUP BY status;

-- 8. Subconsulta: objetos da Biblioteca
SELECT nome, status
FROM objeto
WHERE id_local IN (
    SELECT id_local
    FROM local
    WHERE nome = 'Biblioteca'
);

-- 9. Usuarios que cadastraram objetos
SELECT nome, email
FROM usuario
WHERE id_usuario IN (
    SELECT id_usuario
    FROM objeto
);

-- 10. Locais com objetos registrados
SELECT nome
FROM local l
WHERE EXISTS (
    SELECT 1
    FROM objeto o
    WHERE o.id_local = l.id_local
);
