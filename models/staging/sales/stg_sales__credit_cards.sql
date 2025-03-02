WITH credit_card_raw AS (
    SELECT *
    FROM {{ source('sales', 'CreditCard') }}
)

, renamed AS (
    SELECT
        CAST(CREDITCARDID AS INT) AS pk_creditcard  -- ID único do cartão de crédito (PK)
      , CAST(CARDTYPE AS STRING) AS card_type  -- Tipo do cartão (Visa, Master, etc.)
      , CAST(CARDNUMBER AS STRING) AS card_number  -- Número parcial do cartão
      , CAST(EXPMONTH AS INT) AS exp_month  -- Mês de expiração
      , CAST(EXPYEAR AS INT) AS exp_year  -- Ano de expiração
      , CAST(MODIFIEDDATE AS TIMESTAMP) AS modified_date  -- Data da última modificação
    FROM credit_card_raw
)

SELECT * FROM renamed