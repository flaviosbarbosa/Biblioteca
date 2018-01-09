
-- ER/Studio 8.0 SQL Code Generation
-- Company :      particular
-- Project :      DERBIBLIOTECA.DM1
-- Author :       Usuário do Windows
--
-- Date Created : Monday, January 08, 2018 22:06:29
-- Target DBMS : Oracle 11g
--

-- 
-- TABLE: Autor 
--

CREATE TABLE Autor(
    codautor    integer    NOT NULL,
    dsccpf      VARCHAR(14)     NOT NULL,
    dscnome     VARCHAR(40)     NOT NULL,
    CONSTRAINT PK_AUTOR PRIMARY KEY (codautor)
)
;



-- 
-- TABLE: Cargo 
--

CREATE TABLE Cargo(
    codcargo      integer    NOT NULL,
    dsccargo      VARCHAR(30)     NOT NULL,
    dscsalario    VARCHAR(20)     NOT NULL,
    CONSTRAINT PK_CARGO PRIMARY KEY (codcargo)
)
;



-- 
-- TABLE: Categoria 
--

CREATE TABLE Categoria(
    codcategoria    integer    NOT NULL,
    dsccategoria    VARCHAR(50)     NOT NULL,
    CONSTRAINT PK_CATEGORIA PRIMARY KEY (codcategoria)
)
;



-- 
-- TABLE: CIDADE 
--

CREATE TABLE CIDADE(
    CODCIDADE    integer    NOT NULL,
    DSCIDADE     VARCHAR(100)    NOT NULL,
    DSCUF        VARCHAR(2)      NOT NULL,
    CONSTRAINT PK_CIDADE PRIMARY KEY (CODCIDADE)
)
;



-- 
-- TABLE: Cliente 
--

CREATE TABLE Cliente(
    codcliente        integer    NOT NULL,
    dscnome           VARCHAR(70)     NOT NULL,
    dsccpf            VARCHAR(14),
    datnascimento     DATE,
    dscsexo           VARCHAR(1)      DEFAULT 'M' NOT NULL,
    dscendereco       VARCHAR(70),
    dsccomplemento    VARCHAR(50),
    dscnumero         VARCHAR(10),
    dscbairro         VARCHAR(50),
    CODCIDADE         integer    NOT NULL,
    CONSTRAINT PK_CLIENTE PRIMARY KEY (codcliente)
)
;



-- 
-- TABLE: Contato 
--

CREATE TABLE Contato(
    codclientecontato    integer    NOT NULL,
    codcliente           integer    NOT NULL,
    codtipocontato       integer    NOT NULL,
    dsccontato           VARCHAR(100),
    CONSTRAINT PK_CONTATO PRIMARY KEY (codclientecontato)
)
;



-- 
-- TABLE: ContatoFornecedor 
--

CREATE TABLE ContatoFornecedor(
    codfornecedorcontato    integer    NOT NULL,
    codtipocontato          integer    NOT NULL,
    codfornecedor           integer    NOT NULL,
    dsccontato              VARCHAR(100),
    CONSTRAINT PK_CONTATOFORNECEDOR PRIMARY KEY (codfornecedorcontato)
)
;



-- 
-- TABLE: Editora 
--

CREATE TABLE Editora(
    codeditora        integer    NOT NULL,
    dsceditora        VARCHAR(50)     NOT NULL,
    dscendereco       VARCHAR(100)    NOT NULL,
    dsccomplemento    VARCHAR(100)    NOT NULL,
    dscnumero         VARCHAR(100)    NOT NULL,
    dscbairro         VARCHAR(50)     NOT NULL,
    CODCIDADE         integer    NOT NULL,
    CONSTRAINT PK_EDITORA PRIMARY KEY (codeditora)
)
;



-- 
-- TABLE: Emprestimo 
--

CREATE TABLE Emprestimo(
    codemprestimo    integer    NOT NULL,
    codcliente       integer    NOT NULL,
    valmultatotal    decimal(9, 2)     DEFAULT 0 NOT NULL,
    datemprestimo    DATE             DEFAULT 'now',
    datprevista      DATE,
    idtsituacao      VARCHAR(1)      DEFAULT 'E',
    idtmultapaga     VARCHAR(1)      DEFAULT 'N',
    DATPAGAMENTOMULTA              DATE,
    CONSTRAINT PK_EMPRESTIMO PRIMARY KEY (codemprestimo)
)
;



-- 
-- TABLE: emprestimolivro 
--

CREATE TABLE emprestimolivro(
    codemprestimolivro    integer    NOT NULL,
    codemprestimo         integer    NOT NULL,
    codlivro              integer    NOT NULL,
    datdevolucao          DATE,
    valvalormulta         DECIMAL(9, 2)     DEFAULT 0,
    CONSTRAINT PK_EMPRESTIMOLIVRO PRIMARY KEY (codemprestimolivro)
)
;



-- 
-- TABLE: Fornecedor 
--

CREATE TABLE Fornecedor(
    codfornecedor    integer    NOT NULL,
    dscfornecedor    VARCHAR(50),
    dscendereco      VARCHAR(50),
    dsccidade        VARCHAR(50),
    dscbairro        VARCHAR(50),
    dscestado        VARCHAR(50),
    dsccep           VARCHAR(9),
    CONSTRAINT PK_FORNECEDOR PRIMARY KEY (codfornecedor)
)
;



-- 
-- TABLE: Funcionario 
--

