with prod as (
    select 
        ct.category_name
        , sp.company_name as supplier
        , pr.product_name
        , pr.unit_price
        , pr.product_id
    from 
        {{source('northwind_source', 'products')}} as pr
        left join {{source('northwind_source', 'suppliers')}} as sp on pr.supplier_id = sp.supplier_id
        left join {{source('northwind_source', 'categories')}} as ct on pr.category_id = ct.category_id
),
ordetails as (
    select 
        prod.*
        , ord.order_id
        , ord.quantity
        , ord.discount
    from
        {{ref('orderdetails')}} as ord
        left join prod on ord.product_id = prod.product_id
),
ord as (
    select 
        ord.order_date
        , ord.order_id
        , cust.company_name as customer
        , emp.name as employee
        , emp.age
        , emp.service_age
    from
        {{source('northwind_source', 'orders')}} as ord
        left join {{ref('customers')}} as cust on ord.customer_id = cust.customer_id
        left join {{ref('employees')}} as emp on ord.employee_id = emp.employee_id
        left join {{source('northwind_source', 'shippers')}} as ship on ord.ship_via = ship.shipper_id
),
final as (
    select
        ordetails.*
        , ord.order_date
        , ord.customer
        , ord.employee
        , ord.age
        , ord.service_age
    from 
        ordetails
        join ord on ordetails.order_id = ord.order_id
)
select 
    * 
from 
    final