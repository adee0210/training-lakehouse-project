select
    b.balance_date,
    b.arrangement_id,
    l.customer_id,
    l.customer_name,
    l.customer_type,
    l.product_code,
    l.currency_code,
    l.status,
    b.outstanding_principal,
    b.outstanding_interest,
    b.outstanding_principal + b.outstanding_interest as outstanding_total
from {{ ref('stg_arrangement_balance') }} b
left join {{ ref('int_customer_loan') }} l
    on b.arrangement_id = l.arrangement_id
