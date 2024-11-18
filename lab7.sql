--1
create index index_product_name on products(products_name);

--2
create index customers_first_and_last_name_index on customers(first_name, last_name);

--3
create unique index orders_total_index on orders(order_total);

--4
create index customers_email_index on customers(lower(customers_email));

--5
create index orders_id_index on orders(order_id);

create index order_item_index on order_items(order_id);

create index orders_order_total_index on orders(order_total);

create index order_items_quantity on order_items(quantity);






























create index customers_first_and_last_name_index on customers(first_name, last_name);