SELECT *
FROM {{ ref('verifica_total_2011') }}
WHERE total_vendido_2011 != 12646112.16
