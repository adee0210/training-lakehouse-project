select
    a.arrangement_id,
    a.customer_id,
    c.customer_name,
    c.customer_type,
    a.product_code,
    a.currency_code,
    a.principal_amount,
    a.start_date,
    a.maturity_date,
    a.status,
    a.updated_at
from {{ ref('stg_loan_arrangement') }} a
left join {{ ref('stg_customer') }} c
    on a.customer_id = c.customer_id
