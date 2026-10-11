-- CREATE DATABASE group_project;

-- USE group_project;

-- DROP TABLE product;
-- DROP TABLE vendor_product;
-- DROP TABLE vendor;
-- DROP TABLE customer;
-- DROP TABLE market_day;
-- DROP TABLE market;


-- CREATE TABLE market (
--     market_id INT NOT NULL,
--     name VARCHAR(30) NOT NULL,
--     location VARCHAR (100),
--     start_date DATE,
--     end_date DATE,
--     start_time TIME,
--     end_time TIME,
--     PRIMARY KEY (market_id)
-- );

-- CREATE TABLE customer (
--     customer_id INT NOT NULL,
--     first_name VARCHAR(30),
--     last_name VARCHAR(30),
--     email VARCHAR(70),
--     phone_number VARCHAR(15),
--     PRIMARY KEY (customer_id)
-- );

-- CREATE TABLE market_day (
--     market_id INT NOT NULL,
--     day_of_week VARCHAR(9) CHECK (day_of_week IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday')) NOT NULL,
--     PRIMARY KEY (market_id, day_of_week),
--     FOREIGN KEY (market_id) REFERENCES market(market_id)
-- );

-- CREATE TABLE vendor (
--     vendor_id INT NOT NULL,
--     market_id INT,
--     name VARCHAR(30),
--     email VARCHAR(70),
--     phone_number VARCHAR(15),
--     PRIMARY KEY (vendor_id),
--     FOREIGN KEY (market_id) REFERENCES market(market_id)
-- );

-- CREATE TABLE product (
--     product_id INT NOT NULL,
--     name VARCHAR(30),
--     description VARCHAR(100),
--     PRIMARY KEY (product_id)
-- );

-- CREATE TABLE vendor_product (
--     vendor_id INT NOT NULL,
--     product_id INT NOT NULL,
--     price DECIMAL(10, 2),
--     stock_quantity INT,
--     PRIMARY KEY (vendor_id, product_id),
--     FOREIGN KEY (vendor_id) REFERENCES vendor(vendor_id),
--     FOREIGN KEY (product_id) REFERENCES product(product_id)
-- );

-- CREATE TABLE orders ( -- Renamed to 'orders' because 'order' is a reserved word in SQL
--     order_id INT NOT NULL,
--     customer_id INT,
--     order_date DATETIME,
--     total_amount DECIMAL(10, 2),
--     status VARCHAR(15),
--     PRIMARY KEY (order_id),
--     FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
-- );

-- CREATE TABLE order_item (
--     order_item_id INT NOT NULL,
--     order_id INT NOT NULL,
--     product_id INT,
--     vendor_id INT,
--     quantity INT,
--     unit_price DECIMAL(10,2),
--     PRIMARY KEY (order_item_id),
--     FOREIGN KEY (order_id) REFERENCES orders(order_id),
--     FOREIGN KEY (product_id) REFERENCES product(product_id),
--     FOREIGN KEY (vendor_id) REFERENCES vendor(vendor_id)
-- );

