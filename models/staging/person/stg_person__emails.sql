WITH email_address_raw AS ( 
    SELECT *
    FROM {{ source('person', 'EmailAddress') }}  
)

, renamed AS (
    SELECT
       CAST(BusinessEntityID AS INT) AS fk_person -- Chave estrangeira para Person
     , CAST(EmailAddressID AS INT) AS pk_email_address -- Identificador único do e-mail
     , CAST(EmailAddress AS STRING) AS email -- Endereço de e-mail da pessoa
     , CAST(RowGuid AS STRING) AS id_unique -- Identificador único global
     , CAST(ModifiedDate AS TIMESTAMP) AS modified_date -- Data da última modificação
    FROM email_address_raw
)

SELECT * FROM renamed
