{{ config(materialized='table', schema='gold') }}

select
    orders.order_id,
    orders.customer_id,
    orders.order_status,
    orders.order_purchase_timestamp,

    order_items.order_item_id,
    order_items.product_id,
    order_items.price,
    order_items.freight_value

from {{ source('olist_src', 'tb_orders_bronze') }} as orders
left join {{ source('olist_src', 'tb_order_items_bronze') }} as order_items
    on orders.order_id = order_items.order_id


