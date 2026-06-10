select *
from {{ ref('application_statuses') }}
where is_active = true