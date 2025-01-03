-- listar todos os clientes e seus veiculos
SELECT 
    c.id AS cliente_id, 
    p.nome AS cliente_nome, 
    v.placa, 
    v.modelo, 
    v.ano
FROM 
    cliente c
JOIN 
    pessoa p ON c.pessoa_id = p.id
JOIN 
    veiculo v ON c.id = v.cliente_id;

-- contar quantos veiculos cada cliente possui
SELECT 
    c.id AS cliente_id, 
    p.nome AS cliente_nome, 
    COUNT(v.id) AS quantidade_veiculos
FROM 
    cliente c
JOIN 
    pessoa p ON c.pessoa_id = p.id
JOIN 
    veiculo v ON c.id = v.cliente_id
GROUP BY 
    c.id, p.nome
ORDER BY 
    quantidade_veiculos DESC;
    
-- listar ordens de serviço com o total de servico e peças agrupadas por cliente
SELECT 
    os.cliente_id,
    p.nome AS cliente_nome,
    COUNT(DISTINCT oss.servico_id) AS total_servicos,
    COUNT(DISTINCT osp.peca_id) AS total_pecas
FROM 
    ordemServico os
JOIN 
    pessoa p ON os.cliente_id = p.id
LEFT JOIN 
    OS_Servico oss ON os.id = oss.os_id
LEFT JOIN 
    OS_Peca osp ON os.id = osp.os_id
GROUP BY 
    os.cliente_id, p.nome
HAVING 
    total_servicos > 0 OR total_pecas > 0
ORDER BY 
    total_servicos DESC, total_pecas DESC;

 -- listar mecanicos com suas especialidades e o numero de OS que atenderam
SELECT 
    m.id AS mecanico_id, 
    p.nome AS mecanico_nome, 
    m.especialidade, 
    COUNT(os.id) AS quantidade_ordens_servico
FROM 
    mecanico m
JOIN 
    pessoa p ON m.pessoa_id = p.id
LEFT JOIN 
    ordemServico os ON m.id = os.mecanico_id
GROUP BY 
    m.id, p.nome, m.especialidade
ORDER BY 
    quantidade_ordens_servico DESC;

-- listar todos os serviços realizados em um determinado veiculo
SELECT 
    os.id AS ordem_servico_id, 
    s.descricao AS servico, 
    os.dt_os
FROM 
    ordemServico os
JOIN 
    OS_Servico oss ON os.id = oss.os_id
JOIN 
    servico s ON oss.servico_id = s.id
WHERE 
    os.veiculo_id = 1
ORDER BY 
    os.dt_os DESC;
    
-- listar pelas utilizadas em ordens de servico e a quantidade total de cada peça utilizada
SELECT 
    p.nome AS peca_nome, 
    SUM(osp.quantidade) AS quantidade_total
FROM 
    peca p
JOIN 
    OS_Peca osp ON p.id = osp.peca_id
GROUP BY 
    p.nome
ORDER BY 
    quantidade_total DESC;


