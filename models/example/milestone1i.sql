{{ config(materialized='table') }}

SELECT month(nav_date) AS nav_month,code,AVG(nav) AS nav_avg, AVG(repurchase_price)
AS repurchase_avg,AVG(sale_price) AS sale_avg FROM "ANALYTICS"."DBT"."NAV_HISTORY" GROUP BY code,nav,nav_month
