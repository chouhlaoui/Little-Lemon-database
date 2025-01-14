SHOW DATABASES;

USE littlelemondb;

SELECT * FROM Bookings;

show tables;

CREATE VIEW ordersANDstatus AS 
SELECT order_id, O.date, O.quantity, O.Total, OS.status 
FROM orders AS O
INNER JOIN orderstatus AS OS
ON O.order_id = OS.Orders_order_id;

SELECT * FROM ordersANDstatus;

CREATE VIEW OrdersView  AS 
SELECT order_id, O.quantity, O.Total AS Cost
FROM orders AS O
WHERE O.quantity>2;

SELECT * FROM OrdersView;

SELECT customer_id, name AS FullName, order_id, Total AS Cost, MenuName, CourseName
FROM Customers AS C
INNER JOIN bookings AS b
ON b.customers_customer_id = customer_id
INNER JOIN orders AS O
ON booking_id = bookings_booking_id
INNER JOIN Menu AS M
ON orders_order_id = order_id
INNER JOIN MenuItems AS IM
ON menu_menu_id = menu_id
WHERE total>150;

WITH CTE AS(
SELECT COUNT(order_id) AS counting, menu_id
FROM orders
INNER JOIN menu
ON orders_order_id = order_id
GROUP BY menu_id
HAVING counting > 2
)

SELECT MenuName
FROM Menu
WHERE Menu_id = ANY (
    SELECT Menu_id
    FROM CTE
);




