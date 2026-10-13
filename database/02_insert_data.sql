
-- APD3 - Insercao de dados ficticios

-- 1. Usuarios
INSERT INTO usuario (nome, email, matricula, telefone)
VALUES
('Ana Souza', 'ana.souza@exemplo.com', '2026001', '21999990001'),
('Pedro Lima', 'pedro.lima@exemplo.com', '2026002', '21999990002'),
('Mariana Costa', 'mariana.costa@exemplo.com', '2026003', '21999990003');

-- 2. Categorias
INSERT INTO categoria (nome, descricao)
VALUES
('Eletronicos', 'Celulares, carregadores e dispositivos'),
('Material Escolar', 'Cadernos, livros e estojos'),
('Acessorios', 'Garrafas, chaves e guarda-chuvas');

-- 3. Locais
INSERT INTO local (nome, bloco, descricao)
VALUES
('Biblioteca', 'Bloco A', 'Biblioteca principal'),
('Laboratorio 201', 'Bloco B', 'Laboratorio de informatica'),
('Cantina', 'Bloco C', 'Area de alimentacao');

-- 4. Objetos
INSERT INTO objeto
(nome, descricao, data_ocorrencia, status,
 id_usuario, id_categoria, id_local)
VALUES
('Carregador USB-C', 'Carregador preto',
 '2026-10-01', 'ENCONTRADO',
 (SELECT id_usuario FROM usuario WHERE matricula = '2026001'),
 (SELECT id_categoria FROM categoria WHERE nome = 'Eletronicos'),
 (SELECT id_local FROM local WHERE nome = 'Biblioteca')),

('Caderno Azul', 'Caderno de matematica',
 '2026-10-02', 'PERDIDO',
 (SELECT id_usuario FROM usuario WHERE matricula = '2026002'),
 (SELECT id_categoria FROM categoria WHERE nome = 'Material Escolar'),
 (SELECT id_local FROM local WHERE nome = 'Laboratorio 201')),

('Garrafa Preta', 'Garrafa de 500ml',
 '2026-10-03', 'DEVOLVIDO',
 (SELECT id_usuario FROM usuario WHERE matricula = '2026003'),
 (SELECT id_categoria FROM categoria WHERE nome = 'Acessorios'),
 (SELECT id_local FROM local WHERE nome = 'Cantina'));
