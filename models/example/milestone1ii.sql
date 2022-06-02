{{ config(materialized='table') }}

SELECT nav_date, NEW_TABLE.code AS code, NEW_TABLE.max FROM "ANALYTICS"."DBT"."NAV_HISTORY" NAV_HISTORY JOIN
(SELECT MUTUAL_FUND.code AS code, max(NAV_2.nav) AS max FROM "ANALYTICS"."DBT"."MUTUAL_FUND" MUTUAL_FUND JOIN
"ANALYTICS"."DBT"."NAV_HISTORY" NAV_2 ON MUTUAL_FUND.code=NAV_2.code GROUP BY MUTUAL_FUND.code) NEW_TABLE
WHERE NAV_HISTORY.nav=NEW_TABLE.max AND NAV_HISTORY.code=NEW_TABLE.code