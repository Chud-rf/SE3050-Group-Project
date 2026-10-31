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