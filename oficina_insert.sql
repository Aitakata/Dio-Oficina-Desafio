
-- Inserindo pessoas
INSERT INTO pessoa (nome, end_rua, end_numero, end_bairro, end_cidade, end_cep, end_estado)
VALUES
('João Silva', 'Rua A', 123, 'Bairro 1', 'Cidade 1', '12345-678', 'SP'),
('Maria Oliveira', 'Rua B', 456, 'Bairro 2', 'Cidade 2', '23456-789', 'RJ'),
('Carlos Souza', 'Rua C', 789, 'Bairro 3', 'Cidade 3', '34567-890', 'MG'),
('Ana Pereira', 'Rua D', 101, 'Bairro 4', 'Cidade 4', '45678-901', 'BA'),
('Luiz Santos', 'Rua E', 202, 'Bairro 5', 'Cidade 5', '56789-012', 'PR'),
('Fernanda Lima', 'Rua F', 303, 'Bairro 6', 'Cidade 6', '67890-123', 'RS'),
('Ricardo Almeida', 'Rua G', 404, 'Bairro 7', 'Cidade 7', '78901-234', 'PE'),
('Paula Costa', 'Rua H', 505, 'Bairro 8', 'Cidade 8', '89012-345', 'SC'),
('Roberto Carvalho', 'Rua I', 606, 'Bairro 9', 'Cidade 9', '90123-456', 'PA'),
('Beatriz Gomes', 'Rua J', 707, 'Bairro 10', 'Cidade 10', '01234-567', 'CE');
-- SELECT * FROM pessoa;
-- Inserindo telefones
INSERT INTO telefone (pessoa_id, ddd, fone)
VALUES
(1, '11', '912345678'),
(2, '21', '922345678'),
(3, '31', '933345678'),
(4, '41', '944345678'),
(5, '51', '955345678'),
(1, '11', '912345679'),
(6, '61', '966345678'),
(7, '71', '977345678'),
(8, '81', '988345678'),
(9, '91', '999345678'),
(10, '85', '988765432');
-- SELECT * FROM telefone;
-- Inserindo mecanicos
INSERT INTO mecanico (pessoa_id, especialidade)
VALUES
(1, 'Motor'),
(3, 'Freios'),
(5, 'Suspensão'),
(7, 'Elétrica'),
(9, 'Pintura');
SELECT * FROM mecanico;
-- Inserindo clientes
INSERT INTO cliente (pessoa_id, email)
VALUES
(2, 'maria@gmail.com'),
(4, 'ana@gmail.com'),
(6, 'fernanda@gmail.com'),
(8, 'paula@gmail.com'),
(10, 'beatriz@gmail.com'),
(1, 'joao@gmail.com'),
(3, 'carlos@gmail.com'),
(5, 'luiz@gmail.com'),
(7, 'ricardo@gmail.com'),
(9, 'roberto@gmail.com');
SELECT * FROM cliente;

-- Inserindo veiculos
-- Inserindo veículos com variação no número de veículos por cliente
INSERT INTO veiculo (cliente_id, placa, modelo, ano)
VALUES
(1, 'ABC1234', 'Modelo A', 2020), -- Cliente 1 veiculo 1
(1, 'DEF5678', 'Modelo B', 2019), --           veiculo 2
(2, 'GHI9012', 'Modelo C', 2018), -- Cliente 2 com apenas 1 veículo
(3, 'JKL3456', 'Modelo D', 2021), -- Cliente 3 com apenas 1 veículo
(4, 'MNO7890', 'Modelo E', 2020), -- Cliente 4 veiculo 1
(4, 'PQR1234', 'Modelo F', 2021), --           veiculo 2
(4, 'STU5678', 'Modelo G', 2019), --           veiculo 3
(5, 'VWX9012', 'Modelo H', 2018), -- Cliente 5 com 1 veículo
(6, 'YZA3456', 'Modelo I', 2021), -- Cliente 6 veiculo 1
(6, 'BCD7890', 'Modelo J', 2020), --           veiculo 2
(7, 'EFG1234', 'Modelo K', 2021), -- Cliente 7 com apenas 1 veículo
(8, 'HIJ5678', 'Modelo L', 2019), -- Cliente 8 com apenas 1 veículo
(9, 'KLM9012', 'Modelo M', 2020), -- Cliente 9 veiculo 1
(9, 'NOP3456', 'Modelo N', 2021), --           veiculo 2
(10, 'QRS7890', 'Modelo O', 2020); -- Cliente 10 com apenas 1 veículo
DELETE FROM veiculo;
SELECT * FROM veiculo;
-- Inserindo serviços
INSERT INTO servico (descricao, preco)
VALUES
('Troca de óleo', 200.00),
('Alinhamento', 100.00),
('Revisão geral', 500.00),
('Troca de pneus', 400.00),
('Balanceamento', 150.00),
('Troca de bateria', 300.00),
('Pintura', 600.00),
('Polimento', 250.00);
SELECT * FROM servico;
-- Inserindo peças
INSERT INTO peca (nome, preco)
VALUES
('Filtro de óleo', 50.00),
('Pneu', 300.00),
('Bateria', 400.00),
('Velas de ignição', 100.00),
('Correia dentada', 150.00),
('Pastilha de freio', 200.00),
('Amortecedor', 350.00),
('Radiador', 600.00),
('Bomba de combustível', 500.00),
('Farol', 250.00),
('Para-choque', 700.00),
('Para-brisa', 600.00),
('Escapamento', 450.00),
('Catalisador', 650.00),
('Lanterna traseira', 150.00);
SELECT * FROM peca;
-- Inserindo ordens de serviço
-- Inserindo ordens de serviço com IDs corretos
INSERT INTO ordemServico (cliente_id, mecanico_id, veiculo_id)
VALUES
(1, 1, 1),
(1, 1, 2),
(2, 2, 3),
(3, 3, 4),
(4, 3, 5),
(4, 1, 6),
(4, 2, 7),
(5, 4, 8),
(6, 4, 9),
(6, 5, 10),
(7, 5, 1),
(8, 3, 2),
(9, 4, 3),
(9, 2, 4), 
(10, 1, 5);
SELECT * FROM ordemServico;

-- Inserindo OS_Servico
INSERT INTO OS_Servico (os_id, servico_id)
VALUES
(16, 1),
(17, 2),
(18, 3),
(19, 4),
(20, 5),
(21, 6),
(22, 7),
(23, 8),
(24, 1),
(25, 2),
(26, 3),
(27, 4),
(28, 5),
(29, 6),
(30, 7);

-- Inserindo OS_Peca
INSERT INTO OS_Peca (os_id, peca_id, quantidade)
VALUES
(16, 1, 2),
(17, 2, 4),
(18, 3, 1),
(19, 4, 8),
(20, 5, 6),
(21, 6, 3),
(22, 7, 2),
(23, 8, 5),
(24, 9, 7),
(25, 10, 4),
(26, 11, 1),
(27, 12, 3),
(28, 13, 2),
(29, 14, 6),
(30, 15, 5);
