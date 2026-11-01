
-- 1. This query displays market name, location, start time, end time, and days of the week that a market is open for all markets in the database.

SELECT m.market_id, m.name AS market_name, m.location, m.start_time, m.end_time, GROUP_CONCAT(md.day_of_week ORDER BY FIELD(md.day_of_week, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday')) AS operating_days
FROM MARKET m
LEFT JOIN MARKET_DAY md ON m.market_id = md.market_id
WHERE CURDATE() BETWEEN m.start_date AND m.end_date
GROUP BY m.market_id;


-- 2. This query allows users to view details for a specific market including vendors.

SELECT m.market_id, m.name AS market_name, m.location, m.start_date, m.end_date, m.start_time, m.end_time, v.vendor_id, v.name AS vendor_name
FROM MARKET m
LEFT JOIN VENDOR v ON m.market_id = v.market_id
WHERE m.name = 'Market Name';


-- 3. This query allows user to search products across all markets using name or description.

SELECT p.product_id, p.name AS product_name, p.description, vp.price, vp.stock_quantity, v.vendor_id, v.name AS vendor_name, m.market_id, m.name AS market_name
FROM PRODUCT p
JOIN VENDOR_PRODUCT vp ON p.product_id = vp.product_id
JOIN VENDOR v ON vp.vendor_id = v.vendor_id
JOIN MARKET m ON v.market_id = m.market_id
WHERE p.name LIKE '%SearchedName%' OR p.description LIKE '%searchedDescription%'
ORDER BY p.name;


-- 4. This query allows users to view all products offered by a specific vendor.

SELECT p.product_id, p.name AS product_name, p.description, vp.price, vp.stock_quantity, v.vendor_id, v.name AS vendor_name, m.market_id, m.name AS market_name
FROM PRODUCT p
JOIN VENDOR_PRODUCT vp ON p.product_id = vp.product_id
JOIN VENDOR v ON vp.vendor_id = v.vendor_id
JOIN MARKET m ON v.market_id = m.market_id
WHERE v.name LIKE '%Vendor Name%'
ORDER BY p.name;


-- 5. This query shows customer order history giving an itemized breakdown for each order.

SELECT o.order_id, o.order_date, o.status, o.total_amount, p.name AS product_name, v.name AS vendor_name, oi.quantity, oi.unit_price, (oi.quantity * oi.unit_price) AS line_total
FROM ORDERS o
JOIN CUSTOMER c ON o.customer_id = c.customer_id
JOIN ORDER_ITEM oi ON o.order_id = oi.order_id
JOIN PRODUCT p ON oi.product_id = p.product_id
JOIN VENDOR v ON oi.vendor_id = v.vendor_id
WHERE c.customer_id = exampleCustomerID
ORDER BY o.order_date DESC; 
