-- ============================================================================
-- Aurora FC Enterprise Data Warehouse (EDW)
-- Script Name : 001_confederation.sql
-- Version     : 1.0
-- Author      : Ashkar Yaseen
--
-- Purpose:
-- Creates the football confederation reference table.
--
-- Description:
-- Stores FIFA-recognized football confederations used throughout the
-- Aurora FC Enterprise Data Warehouse.
--
-- Dependencies:
-- reference schema
--
-- Change History:
-- v1.0 - Initial version
-- ============================================================================

CREATE TABLE IF NOT EXISTS reference.confederation
(
    confederation_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    confederation_code VARCHAR(10) NOT NULL UNIQUE,

    confederation_name VARCHAR(100) NOT NULL UNIQUE,

    headquarters VARCHAR(100),

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON TABLE reference.confederation IS
'Master list of FIFA football confederations.';