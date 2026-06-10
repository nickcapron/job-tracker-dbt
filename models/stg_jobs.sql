select
    id              as job_id,
    external_id,
    source,
    company_name,
    job_title,
    location,
    is_remote,
    salary_min,
    salary_max,
    case when salary_min is not null then true else false end as is_salary_disclosed,
    posted_date::date,
    url,
    created_at
from {{ source('raw', 'jobs') }}