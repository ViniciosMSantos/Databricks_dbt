{{ config(materialized='table') }}


select * from {{ source('bakehouse', 'sales_transactions') }}

