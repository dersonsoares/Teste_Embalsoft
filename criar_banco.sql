PRAGMA foreign_keys = ON;

-- =========================================
-- Tabela de Clientes
-- =========================================
CREATE TABLE IF NOT EXISTS TbClientes (
    IdCliente     INTEGER PRIMARY KEY AUTOINCREMENT,
    NomeReduzido  VARCHAR(20)  NOT NULL,
    RazaoSocial   VARCHAR(60)  NOT NULL,
    NatJuridica   CHAR(1)      NOT NULL CHECK (NatJuridica IN ('F', 'J')),
    CPFCNPJ       VARCHAR(14)  NOT NULL,
    DtNascimento  DATETIME,
    DtTmCadastro  DATETIME
);

-- =========================================
-- Tabela de Contatos
-- =========================================
CREATE TABLE IF NOT EXISTS TbContatos (
    IdContato  INTEGER PRIMARY KEY AUTOINCREMENT,
    IdCliente  INTEGER NOT NULL,
    Nome       VARCHAR(60) NOT NULL,
    Email      VARCHAR(90),
    FOREIGN KEY (IdCliente) REFERENCES TbClientes(IdCliente) ON DELETE CASCADE
);

-- Índice para acelerar buscas por RazaoSocial
CREATE INDEX IF NOT EXISTS idx_clientes_razao
    ON TbClientes (RazaoSocial);

-- Índice para acelerar buscas de contatos por IdCliente
CREATE INDEX IF NOT EXISTS idx_contatos_idcliente
    ON TbContatos (IdCliente);
