create table public.customer_dataset
(
	customer_id character varying,
	customer_unique_id character varying,
	customer_zip_code_prefix integer,
	customer_city character varying,
	customer_state character varying
);
 
create table public.geolocation_dataset
(
	geolocation_zip_code_prefix integer,
	geolocation_lat numeric,
	geolocation_lng numeric,
	geolocation_city character varying,
	geolocation_state character varying
);
 
create table public.order_items_dataset
(
	order_id character varying,
	order_item_id integer,
	product_id character varying,
	shipping_limit_date time without time zone,
	price numeric,
	freight_value numeric
);

create table public.order_payments_dataset
(
	order_id character varying,
	payment_sequential integer,
	payment_type character varying,
	payment_installments integer,
	payment_value numeric
);

create table public.order_reviews_dataset
(
	review_id character varying,
	order_id character varying,
	review_score integer,
	review_comment_title character varying,
	review_comment_message character varying,
	review_creation_date date,
	review_answer_timestamp time without time zone,
);

create table public.orders_dataset
(
	order_id character varying,
	customer_id character varying,
	order_status character varying,
	order_purchase_timestamp time without time zone,
	order_approved_at time without time zone,
	order_delivered_carrier_date date,
	order_delivered_customer_date time without time zone,
	order_estimated_delivery_date time without time zone
);

create table public.product_dataset
(
	idp integer,
	product_id character varying,
	product_category_name character varying,
	product_name_lenght numeric,
	product_description_lenght numeric,
	product_photos_qty numeric,
	product_weight_g numeric,
	product_length_cm numeric,
	product_height_cm numeric,
	product_width_cm numeric
);

create table public.sellers_dataset
(
	seller_id character varying,
	seller_zip_code_prefix integer,
	seller_city character varying,
	sp character varying
);

alter table product_dataset
add primary key (product_id);

alter table order_items_dataset
add foreign key (product_id) references product_dataset;

alter table sellers_dataset
add primary key (seller_id);

alter table order_items_dataset
add foreign key (seller_id) references sellers_dataset;

alter table orders_dataset
add primary key (order_id);

alter table order_items_dataset
add foreign key (order_id) references orders_dataset;

alter table payments_dataset
add foreign key (order_id) references orders_dataset;

alter table customers_dataset
add primary key (customer_id);

alter table orders_dataset
add foreign key (customer_id) references customers_dataset;

alter table geolocation_dataset
add primary key (geolocation_zip_code_prefix);

alter table sellers_dataset
add foreign key (geolocation_zip_code_prefix) references geolocation_dataset;

alter table customerss_dataset
add foreign key (geolocation_zip_code_prefix) references geolocation_dataset;



