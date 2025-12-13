{{ config(materialized='table') }}

select
    *
from {{ source('olist_src', 'tb_orders_bronze') }} as orders
left join {{ source('olist_src', 'tb_order_items_bronze') }} as order_items
    on orders.order_id = order_items.order_id
    
