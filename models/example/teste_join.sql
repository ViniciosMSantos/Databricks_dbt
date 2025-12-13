{{ config(materialized='table', schema='gold') }}

select
    *
from {{ source('bakehouse', 'tb_orders_bronze') }} as orders
left join {{ source('bakehouse', 'tb_order_items_bronze') }} as order_items
    on orders.order_id = order_items.order_id
