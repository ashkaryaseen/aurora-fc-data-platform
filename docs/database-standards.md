# Aurora FC Enterprise Data Warehouse

# Database Standards

Version: 1.0

---

## Purpose

This document defines the database engineering standards used throughout the Aurora FC Enterprise Data Warehouse.

All future database objects must follow these standards.

---

# 1. Database

Database Name

aurora_fc_dw

---

# 2. Schema Organization

| Schema    | Purpose                           |
| --------- | --------------------------------- |
| football  | Football operations               |
| business  | Commercial operations             |
| analytics | Reporting and analytical datasets |
| admin     | Operational metadata              |
| reference | Shared reference data             |

---

# 3. Naming Convention

## Tables

Use singular nouns.

✅ player

✅ match

✅ training_session

❌ players

❌ Matches

---

## Columns

Use snake_case.

Examples

player_id

first_name

date_of_birth

preferred_foot_id

---

## Primary Keys

Format

<entity>\_id

Examples

player_id

match_id

country_id

---

## Foreign Keys

Foreign keys must use the same name as the referenced primary key.

Example

country_id

NOT

country_fk

player_identifier

pid

---

# 4. Data Types

UUID

Used for all business entity primary keys.

VARCHAR

Used only when variable-length text is required.

DATE

Used for dates without time.

TIMESTAMP

Used for audit timestamps.

BOOLEAN

Used for true/false values.

NUMERIC

Used for financial values.

---

# 5. Constraints

Every table should define:

Primary Key

NOT NULL where applicable

CHECK constraints where appropriate

Foreign Keys

Unique Constraints when required

---

# 6. Audit Columns

Every business table should contain:

created_at

updated_at

Future versions may include:

created_by

updated_by

---

# 7. Reference Data

Reference values must never be duplicated.

Use the reference schema.

Examples

country

position

preferred_foot

competition_type

match_status

---

# 8. Business Data

Business tables should contain only operational data.

Example

player

match

medical_record

training_session

---

# 9. Analytics Data

Analytics tables contain derived data.

Examples

player_performance_summary

team_statistics

revenue_summary

These tables should never be treated as source systems.

---

# 10. Administrative Data

The admin schema stores operational metadata.

Examples

pipeline_run

audit_log

file_ingestion_log

data_quality_log

---

# 11. SQL Standards

Keywords should be uppercase.

Examples

SELECT

FROM

WHERE

JOIN

Table names should be lowercase.

Use aliases only when they improve readability.

Avoid SELECT \* in production queries.

Always specify column names.

---

# 12. Database Principles

The database should model the business, not the application.

Avoid duplicate data.

Preserve historical information.

Normalize where appropriate.

Denormalize only when justified for analytics.

Use foreign keys to enforce data integrity.

---

# 13. Future Standards

The following standards will be introduced as Aurora FC evolves.

- Indexing Strategy
- Partitioning
- Views
- Materialized Views
- Stored Procedures
- Security Roles
- Row-Level Security
- Backup Strategy
- Data Retention Policy

---

## Engineering Philosophy

> Build a database that reflects how Aurora FC operates.

Technology should adapt to the business—not the other way around.
