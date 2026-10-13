
-- APD3 - Consultas SQL
-- Sistema de Achados e Perdidos

-- CONSULTA 1: Listar todos os objetos
SELECT * FROM objeto;

-- CONSULTA 2: Objetos perdidos
SELECT nome, descricao, data_ocorrencia
FROM objeto
WHERE status = 'PERDIDO';

-- CONSULTA 3: Objetos por data (mais recentes primeiro)
SELECT nome, data_ocorrencia, status
FROM objeto
ORDER BY data_ocorrencia DESC;

-- CONSULTA 4: Objetos e seus usuarios
SELECT
    o.nome AS objeto,
    u.nome AS responsavel
FROM objeto o
INNER JOIN usuario u
    ON o.id_usuario = u.id_usuario;

-- CONSULTA 5: Objetos, categorias e locais
SELECT
    o.nome AS objeto,
    c.nome AS categoria,
    l.nome AS local,
    o.status
FROM objeto o
INNER JOIN categoria c
    ON o.id_categoria = c.id_categoria
INNER JOIN local l
    ON o.id_local = l.id_local;

-- CONSULTA 6: Quantidade de objetos por categoria
SELECT
    c.nome AS categoria,
    COUNT(o.id_objeto) AS quantidade
FROM categoria c
LEFT JOIN objeto o
    ON c.id_categoria = o.id_categoria
GROUP BY c.id_categoria, c.nome
ORDER BY quantidade DESC;

-- CONSULTA 7: Quantidade de objetos por status
SELECT
    status,
    COUNT(*) AS quantidade
FROM objeto
GROUP BY status
ORDER BY quantidade DESC;

-- CONSULTA 8: Subconsulta - Objetos da Biblioteca
SELECT nome, status
FROM objeto
WHERE id_local = (
    SELECT id_local
    FROM local
    WHERE nome = 'Biblioteca'
);

-- CONSULTA 9: Subconsulta - Usuarios que cadastraram objetos
SELECT nome, email
FROM usuario
WHERE id_usuario IN (
    SELECT id_usuario
    FROM objeto
);

-- CONSULTA 10: Subconsulta - Categorias com objetos
SELECT nome
FROM categoria
WHERE EXISTS (
    SELECT 1
    FROM objeto
    WHERE objeto.id_categoria = categoria.id_categoria
);
