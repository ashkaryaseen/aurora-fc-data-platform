-- ============================================================================
-- Aurora FC Enterprise Data Warehouse (EDW)
-- Script Name : 002_create_schemas.sql
-- Version     : 1.0
-- Author      : Ashkar Yaseen
--
-- Purpose:
-- Creates the logical schemas used within the Aurora FC Enterprise Data Warehouse.
--
-- Description:
-- Each schema represents a distinct business capability and provides logical
-- separation of database objects.
--
-- Schema Overview:
--
-- football   - Core football operations
-- business   - Commercial and business operations
-- analytics  - Business-ready reporting datasets
-- admin      - Pipeline metadata, audit logs and monitoring
-- reference  - Master/reference data shared across the platform
--
-- Execution Notes:
-- - Connect to the aurora_fc_dw database before running.
-- - Safe to execute multiple times due to IF NOT EXISTS.
-- ============================================================================

CREATE SCHEMA IF NOT EXISTS football;

COMMENT ON SCHEMA football IS
'Contains operational football data including players, teams, matches, training sessions, medical records and scouting information.';

-- ----------------------------------------------------------------------------

CREATE SCHEMA IF NOT EXISTS business;

COMMENT ON SCHEMA business IS
'Contains commercial and business-related data including fans, ticketing, merchandise and sponsorship information.';

-- ----------------------------------------------------------------------------

CREATE SCHEMA IF NOT EXISTS analytics;

COMMENT ON SCHEMA analytics IS
'Contains curated analytical datasets, summary tables and reporting models.';

-- ----------------------------------------------------------------------------

CREATE SCHEMA IF NOT EXISTS admin;

COMMENT ON SCHEMA admin IS
'Contains operational metadata including pipeline execution logs, audit logs and data quality monitoring.';

-- ----------------------------------------------------------------------------

CREATE SCHEMA IF NOT EXISTS reference;

COMMENT ON SCHEMA reference IS
'Contains standardized master/reference data shared across multiple business domains.';

-- ============================================================================
-- End of Script
-- ============================================================================