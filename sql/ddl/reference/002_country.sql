-- ============================================================================
-- Aurora FC Enterprise Data Warehouse (EDW)
-- Script Name : 002_country.sql
-- Purpose     : Creates the country reference table.
-- ============================================================================

CREATE TABLE IF NOT EXISTS reference.country
(
    country_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    iso_code CHAR(2) NOT NULL UNIQUE,

    fifa_code CHAR(3) NOT NULL UNIQUE,

    country_name VARCHAR(100) NOT NULL UNIQUE,

    confederation_id INTEGER NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_country_confederation
        FOREIGN KEY (confederation_id)
        REFERENCES reference.confederation(confederation_id)
);

COMMENT ON TABLE reference.country IS
'Master list of countries recognized by FIFA.';