-- Query 4 — Lojas que mais venderam
-- Objetivo: Identificar as lojas com melhor desempenho em vendas, permitindo comparar resultados entre pontos de venda.

SELECT
    sto.store_name AS loja,
    COUNT(fun.paid_date) AS "vendas (#)"
FROM sales.funnel AS fun
LEFT JOIN sales.stores AS sto
    ON fun.store_id = sto.store_id
WHERE fun.paid_date BETWEEN '2021-08-01' AND '2021-08-31' -- Último mês
GROUP BY loja
ORDER BY "vendas (#)" DESC
LIMIT 5
