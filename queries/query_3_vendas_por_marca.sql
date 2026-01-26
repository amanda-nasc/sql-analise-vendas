-- Query 3 — Marcas que mais venderam no mês
-- Objetivo: Analisar quais marcas apresentaram maior volume de vendas no mês, auxiliando na avaliação de performance de produtos.

SELECT
    pro.brand AS marca,
    COUNT(fun.paid_date) AS "vendas (#)"
FROM sales.funnel AS fun
LEFT JOIN sales.products AS pro
    ON fun.product_id = pro.product_id
WHERE fun.paid_date BETWEEN '2021-08-01' AND '2021-08-31' -- Último mês
GROUP BY marca
ORDER BY "vendas (#)" DESC
LIMIT 5
