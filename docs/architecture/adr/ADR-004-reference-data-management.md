# ADR-004: Reference Data and Master Data Management

## Status

Accepted

---

## Context

Aurora FC Enterprise Data Warehouse contains multiple business domains including football, business, analytics, and administration.

Several attributes are shared across these domains and represent standardized business values rather than operational data.

Examples include:

- Countries
- Playing Positions
- Preferred Foot
- Competition Types
- Injury Types
- Match Status
- Currencies
- Languages

Storing these values independently in multiple tables leads to inconsistent data, duplicate records, and reporting issues.

---

## Problem

Using free-text values creates inconsistent data.

Example:

England
ENG
English
United Kingdom
Great Britain

Although these values may refer to the same country, they are treated as different values by the database.

This affects:

- Reporting
- Filtering
- Aggregation
- Data Quality
- Integration with external systems

---

## Decision

Aurora FC will maintain all shared reference data within a dedicated schema named:

reference

Reference tables will act as the single source of truth for standardized business values.

Business tables will reference these entities using foreign keys instead of storing free-text values.

---

## Initial Reference Tables

The following reference tables will be implemented during the first release.

- country
- position
- preferred_foot
- competition_type
- match_status
- injury_type

Additional reference tables may be introduced as the platform evolves.

---

## Example

Instead of:

football.player

nationality = 'Brazil'

the model becomes:

reference.country

country_id
country_name
iso_code
fifa_code
continent

↓

football.player

nationality_country_id

---

## Rationale

Using centralized reference data provides:

- Standardized business values
- Better data quality
- Simplified reporting
- Easier maintenance
- Consistent integrations
- Reduced duplication

It also supports future integrations with external football data providers.

---

## Alternatives Considered

### Option 1

Store values directly in business tables.

Pros

- Simple implementation

Cons

- Duplicate values
- Typographical errors
- Difficult reporting
- Poor scalability

Decision

Rejected

---

### Option 2

Maintain centralized reference tables.

Pros

- Single source of truth
- Improved consistency
- Easier reporting
- Enterprise best practice

Cons

- Additional joins in SQL queries

Decision

Accepted

---

## Consequences

Business entities should reference master data using foreign keys.

Reference data should be modified only through controlled administrative processes.

Operational systems should never duplicate reference values.

---

## Guiding Principle

> Business entities describe transactions and operations.

> Reference entities describe standardized business concepts.

---

## Related ADRs

ADR-001 – Data Platform Principles

ADR-002 – Temporal Data Modeling

ADR-003 – Progressive Data Modeling and Analytics Evolution
