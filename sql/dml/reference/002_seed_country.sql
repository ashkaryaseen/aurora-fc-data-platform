-- ============================================================================
-- Aurora FC Enterprise Data Warehouse (EDW)
-- Script Name : 002_seed_country.sql
-- Version     : 1.0
-- Purpose     : Seed reference.country
-- ============================================================================

INSERT INTO reference.country
(
    iso_code,
    fifa_code,
    country_name,
    confederation_id
)
SELECT
    v.iso_code,
    v.fifa_code,
    v.country_name,
    c.confederation_id
FROM (
    VALUES
        ('AR','ARG','Argentina','CONMEBOL'),
        ('AU','AUS','Australia','AFC'),
        ('BE','BEL','Belgium','UEFA'),
        ('BR','BRA','Brazil','CONMEBOL'),
        ('CA','CAN','Canada','CONCACAF'),
        ('DE','GER','Germany','UEFA'),
        ('ES','ESP','Spain','UEFA'),
        ('FR','FRA','France','UEFA'),
        ('GB','ENG','England','UEFA'),
        ('IN','IND','India','AFC'),
        ('JP','JPN','Japan','AFC'),
        ('KR','KOR','South Korea','AFC'),
        ('MA','MAR','Morocco','CAF'),
        ('MX','MEX','Mexico','CONCACAF'),
        ('NL','NED','Netherlands','UEFA'),
        ('NG','NGA','Nigeria','CAF'),
        ('NO','NOR','Norway','UEFA'),
        ('PT','POR','Portugal','UEFA'),
        ('SA','KSA','Saudi Arabia','AFC'),
        ('US','USA','United States','CONCACAF')
) AS v(iso_code, fifa_code, country_name, confederation_code)
JOIN reference.confederation c
    ON c.confederation_code = v.confederation_code;