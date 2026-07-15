# ADR-002: Temporal Data Modeling for Historical Relationships

## Status

Accepted

---

## Context

Aurora FC manages entities whose relationships change over time.

Examples include:

- Players moving between teams
- Coaches managing different teams
- Players going on loan
- Promotions from the academy to the first team
- Future transfers to other clubs

The platform must preserve the complete history of these relationships instead of only storing the current state.

---

## Problem

A simple relationship such as:

Player → Team

allows only the player's current team to be stored.

When a player changes teams, the previous relationship is overwritten, resulting in the loss of historical information.

Example:

2026 → Academy

2027 → U21

2028 → First Team

Using a single `team_id` column means only the latest assignment is retained.

Historical career progression cannot be reconstructed.

---

## Decision

Aurora FC will use temporal data modeling for business relationships that change over time.

Instead of directly linking entities, the platform will introduce association (junction) tables that record the lifecycle of each relationship.

Example:

Player
│
▼
PlayerTeam
▲
│
Team

The `PlayerTeam` entity stores the relationship history between players and teams.

---

## Example Structure

| player_id | team_id    | start_date | end_date   | role   |
| --------- | ---------- | ---------- | ---------- | ------ |
| 10        | Academy    | 2026-07-01 | 2027-06-30 | Player |
| 10        | U21        | 2027-07-01 | 2028-06-30 | Player |
| 10        | First Team | 2028-07-01 | NULL       | Player |

A NULL `end_date` indicates the current team assignment.

---

## Rationale

This approach provides several benefits:

- Preserves complete historical data
- Supports player career progression analysis
- Enables historical reporting
- Supports loan spells and transfers
- Avoids overwriting business history
- Aligns with enterprise data modeling practices

---

## Alternatives Considered

### Option 1 — Store `team_id` in the Player table

Pros

- Simple design
- Easy queries

Cons

- Historical data is lost
- No support for transfers or promotions
- Limited analytical capability

Decision: Rejected

---

### Option 2 — Use a PlayerTeam association table

Pros

- Preserves historical relationships
- Flexible and scalable
- Supports future business requirements
- Enables time-based analytics

Cons

- Slightly more complex queries

Decision: Accepted

---

## Consequences

The data model will include association tables for relationships where historical tracking is important.

Examples include:

- PlayerTeam
- MatchParticipation
- TrainingAttendance
- PlayerTransfer
- CoachAssignment (future)

---

## Guiding Principle

> Never overwrite business history when historical information provides analytical value.

Instead, record the change and preserve the timeline.

---

## Related ADRs

ADR-001 – Data Platform Principles
