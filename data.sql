-- Requirements: Populate tables with at least (10) markets, (20) farmers/vendors, and (50) unique products.

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


-- Populate vendors(farmers) data
INSERT INTO vendor
    (name, email, phone_number)
VALUES 
    ('Root & Radish', 'root@radish.com', '612-555-0202'),
    ('SunSoil Farms', 'sunsoil@gmail.com', '612-555-4114'),
    ('Berry Co', 'berryco@gmail.com', '612-555-5312'),
    ('Daily Sprout', 'sprout@daily.com', '612-555-0202'),
    ('Crust & Crumb', 'crustncrumb@gmail.com', '612-555-5352'),
    ('Oat & Honey', 'oatnhoney@gmail.com', '612-555-8888'),
    ('Wildflour Co', 'wildflourco@gmail.com', '612-555-7757'),
    ('The Daily Knead', 'dailyknead@gmail.com', '612-555-2232'),
    ('Rye & Rise', 'rye@rise.com', '612-555-1111'),
    ('Jarred Joy', 'jarredjoy@gmail.com', '612-555-9999'),
    ('The Sweet Bee', 'thesweetbee@gmail.com', '612-555-9595'),
    ('Pickle and Pip', 'pickleandpip@gmail.com', '612-555-8612'),
    ('Cloves Fares', 'clovesfares@gmail.com', '612-555-9095'),
    ('Zest Orchard', 'zestorchard@gmail.com', '612-555-1234'),
    ('Bean & Brew', 'beanandbrew@gmail.com', '612-555-6501'),
    ('Sips and Bites', 'sipsnbites@gmail.com', '612-555-9900'),
    ('Cocoa Pod', 'cocoapod@gmail.com', '612-555-5555'),
    ('Cold Pressed', 'coldpressed@gmail.com', '612-555-0000'),
    ('Melt Artisan', 'meltartisan@gmail.com', '612-555-9876'),
    ('Blooms Bakery', 'bloomsbakery@gmail.com', '612-555-5432');

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


-- Populate market_vendor
INSERT INTO market_vendor
    (market_id, vendor_id, booth_number)
VALUES 
    -- 67
    (67, 1, 101),
    (67, 2, 102),
    (67, 4, 104),
    (67, 5, 105),
    (67, 6, 106),
    (67, 7, 107),
    (67, 11, 111),
    (67, 13, 113),
    (67, 15, 115),
    (67, 17, 117),
    
     -- 68
    (68, 1, 101),
    (68, 2, 102),
    (68, 4, 104),
    (68, 5, 105),
    (68, 6, 106),
    (68, 8, 107),
    (68, 11, 111),
    (68, 13, 113),
    (68, 15, 115),
    (68, 16, 117),

     -- 69
    (69, 1, 101),
    (69, 2, 102),
    (69, 4, 104),
    (69, 5, 105),
    (69, 6, 106),
    (69, 7, 107),
    (69, 11, 111),
    (69, 13, 113),
    (69, 15, 115),
    (69, 16, 117),

     -- 70
    (70, 1, 101),
    (70, 2, 102),
    (70, 4, 104),
    (70, 5, 105),
    (70, 6, 106),
    (70, 8, 107),
    (70, 11, 111),
    (70, 13, 113),
    (70, 14, 115),
    (70, 19, 117),

     -- 71
    (71, 1, 101),
    (71, 2, 102),
    (71, 4, 104),
    (71, 5, 105),
    (71, 6, 106),
    (71, 9, 107),
    (71, 11, 111),
    (71, 13, 113),
    (71, 16, 115),
    (71, 18, 117),

     -- 72
    (72, 1, 101),
    (72, 2, 102),
    (72, 4, 104),
    (72, 5, 105),
    (72, 6, 106),
    (72, 8, 107),
    (72, 11, 111),
    (72, 13, 113),
    (72, 15, 115),
    (72, 18, 117),

     -- 73
    (73, 1, 101),
    (73, 2, 102),
    (73, 4, 104),
    (73, 5, 105),
    (73, 6, 106),
    (73, 7, 107),
    (73, 11, 111),
    (73, 13, 113),
    (73, 15, 115),
    (73, 20, 117),

     -- 74
    (74, 1, 101),
    (74, 2, 102),
    (74, 4, 104),
    (74, 5, 105),
    (74, 6, 106),
    (74, 8, 107),
    (74, 11, 111),
    (74, 13, 113),
    (74, 16, 115),
    (74, 19, 117),

     -- 75
    (75, 1, 101),
    (75, 20, 102),
    (75, 4, 104),
    (75, 5, 105),
    (75, 6, 106),
    (75, 9, 107),
    (75, 11, 111),
    (75, 13, 113),
    (75, 15, 115),
    (75, 19, 117),

     -- 76
    (76, 1, 101),
    (76, 20, 102),
    (76, 4, 104),
    (76, 5, 105),
    (76, 6, 106),
    (76, 7, 107),
    (76, 11, 111),
    (76, 13, 113),
    (76, 15, 115),
    (76, 17, 117),

     -- 77
    (77, 1, 101),
    (77, 20, 102),
    (77, 4, 104),
    (77, 5, 105),
    (77, 16, 106),
    (77, 7, 107),
    (77, 11, 111),
    (77, 13, 113),
    (77, 15, 115),
    (77, 19, 117),

     -- 78
    (78, 1, 101),
    (78, 2, 102),
    (78, 4, 104),
    (78, 5, 105),
    (78, 6, 106),
    (78, 8, 107),
    (78, 11, 111),
    (78, 13, 113),
    (78, 15, 115),
    (78, 19, 117),

     -- 79
    (79, 1, 101),
    (79, 2, 102),
    (79, 4, 104),
    (79, 5, 105),
    (79, 6, 106),
    (79, 8, 107),
    (79, 11, 111),
    (79, 13, 113),
    (79, 15, 115),
    (79, 18, 117),

     -- 80
    (80, 1, 101),
    (80, 2, 102),
    (80, 4, 104),
    (80, 5, 105),
    (80, 6, 106),
    (80, 9, 107),
    (80, 11, 111),
    (80, 13, 113),
    (80, 15, 115),
    (80, 19, 117),

     -- 81
    (81, 1, 101),
    (81, 2, 102),
    (81, 4, 104),
    (81, 5, 105),
    (81, 6, 106),
    (81, 9, 107),
    (81, 11, 111),
    (81, 13, 113),
    (81, 15, 115),
    (81, 17, 117),

     -- 82
    (82, 1, 101),
    (82, 2, 102),
    (82, 4, 104),
    (82, 5, 105),
    (82, 6, 106),
    (82, 7, 107),
    (82, 11, 111),
    (82, 13, 113),
    (82, 15, 115),
    (82, 17, 117),
    
     -- 83
    (83, 1, 101),
    (83, 20, 102),
    (83, 4, 104),
    (83, 5, 105),
    (83, 6, 106),
    (83, 7, 107),
    (83, 11, 111),
    (83, 13, 113),
    (83, 15, 115),
    (83, 17, 117),

     -- 84
    (84, 1, 101),
    (84, 2, 102),
    (84, 4, 104),
    (84, 5, 105),
    (84, 6, 106),
    (84, 7, 107),
    (84, 11, 111),
    (84, 13, 113),
    (84, 15, 115),
    (84, 20, 117),

     -- 85
    (85, 1, 101),
    (85, 2, 102),
    (85, 4, 104),
    (85, 5, 105),
    (85, 6, 106),
    (85, 7, 107),
    (85, 11, 111),
    (85, 13, 113),
    (85, 15, 115),
    (85, 17, 117),

     -- 86
    (86, 11, 101),
    (86, 2, 102),
    (86, 14, 104),
    (86, 5, 105),
    (86, 6, 106),
    (86, 17, 107),

     -- 87
    (87, 1, 101),
    (87, 12, 102),
    (87, 4, 104),
    (87, 5, 105),
    (87, 16, 106),
    (87, 17, 107),
    (87, 11, 111),

     -- 88
    (88, 1, 101),
    (88, 2, 102),
    (88, 14, 104),
    (88, 5, 105),
    (88, 6, 106),
    (88, 7, 107),
    (88, 11, 111),
    (88, 13, 113)
    ;

