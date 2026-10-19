/* L�gico_BD_corrigido: */

CREATE TABLE Usuario (
    id_usuario INTEGER PRIMARY KEY,
    nome VARCHAR,
    email VARCHAR,
    matricula VARCHAR,
    telefone VARCHAR
);

CREATE TABLE Local (
    id_local INTEGER PRIMARY KEY,
    nome VARCHAR,
    bloco VARCHAR,
    descricao VARCHAR
);

CREATE TABLE Objeto (
    id_objeto INTEGER PRIMARY KEY,
    nome VARCHAR,
    descricao VARCHAR,
    data_ocorrencia DATE,
    status VARCHAR,
    fk_Usuario_id_usuario INTEGER,
    fk_Local_id_local INTEGER
);
 
ALTER TABLE Objeto ADD CONSTRAINT FK_Objeto_2
    FOREIGN KEY (fk_Usuario_id_usuario)
    REFERENCES Usuario (id_usuario)
    ON DELETE CASCADE;
 
ALTER TABLE Objeto ADD CONSTRAINT FK_Objeto_3
    FOREIGN KEY (fk_Local_id_local)
    REFERENCES Local (id_local)
    ON DELETE CASCADE;