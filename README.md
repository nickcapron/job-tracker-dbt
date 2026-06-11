\# Job Tracker — dbt + PostgreSQL



A full-stack job application tracking system with a modern data layer built on dbt and PostgreSQL.



\## Project Overview



This project models job search activity as a dimensional data warehouse, designed to power a web application for tracking job applications, matching postings against a user skill profile, and analyzing application pipeline performance.



\## Architecture



Raw job postings and application data land in a `raw` schema (populated by a Python ingestion pipeline and web app). dbt transforms this into a clean mart layer consumed by a FastAPI backend.

[ Job Board APIs ] → [ Python Ingestion ] → [ raw schema ]
↓
[ dbt transformation ]
↓
[ marts schema ]
↑
[ FastAPI backend ]
↑
[ Web UI ]

## Data Model

### Sources (raw schema)
- `raw.jobs` — job postings ingested from external job board APIs
- `raw.applications` — user applications written by the web app
- `raw.user_profile` — user skills, experience, and job preferences

### Staging layer
- `stg_jobs` — cleaned and typed job postings
- `stg_applications` — cleaned application records with days_since_applied
- `stg_user_profile` — cleaned user profile

### Marts layer
- `fct_applications` — one row per application, joined to job details and status
- `fct_job_matches` — job postings scored against user profile (coming soon)
- `dim_companies` — distinct companies from job postings
- `dim_application_statuses` — valid application status lookup

### Snapshots
- `applications_snapshot` — SCD Type 2 history of application status changes

## Stack
- dbt-core 1.9.0 + dbt-postgres
- PostgreSQL 18
- Python 3.12

## Setup

### Prerequisites
- PostgreSQL running locally on port 5432
- Python 3.12

### Installation
```bash
# Create virtual environment
py -3.12 -m venv .venv
.venv\Scripts\activate

# Install dependencies
pip install dbt-postgres==1.9.0

# Configure connection
# Copy profiles.yml to ~/.dbt/profiles.yml and update credentials
```

### Running the pipeline
```bash
dbt seed       # Load reference data
dbt snapshot   # Capture SCD Type 2 history
dbt run        # Build all models
dbt test       # Validate data quality
```

## Testing
16 automated data quality tests covering uniqueness, nullability, and accepted values across all staging and mart models.

## Lineage
Full lineage graph available via `dbt docs generate && dbt docs serve`.
