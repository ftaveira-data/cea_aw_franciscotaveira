with base as (
    select *
    from {{ ref('int_person__employee') }}
)

select
    pk_salesperson as salesperson_id,
    salesperson_identifier,
    sales_quota,
    bonus,
    commission_pct,
    sales_ytd,
    sales_last_year,
    state_province_name,
    state_province_code
from base
