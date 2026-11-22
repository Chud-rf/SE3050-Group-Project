DROP DATABASE IF EXISTS group_project;
CREATE DATABASE IF NOT EXISTS group_project;

USE group_project;

CREATE TABLE market (
    market_id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(30) NOT NULL,
    location VARCHAR (100),
    start_date DATE,
    end_date DATE,
    start_time TIME,
    end_time TIME,
    PRIMARY KEY (market_id)
);

CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    email VARCHAR(70),
    phone_number VARCHAR(15),
    PRIMARY KEY (customer_id)
);

CREATE TABLE market_day (
    market_id INT NOT NULL,
    day_of_week VARCHAR(9) CHECK (day_of_week IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday')) NOT NULL,
    PRIMARY KEY (market_id, day_of_week),
    FOREIGN KEY (market_id) REFERENCES market(market_id)
);

CREATE TABLE vendor (
    vendor_id INT AUTO_INCREMENT NOT NULL,
    market_id INT,
    name VARCHAR(30),
    email VARCHAR(70),
    phone_number VARCHAR(15),
    PRIMARY KEY (vendor_id),
    FOREIGN KEY (market_id) REFERENCES market(market_id)
);

CREATE TABLE product (
    product_id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(30),
    description VARCHAR(100),
    PRIMARY KEY (product_id)
);

CREATE TABLE vendor_product (
    vendor_id INT NOT NULL,
    product_id INT NOT NULL,
    price DECIMAL(10, 2),
    stock_quantity INT,
    PRIMARY KEY (vendor_id, product_id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(vendor_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE orders ( -- Renamed to 'orders' because 'order' is a reserved word in SQL
    order_id INT NOT NULL AUTO_INCREMENT,
    customer_id INT,
    order_date DATETIME,
    total_amount DECIMAL(10, 2),
    status VARCHAR(15),
    PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE order_item (
    order_item_id INT NOT NULL AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT,
    vendor_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    PRIMARY KEY (order_item_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(vendor_id)
);

USE group_project;

-- Populate market data
INSERT INTO market
    (name, location, start_date, end_date, start_time, end_time)
VALUES 
    ('January Market', 'Minneapolis', '2026-01-01', '2026-02-01', '08:00:00', '14:00:00'),
    ('Valentine Market', 'Crookston', '2026-02-05', '2026-02-14', '09:00:00', '12:00:00'),
    ('March Madness', 'St Paul', '2026-03-01', '2026-03-20', '09:00:00', '14:00:00'),
    ('Springtime Sales', 'Minneapolis', '2026-04-05', '2026-05-05', '08:00:00', '16:00:00'),
    ('Summer Farmers', 'Edina', '2026-06-01', '2026-07-31', '08:00:00', '16:00:00'),
    ('Southern Farmers', 'Owatonna', '2026-07-01', '2026-07-31', '09:00:00', '14:00:00'),
    ('Best Deals Market', 'Crookston', '2026-07-01', '2026-08-31', '08:00:00', '12:00:00'),
    ('State Fair Popup', 'St Paul', '2026-08-20', '2026-08-26', '08:00:00', '14:00:00'),
    ('Fall Festivities', 'St Louis Park', '2026-10-01', '2026-11-02', '10:00:00', '14:00:00'),
    ('Pumpkin Spice & Nice', 'Shakopee', '2026-10-01', '2026-10-31', '08:00:00', '14:00:00'),
    ('Santa & Elfs', 'Anoka', '2026-12-01', '2027-01-15', '10:00:00', '14:00:00');

-- ADDED: populate operating days
INSERT INTO market_day (market_id, day_of_week)
VALUES
    (1, 'Saturday'),
    (2, 'Saturday'),
    (3, 'Sunday'),
    (4, 'Wednesday'),
    (4, 'Saturday'),
    (5, 'Saturday'),
    (6, 'Thursday'),
    (7, 'Saturday'),
    (8, 'Friday'),
    (8, 'Saturday'),
    (9, 'Sunday'),
    (10, 'Saturday'),
    (11, 'Saturday'),
    (11, 'Sunday');


-- Populate vendors(farmers) data
-- UPDATED added market_id 
INSERT INTO vendor
    (market_id, name, email, phone_number)
VALUES 
    (1, 'Root & Radish', 'root@radish.com', '612-555-0202'),
    (1, 'SunSoil Farms', 'sunsoil@gmail.com', '612-555-4114'),
    (2, 'Berry Co', 'berryco@gmail.com', '612-555-5312'),
    (2, 'Daily Sprout', 'sprout@daily.com', '612-555-0202'),
    (3, 'Crust & Crumb', 'crustncrumb@gmail.com', '612-555-5352'),
    (3, 'Oat & Honey', 'oatnhoney@gmail.com', '612-555-8888'),
    (4, 'Wildflour Co', 'wildflourco@gmail.com', '612-555-7757'),
    (4, 'The Daily Knead', 'dailyknead@gmail.com', '612-555-2232'),
    (5, 'Rye & Rise', 'rye@rise.com', '612-555-1111'),
    (5, 'Jarred Joy', 'jarredjoy@gmail.com', '612-555-9999'),
    (6, 'The Sweet Bee', 'thesweetbee@gmail.com', '612-555-9595'),
    (6, 'Pickle and Pip', 'pickleandpip@gmail.com', '612-555-8612'),
    (7, 'Cloves Fares', 'clovesfares@gmail.com', '612-555-9095'),
    (7, 'Zest Orchard', 'zestorchard@gmail.com', '612-555-1234'),
    (8, 'Bean & Brew', 'beanandbrew@gmail.com', '612-555-6501'),
    (8, 'Sips and Bites', 'sipsnbites@gmail.com', '612-555-9900'),
    (9, 'Cocoa Pod', 'cocoapod@gmail.com', '612-555-5555'),
    (9, 'Cold Pressed', 'coldpressed@gmail.com', '612-555-0000'),
    (10, 'Melt Artisan', 'meltartisan@gmail.com', '612-555-9876'),
    (11, 'Blooms Bakery', 'bloomsbakery@gmail.com', '612-555-5432');

-- Populate product data
INSERT INTO product
    (name, description)
VALUES
    -- Fruits
    ('Strawberries', 'Fresh strawberries'),
    ('Blueberries', 'Fresh blueberries'),
    ('Raspberries', 'Fresh raspberries'),
    ('Blackberries', 'Fresh blackberries'),
    ('Apples', 'Red apples'),
    ('Peaches', 'Fresh peaches'),
    ('Pears', 'Fresh pears'),
    ('Watermelon', 'Seedless watermelon'),
    ('Cantaloupe', 'Fresh cantaloupe'),
    ('Cherries', 'Red cherries'),

    -- Vegetables
    ('Carrots', 'Fresh carrots'),
    ('Potatoes', 'Russet potatoes'),
    ('Tomatoes', 'Fresh tomatoes'),
    ('Cucumbers', 'Fresh cucumbers'),
    ('Sweet Corn', 'Fresh sweet corn'),
    ('Green Beans', 'Fresh green beans'),
    ('Broccoli', 'Fresh broccoli'),
    ('Lettuce', 'Green leaf lettuce'),
    ('Bell Peppers', 'Fresh bell peppers'),
    ('Yellow Onions', 'Fresh yellow onions'),

    -- Bakery
    ('Sourdough Bread', 'Homemade sourdough bread'),
    ('White Bread', 'Fresh white bread'),
    ('Blueberry Muffins', 'Blueberry muffins'),
    ('Chocolate Cookies', 'Chocolate chip cookies'),
    ('Apple Pie', 'Homemade apple pie'),
    ('Cinnamon Rolls', 'Fresh cinnamon rolls'),
    ('Banana Bread', 'Homemade banana bread'),
    ('Croissants', 'Buttery croissants'),

    -- Honey and Preserves
    ('Raw Honey', 'Pure raw honey'),
    ('Maple Syrup', 'Pure maple syrup'),
    ('Strawberry Jam', 'Strawberry jam'),
    ('Blueberry Jam', 'Blueberry jam'),
    ('Apple Butter', 'Homemade apple butter'),
    ('Pickles', 'Dill pickles'),
    ('Raspberry Jam', 'Raspberry jam'),

    -- Dairy and Eggs
    ('Brown Eggs', 'Farm fresh eggs'),
    ('Whole Milk', 'Fresh whole milk'),
    ('Cheddar Cheese', 'Cheddar cheese'),
    ('Goat Cheese', 'Fresh goat cheese'),
    ('Butter', 'Fresh butter'),

    -- Drinks and Other Products
    ('Apple Cider', 'Fresh apple cider'),
    ('Cold Brew Coffee', 'Cold brew coffee'),
    ('Strawberry Lemonade', 'Fresh strawberry lemonade'),
    ('Hot Cocoa Mix', 'Chocolate cocoa mix'),
    ('Pumpkin Bread', 'Homemade pumpkin bread'),
    ('Pumpkin Pie', 'Homemade pumpkin pie'),
    ('Garlic', 'Fresh garlic'),
    ('Fresh Basil', 'Fresh basil'),
    ('Sunflower Bouquet', 'Sunflower bouquet'),
    ('Lavender Bundle', 'Dried lavender bundle');

-- ADDED: Populate vendor_product listings so products appear in search & pre-order queries
INSERT INTO vendor_product (vendor_id, product_id, price, stock_quantity)
VALUES
    (13, 13, 3.50, 25),  -- Cloves Fares -> Tomatoes
    (13, 11, 2.25, 40),  -- Cloves Fares -> Carrots
    (14, 13, 4.00, 15),  -- Zest Orchard -> Tomatoes
    (14, 5,  3.25, 50),  -- Zest Orchard -> Apples
    (14, 6,  4.50, 30),  -- Zest Orchard -> Peaches
    (1,  12, 2.75, 60),  -- Root & Radish -> Potatoes
    (2,  14, 2.00, 35),  -- SunSoil Farms -> Cucumbers
    (3,  1,  5.00, 20),  -- Berry Co -> Strawberries
    (5,  21, 7.50, 18),  -- Crust & Crumb -> Sourdough Bread
    (11, 29, 9.00, 22);  -- The Sweet Bee -> Raw Honey

-- ADDED: Populate customers 
INSERT INTO customer (first_name, last_name, email)
VALUES
    ('Kelly', 'I', 'kellyi@example.com'),
    ('Chad', 'F', 'chadf@example.com'),
    ('Cal', 'B', 'calb@example.com');
