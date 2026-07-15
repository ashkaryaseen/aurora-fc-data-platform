-- ============================================================================
-- Aurora FC Enterprise Data Warehouse (EDW)
-- Script Name : 001_create_database.sql
-- Version     : 1.0
-- Author      : Ashkar Yaseen
--
-- Purpose:
-- Creates the Enterprise Data Warehouse (EDW) database for Aurora FC.
--
-- Description:
-- The EDW serves as the centralized repository for all football operations,
-- business operations, analytics, AI outputs, and administrative metadata.
--
-- Execution Notes:
-- - Execute while connected to the default 'postgres' database.
-- - Run only once during initial environment setup.
-- ============================================================================

CREATE DATABASE aurora_fc_dw
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    LOCALE_PROVIDER = 'libc'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = FALSE;

-- ============================================================================
-- End of Script
-- ============================================================================