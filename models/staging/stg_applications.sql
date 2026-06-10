select
    id              as application_id,
    job_id,
    status_code,
    applied_date,
    current_date - applied_date     as days_since_applied,
    notes,
    created_at,
    updated_at
from {{ source('raw', 'applications') }}