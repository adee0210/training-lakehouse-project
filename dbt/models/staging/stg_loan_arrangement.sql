select
    cast(arrangement_id as bigint) as arrangement_id,
    cast(customer_id as bigint) as customer_id,
    upper(trim(product_code)) as product_code,
    upper(trim(currency_code)) as currency_code,
    cast(principal_amount as decimal(18, 2)) as principal_amount,
    cast(start_date as date) as start_date,
    cast(maturity_date as date) as maturity_date,
    upper(trim(status)) as status,
    updated_at
from {{ source('bronze', 'loan_arrangement') }}
where arrangement_id is not null
