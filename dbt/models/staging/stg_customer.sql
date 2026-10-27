select
    cast(customer_id as bigint) as customer_id,
    trim(customer_name) as customer_name,
    upper(trim(customer_type)) as customer_type,
    created_at,
    updated_at
from {{ source('bronze', 'customer') }}
where customer_id is not null
