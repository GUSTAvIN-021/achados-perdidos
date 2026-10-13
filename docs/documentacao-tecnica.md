# Projeto Integrador de Banco de Dados I
## APD1 — Modelagem Conceitual

**Projeto:** Sistema Web de Achados e Perdidos para Ambiente Acadêmico

**Curso:** Bacharelado em Engenharia da Computação

**Disciplina:** Banco de Dados I

**Integrantes:**
- Jorge Matheus
- Gustavo Amaral

### 1. Contextualização

Em instituições de ensino, é comum que alunos, professores e funcionários percam ou encontrem objetos pessoais em salas de aula, laboratórios, bibliotecas e demais espaços.

A divulgação desses objetos geralmente ocorre de maneira informal, dificultando sua identificação e devolução.

O Sistema Web de Achados e Perdidos tem como proposta centralizar essas informações, proporcionando maior organização e facilidade na consulta dos registros.

### 2. Objetivo

Desenvolver uma base de dados relacional para gerenciar objetos perdidos e encontrados no ambiente acadêmico.

O sistema permitirá registrar informações sobre os objetos, seus responsáveis, categorias e locais de ocorrência.

Posteriormente, a base de dados será integrada a uma aplicação web com funcionalidades CRUD e consultas.

### 3. Requisitos funcionais

- RF01 — Cadastrar usuários.
- RF02 — Cadastrar categorias de objetos.
- RF03 — Cadastrar locais da instituição.
- RF04 — Cadastrar objetos perdidos ou encontrados.
- RF05 — Consultar objetos cadastrados.
- RF06 — Editar informações dos objetos.
- RF07 — Excluir registros de objetos.
- RF08 — Pesquisar objetos por nome, categoria, local e status.
- RF09 — Atualizar o status dos objetos para perdido, encontrado ou devolvido.

### 4. Regras de negócio

- RN01 — Cada usuário possui um identificador único.
- RN02 — Um usuário pode registrar vários objetos.
- RN03 — Cada objeto deve estar associado a exatamente um usuário.
- RN04 — Cada objeto pertence a uma única categoria.
- RN05 — Uma categoria pode classificar vários objetos.
- RN06 — Cada objeto deve estar associado a um local.
- RN07 — Um local pode estar associado a vários objetos.
- RN08 — Cada objeto possui um status que indica sua situação atual.
- RN09 — O e-mail e a matrícula dos usuários, quando informada, devem ser únicos.

### 5. Modelo Entidade-Relacionamento (MER)

O modelo conceitual foi desenvolvido utilizando o software brModelo.

Foram definidas quatro entidades principais:

**USUARIO:** armazena informações dos responsáveis pelos registros.

Atributos: id_usuario (identificador), nome, email, matricula e telefone.

**OBJETO:** armazena as informações dos objetos perdidos ou encontrados.

Atributos: id_objeto (identificador), nome, descricao, data_ocorrencia e status.

**CATEGORIA:** representa a classificação dos objetos.

Atributos: id_categoria (identificador), nome e descricao.

**LOCAL:** representa os espaços físicos da instituição.

Atributos: id_local (identificador), nome, bloco e descricao.

### 6. Relacionamentos e cardinalidades

**USUARIO — REGISTRA — OBJETO**

Um usuário pode registrar zero ou vários objetos. Cada objeto deve possuir exatamente um usuário responsável.

Cardinalidade: 1:N.

**CATEGORIA — CLASSIFICA — OBJETO**

Uma categoria pode classificar zero ou vários objetos. Cada objeto deve pertencer a exatamente uma categoria.

Cardinalidade: 1:N.

**LOCAL — OCORRE — OBJETO**

Um local pode estar associado a zero ou vários registros de objetos. Cada objeto deve estar associado a exatamente um local.

Cardinalidade: 1:N.

### 7. Justificativa da modelagem

A entidade OBJETO foi definida como elemento central do sistema, pois representa as ocorrências que serão registradas.

As entidades USUARIO, CATEGORIA e LOCAL foram separadas para organizar as informações e evitar a repetição desnecessária de dados.

Essa estrutura permite que um mesmo usuário registre diferentes objetos, que vários objetos compartilhem uma categoria e que um mesmo local esteja associado a diversas ocorrências.

A utilização de identificadores únicos facilita a identificação dos registros e prepara a base para o desenvolvimento do modelo lógico e a aplicação das regras de normalização nas próximas etapas.

### 8. Tecnologias previstas

- brModelo: elaboração dos modelos conceitual e lógico.
- PostgreSQL/Supabase: implementação futura do banco de dados relacional.
- HTML, CSS e JavaScript: desenvolvimento previsto da interface web.
- Git e GitHub: versionamento dos arquivos e documentação.

### 9. Próximas etapas

**APD2:** elaboração do modelo lógico relacional e aplicação das regras de normalização.

**APD3:** implementação física do banco de dados, inserção de registros e desenvolvimento de consultas SQL.

**APD4:** desenvolvimento de um MVP web integrado ao banco de dados, com funcionalidades CRUD e consultas.