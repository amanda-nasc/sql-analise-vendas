-- Query 2 — Estados que mais venderam
-- Objetivo: Identificar os estados com maior número de vendas no período analisado, apoiando análises geográficas de performance comercial.

SELECT
    'Brazil' AS pais, -- Todos os clientes são brasileiros
    cus.state AS estado,
    COUNT(fun.paid_date) AS "vendas (#)"
FROM sales.funnel AS fun
LEFT JOIN sales.customers AS cus
    ON fun.customer_id = cus.customer_id
WHERE fun.paid_date BETWEEN '2021-08-01' AND '2021-08-31' -- Último mês
GROUP BY pais, estado
ORDER BY "vendas (#)" DESC
LIMIT 5
