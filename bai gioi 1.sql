-- Tạo schema
create schema sales;

-- Tạo bảng customers
create table sales.customers (
	customer_id serial primary key,
	fisrt_name varchar(50) not null,
	last_name varchar(50) not null,
	email varchar(100) not null unique,
	phone varchar(20) 
);

-- Tạo bảng products
create table sales.products (
	product_id serial primary key,
	product_name varchar(100) not null,
	price decimal(10,2) not null,
	stock_quantity integer not null
);

-- Tạo bảng orders
create table sales.orders(
	order_id serial primary key,
	customer_id integer ,
	order_date date not null,
	foreign key (customer_id) references sales.customers(customer_id)
);

-- Tạo bảng OrderItems
create table sales.order_items (
    order_item_id serial primary key,
    order_id integer,
    product_id integer,
    quantity integer not null check (quantity >= 1),
    foreign key (order_id) references sales.orders(order_id),
    foreign key (product_id) references sales.products(product_id)
);

-- Kiểm tra các bảng đã tạo
select table_name
from information_schema.tables
where table_schema = 'sales';
