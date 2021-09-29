USE retail_db;

DROP  TABLE IF EXISTS
    olist_customers, 
    olist_geolocation, 
    olist_order_items, 
    olist_order_payments,
    olist_order_reviews,  
    olist_orders,
    olist_products, 
    olist_sellers,
    product_category_name_translation
    ;

CREATE TABLE IF NOT EXISTS  olist_customers (
 customer_id varchar(255) NOT NULL,
 customer_unique_id varchar(255) NOT NULL,
 customer_zip_code varchar(5),
 customer_city varchar(255),
 customer_state varchar(255)
);
-- --------------------------------------------------
CREATE TABLE IF NOT EXISTS  olist_geolocation (
 geolocation_zip_code_prefix  varchar(5),
 geolocation_lat decimal(3,2),
 geolocation_lng decimal(3,2),
 geolocation_city varchar(255),
 geolocation_state varchar(255)
);
-- --------------------------------------------------
CREATE TABLE IF NOT EXISTS olist_order_items(
 order_id     varchar(255) NOT NULL,
 order_item_id    varchar(255) NOT NULL,
 product_id     varchar(255) NOT NULL,
 seller_id     varchar(255) NOT NULL,
 shipping_limit_date  DATETIME,
 price      decimal(9,2),
 freight_value  decimal(9,2)
);
-- --------------------------------------------------
CREATE TABLE IF NOT EXISTS  olist_order_payments(
 order_id     varchar(255) NOT NULL,
 payment_sequential  char(1) NOT NULL,
 payment_type     varchar(100),
 payment_installments     tinyint,
 payment_value  decimal(9,2)
);
-- --------------------------------------------------
CREATE TABLE IF NOT EXISTS  olist_order_reviews(
 review_id     varchar(255) NOT NULL,
 order_id     varchar(255) NOT NULL,
 review_score     tinyint,
 payment_installments     varchar(255),
 review_comment_title  varchar(255),
 review_comment_message      varchar(255),
 review_creation_date    DATETIME,
 review_answer_timestamp DATETIME
);
-- --------------------------------------------------
CREATE TABLE IF NOT EXISTS  olist_orders(
 order_id  varchar(255) NOT NULL,
 customer_id   varchar(255) NOT NULL,
 order_status  varchar(25),
 order_purchase_timestamp  DATETIME,
 order_approved_at  DATETIME,
 order_delivered_carrier_date DATETIME,
 order_delivered_customer_date DATETIME,
 order_estimated_delivery_date DATETIME
);
-- --------------------------------------------------
CREATE TABLE IF NOT EXISTS  olist_products(
 product_id  varchar(255) NOT NULL,
 product_category_name   varchar(105),
 product_name_lenght  varchar(255),
 product_description_lenght  varchar(255),
 product_photos_qty  tinyint,
 product_weight_g decimal(7,2),
 product_length_cm decimal(4,2)
);
-- --------------------------------------------------
CREATE TABLE IF NOT EXISTS  olist_sellers(
 seller_id  varchar(255) NOT NULL,
 seller_zip_code_prefix   char(5),
 seller_city  varchar(255),
 seller_state  varchar(255)
);
-- --------------------------------------------------
CREATE TABLE IF NOT EXISTS  product_category_name_translation(
 product_category_name  varchar(255) NOT NULL,
 product_category_name_english varchar(255) NOT NULL
);


LOAD DATA LOCAL INFILE '/home/jordanetsafack6744/bigdata/datasets/diamond/olist_customers_dataset.csv' INTO TABLE olist_customers FIELDS TERMINATED BY "," LINES TERMINATED BY "\n";

LOAD DATA LOCAL INFILE '/home/jordanetsafack6744/bigdata/datasets/diamond/olist_geolocation_dataset.csv' INTO TABLE olist_geolocation FIELDS TERMINATED BY "," LINES TERMINATED BY "\n";

LOAD DATA LOCAL INFILE '/home/jordanetsafack6744/bigdata/datasets/diamond/olist_order_items_dataset.csv' INTO TABLE olist_order_items FIELDS TERMINATED BY "," LINES TERMINATED BY "\n";

LOAD DATA LOCAL INFILE '/home/jordanetsafack6744/bigdata/datasets/diamond/olist_order_payments_dataset.csv' INTO TABLE olist_order_payments FIELDS TERMINATED BY "," LINES TERMINATED BY "\n";

LOAD DATA LOCAL INFILE '/home/jordanetsafack6744/bigdata/datasets/diamond/olist_order_reviews_dataset.csv' INTO TABLE olist_order_reviews FIELDS TERMINATED BY "," LINES TERMINATED BY "\n";

LOAD DATA LOCAL INFILE '/home/jordanetsafack6744/bigdata/datasets/diamond/olist_orders_dataset.csv' INTO TABLE olist_orders FIELDS TERMINATED BY "," LINES TERMINATED BY "\n";

LOAD DATA LOCAL INFILE '/home/jordanetsafack6744/bigdata/datasets/diamond/olist_products_dataset.csv' INTO TABLE olist_products FIELDS TERMINATED BY "," LINES TERMINATED BY "\n";

LOAD DATA LOCAL INFILE '/home/jordanetsafack6744/bigdata/datasets/diamond/olist_sellers_dataset.csv' INTO TABLE olist_sellers FIELDS TERMINATED BY "," LINES TERMINATED BY "\n";

LOAD DATA LOCAL INFILE '/home/jordanetsafack6744/bigdata/datasets/diamond/product_category_name_translation.csv' INTO TABLE product_category_name_translation FIELDS TERMINATED BY "," LINES TERMINATED BY "\n";