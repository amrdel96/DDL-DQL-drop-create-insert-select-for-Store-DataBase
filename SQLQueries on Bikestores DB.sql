use bikestores	
select *
from sales.customers
where email like '%gmail.com'

select *
from sales.customers
where email like '%hotmail.com'

select *
from sales.customers
where email like '%hotmail.com'

select *
from sales.customers
where first_name like '[AE]%'

select *
from sales.customers
where first_name like '[A-c]%'

select *
from sales.customers
where first_name not like 'A%'

select *
from production.products
where list_price like '3__.%'

select *
from sales.customers
where first_name like 'A__E%'

--25-- sorting results - order by clause

select first_name , last_name, email
from sales.customers
order by first_name asc;

select first_name , last_name, email
from sales.customers
order by first_name desc;

select product_id , product_name,list_price
from production.products
order by list_price;

select product_id , product_name,list_price
from production.products
order by list_price desc;

select  city ,first_name , last_name, email
from sales.customers
order by city, first_name ;


select  city ,first_name , last_name, email
from sales.customers
order by city asc, first_name desc;

select category_id, product_id , product_name,list_price
from production.products
order by category_id,  list_price desc; 


select category_id, product_id , product_name,list_price
from production.products
order by category_id,  list_price desc; 

select category_id, product_id , product_name,list_price
from production.products
order by category_id,  list_price asc ;

-------------------------------------------------------
---26  | Join Tables | - |Inner Join & Natural Join | Natural Join not existed in SQL server but available in orical

select * from sales.customers

select * from sales.orders


select first_name, last_name,email, order_id , order_date, store_id
from sales.customers c , sales.orders o
where c.customer_id = o.customer_id;

select first_name, last_name,email, order_id , order_date, store_id
from sales.customers c inner join sales.orders o
on c.customer_id = o.customer_id;



select first_name, last_name,email, order_id , order_date, order_status
from sales.orders o inner join sales.staffs s
on o.staff_id = s.staff_id;
 

 -------------------------------------------------------
 --- 27  | Join Tables | - |Outer Join |


 select  c.customer_id, first_name, last_name,email, order_id , order_date, store_id
from sales.customers c  left outer join sales.orders o
on c.customer_id = o.customer_id
order by customer_id desc;

 select  c.customer_id, first_name, last_name,email, order_id , order_date, store_id
from sales.customers c  right outer join sales.orders o
on c.customer_id = o.customer_id
order by order_id desc;


 select  c.customer_id, first_name, last_name,email, order_id , order_date, store_id
from sales.customers c  full outer join sales.orders o
on c.customer_id = o.customer_id
order by customer_id desc;

 select  c.customer_id, first_name, last_name,email, order_id , order_date, store_id
from sales.customers c  full outer join sales.orders o
on c.customer_id = o.customer_id
order by order_id desc;


 -------------------------------------------------------
 -- 28 | Join More Than 2 Tables |

 select  c.first_name,c.last_name ,c.email, o.order_id , order_date, store_name , s.street, s.city 
from sales.customers c , sales.orders o , sales.stores s
where c.customer_id = o.customer_id and o.store_id = s.store_id


select  c.first_name,c.last_name ,c.email, o.order_id , order_date, store_name , s.street, s.city 
from sales.customers c inner join sales.orders o 
on c.customer_id = o.customer_id
inner join sales.stores s
on o.store_id = s.store_id;


select o.order_id, order_date, p.product_id , product_name, p.list_price
from sales.orders o , sales.order_items oi , production.products p
where o.order_id =oi.order_id 
and oi.product_id=p.product_id


select o.order_id, order_date, p.product_id , product_name, p.list_price
from sales.orders o inner join sales.order_items oi 
on o.order_id =oi.order_id 
inner join production.products p
on oi.product_id=p.product_id


select first_name +' ' +last_name as customer_name ,brand_name
from sales.customers c inner join sales.orders o 
on c.customer_id = o.customer_id
inner join sales.order_items oi
on o.order_id =oi.order_id
inner join production.products p
on oi.product_id=p.product_id
inner join production.brands b
on p.brand_id= b.brand_id

use bikestores
select first_name +' '+last_name as customer_name ,oi.item_id
from sales.customers c inner join sales.orders o 
on c.customer_id = o.customer_id
inner join sales.order_items oi
on o.order_id =oi.order_id

select first_name +' ' +last_name as customer_name ,brand_name , o.store_id
from sales.customers c , sales.orders o , sales.order_items oi , production.products p , production.brands b
where c.customer_id = o.customer_id
and o.order_id =oi.order_id
and oi.product_id=p.product_id
and p.brand_id= b.brand_id

---- 29 | Join with Group by and Order by |

select store_name, count(*) "no.of orders"
from sales.stores s inner join sales.orders o
on s.store_id=o.store_id
group by store_name

select store_name, count(*) as "no.of orders"
from sales.stores s inner join sales.orders o
on s.store_id=o.store_id
group by store_name
order by count(*) desc

select store_name, count(*) as "no.of orders"
from sales.stores s inner join sales.orders o
on s.store_id=o.store_id
group by store_name
having count(*) > 350
order by count(*) desc


select brand_name, count(*) as "no.of orders"
from production.brands b inner join production.products p
on b.brand_id=p.brand_id
inner join sales.order_items oi
on p.product_id = oi.product_id
group by brand_name
having count(*) > 1000
order by count(*) desc;




