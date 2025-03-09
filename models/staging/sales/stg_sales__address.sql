WITH adress_raw AS (
    SELECT *
    FROM {{ source('sales', 'address') }}
), 
    renamed AS (
    SELECT
         cast(ADDRESSID as INT) as pk_adress,
         --cast(ADDRESSLINE1 as String)
         --cast(ADDRESSLINE2 as String)
         cast(CITY as STRING) as city,
         cast(STATEPROVINCEID as STRING) as fk_state_province
         --cast(POSTALCODE as INT )
         --cast(SPATIALLOCATION as String)
         --cast(ROWGUID as INT ) 
         --cast(MODIFIEDDATE as INT)
    FROM adress_raw
)

SELECT * FROM renamed



















name
ADDRESSID
ADDRESSLINE1
ADDRESSLINE2
CITY
STATEPROVINCEID
POSTALCODE
SPATIALLOCATION
ROWGUID
MODIFIEDDATE