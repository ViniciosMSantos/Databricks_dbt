{{ config( materialized = 'table') }}

select
    p.customerID as id_pedido,
    to_timestamp(p.dateTime) as data_pedido,
    p.product as produto,
    p.quantity as quantidade,
    p.unitPrice as preco_unitario,
    p.totalPrice as preco_total,
    p.paymentMethod as metodo_pagamento,
    concat(c.first_name, ' ', c.last_name) as nome_completo,
    c.email_address as email,
    c.city as cidade,
    c.state as estado,
    c.country as pais,
    c.gender as genero

from {{ ref('tb_pedidos') }} p
    left join {{ ref('tb_clientes') }} c
        on p.customerID = c.customerID
