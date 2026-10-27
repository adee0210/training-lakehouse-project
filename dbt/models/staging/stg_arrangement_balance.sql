select
    cast(arrangement_id as bigint) as arrangement_id,
    cast(balance_date as date) as balance_date,
    cast(outstanding_principal as decimal(18, 2)) as outstanding_principal,
    cast(outstanding_interest as decimal(18, 2)) as outstanding_interest,
    updated_at
from {{ source('bronze', 'arrangement_balance') }}
where arrangement_id is not null
