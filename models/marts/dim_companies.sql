select distinct
    company_name,
    location
from {{ ref('stg_jobs') }}