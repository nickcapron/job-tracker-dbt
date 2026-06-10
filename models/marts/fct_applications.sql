select
    a.application_id,
    a.job_id,
    j.company_name,
    j.job_title,
    j.location,
    j.is_remote,
    j.salary_min,
    j.salary_max,
    j.is_salary_disclosed,
    a.applied_date,
    a.days_since_applied,
    a.status_code,
    s.status_label,
    a.notes
from {{ ref('stg_applications') }}        a
join {{ ref('stg_jobs') }}                j  on a.job_id = j.job_id
left join {{ ref('dim_application_statuses') }}  s  on a.status_code = s.status_code