-- Populate vendor_product
INSERT INTO vendor_product
    (vendor_id, product_id, price, stock_quantity)
VALUES
    -- 1-20, 1-50, 1.00-10.00, 0-50

    -- 1
    (1, 1, 1.00, 5),
    (1, 5, 1.00, 5),
    (1, 10, 1.00, 5),

    -- 2
    (2, 2, 1.00, 5),
    (2, 4, 2.00, 4),
    (2, 6, 2.00, 10),

    -- 3
    (3, 5, 2.00, 10),
    (3, 20, 4.00, 10),
    (3, 30, 5.00, 10),

    -- 4
    (4, 3, 1.50, 2),
    (4, 12, 2.50, 8),
    (4, 25, 3.00, 12),

    -- 5
    (5, 8, 1.00, 3),
    (5, 15, 2.25, 9),
    (5, 40, 4.50, 15),

    -- 6
    (6, 2, 1.25, 1),
    (6, 18, 3.50, 11),
    (6, 35, 6.00, 18),

    -- 7
    (7, 7, 1.75, 4),
    (7, 22, 4.00, 14),
    (7, 45, 7.50, 20),

    -- 8
    (8, 4, 2.00, 6),
    (8, 16, 3.75, 16),
    (8, 32, 5.50, 22),

    -- 9
    (9, 9, 1.50, 7),
    (9, 27, 4.25, 17),
    (9, 48, 8.00, 25),

    -- 10
    (10, 1, 1.00, 0),
    (10, 10, 2.50, 19),
    (10, 50, 9.00, 28),

    -- 11
    (11, 6, 1.80, 5),
    (11, 19, 3.20, 21),
    (11, 38, 6.50, 30),

    -- 12
    (12, 11, 2.10, 8),
    (12, 24, 4.75, 24),
    (12, 42, 7.25, 32),

    -- 13
    (13, 3, 1.40, 9),
    (13, 14, 3.10, 26),
    (13, 29, 5.80, 34),

    -- 14
    (14, 13, 2.60, 11),
    (14, 28, 5.00, 27),
    (14, 44, 8.50, 36),

    -- 15
    (15, 5, 1.90, 13),
    (15, 21, 4.40, 29),
    (15, 36, 6.90, 38),

    -- 16
    (16, 8, 2.30, 15),
    (16, 26, 5.25, 31),
    (16, 47, 9.25, 40),

    -- 17
    (17, 12, 2.80, 18),
    (17, 31, 6.10, 33),
    (17, 49, 9.50, 42),

    -- 18
    (18, 15, 3.40, 20),
    (18, 33, 6.75, 35),
    (18, 46, 8.90, 45),

    -- 19
    (19, 17, 3.90, 23),
    (19, 37, 7.40, 37),
    (19, 50, 9.75, 48),

    -- 20
    (20, 20, 4.50, 25),
    (20, 39, 8.25, 44),
    (20, 50, 10.00, 50);
