-- Query 5 — Dias da semana com maior número de visitas
-- Objetivo: Analisar o comportamento de visitas ao site ao longo da semana, identificando os dias com maior volume de acessos.

SELECT
    EXTRACT('dow' FROM visit_page_date) AS dia_semana_numero,
    CASE 
        WHEN EXTRACT('dow' FROM visit_page_date) = 0 THEN 'domingo'
        WHEN EXTRACT('dow' FROM visit_page_date) = 1 THEN 'segunda'
        WHEN EXTRACT('dow' FROM visit_page_date) = 2 THEN 'terça'
        WHEN EXTRACT('dow' FROM visit_page_date) = 3 THEN 'quarta'
        WHEN EXTRACT('dow' FROM visit_page_date) = 4 THEN 'quinta'
        WHEN EXTRACT('dow' FROM visit_page_date) = 5 THEN 'sexta'
        WHEN EXTRACT('dow' FROM visit_page_date) = 6 THEN 'sábado'
    END AS dia_da_semana,
    COUNT(*) AS "visitas (#)"
FROM sales.funnel
WHERE visit_page_date BETWEEN '2021-08-01' AND '2021-08-31'
GROUP BY dia_semana_numero
ORDER BY dia_semana_numero
