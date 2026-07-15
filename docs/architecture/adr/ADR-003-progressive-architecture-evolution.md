# ADR-003: Progressive Data Modeling and Analytics Evolution

## Status

Accepted

---

## Context

Aurora FC aims to build a modern football data platform capable of supporting coaches, analysts, medical staff, executives, and future AI-powered applications.

Professional football analytics providers such as StatsBomb and Opta collect millions of low-level match events. These events are later transformed into meaningful statistics and insights.

However, implementing a fully event-driven architecture during the initial stages of the project would introduce unnecessary complexity and slow down development.

The platform requires an approach that balances learning, maintainability, and future scalability.

---

## Problem

There are multiple approaches to storing football performance data.

### Option 1

Store all player statistics directly within a MatchParticipation table.

Advantages

- Simple implementation
- Easy SQL queries

Disadvantages

- Large number of columns
- Difficult to extend
- Mixes participation information with performance metrics

---

### Option 2

Store every football event.

Examples include:

- Pass
- Shot
- Goal
- Tackle
- Interception
- Clearance
- Save

Player statistics are calculated from these events.

Advantages

- Highly flexible
- Industry-standard approach
- Rich analytical capabilities

Disadvantages

- High implementation complexity
- Requires significantly larger datasets
- More complex ETL pipelines
- Steeper learning curve

---

## Decision

Aurora FC will adopt a progressive architecture.

### Phase 1

Implement a relational data model using summary statistics.

Core entities include:

- Player
- Match
- MatchParticipation
- PlayerMatchStatistics

This provides a simple and maintainable foundation.

---

### Phase 2

Introduce detailed football event data.

Examples include:

- Pass Events
- Shot Events
- Defensive Events
- Goalkeeper Events

Business metrics will increasingly be derived from operational event data.

---

### Phase 3

Support advanced analytics and AI.

Examples include:

- Tactical analysis
- Player similarity models
- Injury prediction
- Match simulations
- AI-generated match reports
- Natural language querying

---

## Rationale

This phased approach allows Aurora FC to:

- Deliver value early
- Build incrementally
- Avoid over-engineering
- Keep the project understandable
- Introduce advanced concepts at the appropriate stage
- Preserve a clear migration path toward event-driven analytics

---

## Consequences

The initial database model intentionally prioritizes simplicity.

Future architectural enhancements should extend the platform rather than replace existing components.

Each phase builds upon the previous one while maintaining compatibility.

---

## Guiding Principle

> Build today's solution while preparing for tomorrow's requirements.

Architecture should evolve as business needs and technical maturity grow.

---

## Related ADRs

- ADR-001 – Data Platform Principles
- ADR-002 – Temporal Data Modeling
