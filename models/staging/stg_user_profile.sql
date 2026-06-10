select
    id                  as user_id,
    full_name,
    email,
    target_titles,
    target_locations,
    skills,
    years_experience,
    salary_min,
    salary_max,
    created_at,
    updated_at
from {{ source('raw', 'user_profile') }}