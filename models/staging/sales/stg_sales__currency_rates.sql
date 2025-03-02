WITH currency_rate_raw AS (
    SELECT *
    FROM {{ source('sales', 'CurrencyRate') }}
)

, renamed AS (
    SELECT
        CAST(CURRENCYRATEID AS INT) AS pk_currency_rate  -- ID único da taxa de câmbio (PK)
      , CAST(CURRENCYRATEDATE AS TIMESTAMP) AS currency_rate_date  -- Data da taxa de câmbio
      , CAST(FROMCURRENCYCODE AS STRING) AS from_currency_code  -- Código da moeda de origem
      , CAST(TOCURRENCYCODE AS STRING) AS to_currency_code  -- Código da moeda de destino
      , CAST(AVERAGERATE AS FLOAT) AS average_rate  -- Taxa média de câmbio
      , CAST(ENDOFDAYRATE AS FLOAT) AS end_of_day_rate  -- Taxa de câmbio final do dia
      , CAST(MODIFIEDDATE AS TIMESTAMP) AS modified_date  -- Data da última modificação
    FROM currency_rate_raw
)

SELECT * FROM renamed
