{{ config(materialized='table') }}

SELECT new_table.catid AS cat_id,new_table.Scheme AS scheme, nav.nav_date AS date, nav.nav AS nav from "ANALYTICS"."DBT"."NAV_HISTORY" nav JOIN
(SELECT mf.category_id AS catid,mf.code AS code, mf.name AS Scheme FROM "ANALYTICS"."DBT"."MUTUAL_FUND" mf
JOIN "ANALYTICS"."DBT"."FUND_CAT" fc ON fc.id = mf.category_id GROUP BY catid, code,mf.name) new_table
WHERE nav.code = new_table.code
