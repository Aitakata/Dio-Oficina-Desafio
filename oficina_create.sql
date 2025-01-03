SHOW DATABASES;
CREATE DATABASE oficina;
USE oficina;
SHOW TABLES;
-- Tabela Pessoa
CREATE TABLE IF NOT EXISTS pessoa (
    id INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    end_rua VARCHAR(100) NOT NULL,
    end_numero INT NOT NULL,
    end_bairro VARCHAR(50) NOT NULL,
    end_cidade VARCHAR(50) NOT NULL,
    end_cep CHAR(9) NOT NULL CHECK(LENGTH(end_cep) = 9),
    end_estado ENUM('AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT',
                    'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 
                    'RR', 'SC', 'SP', 'SE', 'TO'),
    CONSTRAINT pk_pessoa PRIMARY KEY (id)
);

-- Tabela Telefone
CREATE TABLE IF NOT EXISTS telefone (
    id INT AUTO_INCREMENT,
    pessoa_id INT,
    ddd CHAR(2) NOT NULL CHECK(LENGTH(ddd) = 2),
    fone VARCHAR(10) NOT NULL,
    CONSTRAINT pk_telefone PRIMARY KEY (id),
    CONSTRAINT fk_telefone_pessoa FOREIGN KEY (pessoa_id) REFERENCES pessoa(id) ON DELETE CASCADE
);

-- Tabela Mecanico
CREATE TABLE IF NOT EXISTS mecanico (
    id INT AUTO_INCREMENT,
    pessoa_id INT NOT NULL,
    especialidade VARCHAR(100) NOT NULL,
    CONSTRAINT pk_mecanico PRIMARY KEY (id),
    CONSTRAINT fk_mecanico_pessoa FOREIGN KEY (pessoa_id) REFERENCES pessoa(id) ON DELETE CASCADE
);

-- Tabela Cliente
CREATE TABLE IF NOT EXISTS cliente (
    id INT AUTO_INCREMENT,
    pessoa_id INT NOT NULL,
    email VARCHAR(100) NOT NULL,
    CONSTRAINT pk_cliente PRIMARY KEY (id),
    CONSTRAINT fk_cliente_pessoa FOREIGN KEY (pessoa_id) REFERENCES pessoa(id) ON DELETE CASCADE
);

-- Tabela Veiculo
CREATE TABLE IF NOT EXISTS veiculo (
    id INT AUTO_INCREMENT,
    cliente_id INT NOT NULL,
    placa VARCHAR(10) NOT NULL UNIQUE,
    modelo VARCHAR(50) NOT NULL,
    ano INT CHECK(ano > 0),
    CONSTRAINT pk_veiculo PRIMARY KEY (id),
    CONSTRAINT fk_veiculo_cliente FOREIGN KEY (cliente_id) REFERENCES cliente(id) ON DELETE CASCADE
);

-- Tabela Servico
CREATE TABLE IF NOT EXISTS servico (
    id INT  AUTO_INCREMENT,
    descricao VARCHAR(255) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL CHECK (preco >= 0),
    CONSTRAINT pk_servico PRIMARY KEY (id)
);

-- Tabela Peca
CREATE TABLE IF NOT EXISTS peca (
    id INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL CHECK(preco >= 0),
	CONSTRAINT pk_peca PRIMARY KEY (id)
);

-- Tabela OrdemServico
CREATE TABLE IF NOT EXISTS ordemServico (
    id INT AUTO_INCREMENT,
    cliente_id INT NOT NULL,
    mecanico_id INT NOT NULL,
    veiculo_id INT NOT NULL,
    dt_os DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_os PRIMARY KEY (id),
    CONSTRAINT fk_os_cliente FOREIGN KEY (cliente_id) REFERENCES cliente(id) ON DELETE CASCADE,
    CONSTRAINT fk_os_mecanico FOREIGN KEY (mecanico_id) REFERENCES mecanico(id) ON DELETE CASCADE,
    CONSTRAINT fk_os_veiculo FOREIGN KEY (veiculo_id) REFERENCES veiculo(id) ON DELETE CASCADE
);

-- Tabela OS_Servico (tabela intermediária)
CREATE TABLE IF NOT EXISTS OS_Servico (
    os_id INT NOT NULL,
    servico_id INT NOT NULL,
    PRIMARY KEY (os_id, servico_id),
    CONSTRAINT fk_os_servico_os FOREIGN KEY (os_id) REFERENCES ordemServico(id) ON DELETE CASCADE,
    CONSTRAINT fk_os_servico_servico FOREIGN KEY (servico_id) REFERENCES servico(id) ON DELETE CASCADE
);

-- Tabela OS_Peca
CREATE TABLE IF NOT EXISTS OS_Peca (
    os_id INT NOT NULL,
    peca_id INT NOT NULL,
    quantidade INT NOT NULL CHECK(quantidade > 0),
    CONSTRAINT pk_os_peca PRIMARY KEY (os_id, peca_id),
    CONSTRAINT fk_os_peca_os FOREIGN KEY (os_id) REFERENCES OrdemServico(id) ON DELETE CASCADE,
    CONSTRAINT fk_os_peca_peca FOREIGN KEY (peca_id) REFERENCES Peca(id) ON DELETE CASCADE
);

show tables;


drop table pessoa;
drop table telefone;
drop table mecanico;
drop table cliente;
drop table veiculo;
drop table ordemservico;
drop table peca;
drop table servico;
drop table os_peca;
drop table os_servico;