CREATE TABLE Funcionario(
    codfuncionario    integer    NOT NULL,
    dscnome           VARCHAR(70)     NOT NULL,
    dsccpf            VARCHAR(14)     NOT NULL,
    dscendereco       VARCHAR(70),
    dsccomplemento    VARCHAR(50),
    dscnumero         VARCHAR(18),
    dscbairro         VARCHAR(50),
    codcargo          integer    NOT NULL,
    CODCIDADE         integer    NOT NULL,
    CONSTRAINT PK_FUNCIONARIO PRIMARY KEY (codfuncionario)
)
;



-- 
-- TABLE: Livros 
--

CREATE TABLE Livros(
    codlivro            integer    NOT NULL,
    numanopublicacao    integer    NOT NULL,
    numcustomedio       DECIMAL(9, 2)     DEFAULT 0,
    dsclivro            VARCHAR(100)    NOT NULL,
    codeditora          integer    NOT NULL,
    codautor            integer    NOT NULL,
    codcategoria        integer    NOT NULL,
    numquantidade       integer    DEFAULT 0 NOT NULL,
    CONSTRAINT PK_LIVROS PRIMARY KEY (codlivro)
)
;



-- 
-- TABLE: PARAMETROS 
--

CREATE TABLE PARAMETROS(
    CODPARAMETRO      integer    NOT NULL,
    VALMULTADIARIA    DECIMAL(9, 2)     DEFAULT 0,
    CONSTRAINT PK_PARAMETROS PRIMARY KEY (CODPARAMETRO)
)
;



-- 
-- TABLE: Tipocontato 
--

CREATE TABLE Tipocontato(
    codtipocontato    integer    NOT NULL,
    dsctipocontato    VARCHAR(30),
    CONSTRAINT PK_TIPOCONTRATO PRIMARY KEY (codtipocontato)
)
;



-- 
-- TABLE: UF 
--

CREATE TABLE UF(
    DSCUF           VARCHAR(2)     NOT NULL,
    DSCDESCRICAO    VARCHAR(70)    NOT NULL,
    CONSTRAINT PK_UF PRIMARY KEY (DSCUF)
)
;



-- 
-- TABLE: CIDADE 
--

ALTER TABLE CIDADE ADD CONSTRAINT FK_UF_CIDADE 
    FOREIGN KEY (DSCUF)
    REFERENCES UF(DSCUF)
;


-- 
-- TABLE: Cliente 
--

ALTER TABLE Cliente ADD CONSTRAINT FK_CIDADE_CLIENTE 
    FOREIGN KEY (CODCIDADE)
    REFERENCES CIDADE(CODCIDADE)
;


-- 
-- TABLE: Contato 
--

ALTER TABLE Contato ADD CONSTRAINT FK_CLIENTE_CONTATO 
    FOREIGN KEY (codcliente)
    REFERENCES Cliente(codcliente)
;

ALTER TABLE Contato ADD CONSTRAINT FK_TIPOCONTATO_CONTATO 
    FOREIGN KEY (codtipocontato)
    REFERENCES Tipocontato(codtipocontato)
;


-- 
-- TABLE: ContatoFornecedor 
--

ALTER TABLE ContatoFornecedor ADD CONSTRAINT "FK_FORNECEDOR_CONTFORNEC" 
    FOREIGN KEY (codfornecedor)
    REFERENCES Fornecedor(codfornecedor)
;

ALTER TABLE ContatoFornecedor ADD CONSTRAINT FK_TIPOCONTATO_CONTATOFORNEC 
    FOREIGN KEY (codtipocontato)
    REFERENCES Tipocontato(codtipocontato)
;


-- 
-- TABLE: Editora 
--

ALTER TABLE Editora ADD CONSTRAINT FK_CIDADE_EDITORA 
    FOREIGN KEY (CODCIDADE)
    REFERENCES CIDADE(CODCIDADE)
;


-- 
-- TABLE: Emprestimo 
--

ALTER TABLE Emprestimo ADD CONSTRAINT FK_CLIENTE_EMPRESTIMO
    FOREIGN KEY (codcliente)
    REFERENCES Cliente(codcliente)
;


-- 
-- TABLE: emprestimolivro 
--

ALTER TABLE emprestimolivro ADD CONSTRAINT FK_EMPRESTIMO_EMPRESTIMOLIVRO 
    FOREIGN KEY (codemprestimo)
    REFERENCES Emprestimo(codemprestimo)
;

ALTER TABLE emprestimolivro ADD CONSTRAINT FK_LIVRO_EMPRESTIMOLIVRO 
    FOREIGN KEY (codlivro)
    REFERENCES Livros(codlivro)
;

-- 
-- TABLE: Funcionario 
--

ALTER TABLE Funcionario ADD CONSTRAINT FK_CARGO_FUNCIONARIO 
    FOREIGN KEY (codcargo)
    REFERENCES Cargo(codcargo)
;

ALTER TABLE Funcionario ADD CONSTRAINT FK_CIDADE_FUNCIONARIO 
    FOREIGN KEY (CODCIDADE)
    REFERENCES CIDADE(CODCIDADE)
;


-- 
-- TABLE: Livros 
--

ALTER TABLE Livros ADD CONSTRAINT FK_AUTOR_LIVROS 
    FOREIGN KEY (codautor)
    REFERENCES Autor(codautor)
;

ALTER TABLE Livros ADD CONSTRAINT FK_CATEGORIA_LIVROS 
    FOREIGN KEY (codcategoria)
    REFERENCES Categoria(codcategoria)
;

ALTER TABLE Livros ADD CONSTRAINT FK_EDITORA_LIVROS 
    FOREIGN KEY (codeditora)
    REFERENCES Editora(codeditora)
;


