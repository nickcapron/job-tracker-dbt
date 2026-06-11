{% snapshot applications_snapshot %}

{{
    config(
        target_schema='snapshots',
        unique_key='id',
        strategy='check',
        check_cols=['status_code', 'notes'],
    )
}}

select
    id,
    job_id,
    status_code,
    notes,
    updated_at
from {{ source('raw', 'applications') }}

{% endsnapshot %}