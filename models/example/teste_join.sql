{{ config(materialized='table', schema='gold') }}

select 
    *

from {{ ref('tb_orders_bronze') }} as orders
    
    left join {{ ref('tb_order_items_bronze') }} as order_items
        on orders.order_id = order_items.order_id
