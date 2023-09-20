-- Active: 1695105342139@@127.0.0.1@5432@northwind@public

-- 1
SELECT employees.first_name ,employees.last_name ,COUNT(order_ID)
FROM employees INNER JOIN orders
ON employees.Employee_ID = orders.employee_id
GROUP BY employees.employee_id;

-- 2
SELECT categories.category_name , sum((order_Details.unit_price * quantity)*(1-discount)) AS Total_Sales
FROM products INNER JOIN order_details
ON order_details.product_id = products.product_id
INNER JOIN categories
on categories.category_id = products.category_id
GROUP BY category_name;

-- 3
SELECT customers.contact_name ,avg((order_Details.unit_price * quantity)*(1-discount)) AS avg_Sale
FROM customers INNER JcOIN orders
ON orders.customer_id = customers.customer_id
INNER JOIN order_details
ON orders.order_id = order_details.order_id
GROUP BY customers.contact_name
ORDER BY avg_Sale DESC;


-- 4
SELECT customers.contact_name ,sum((order_Details.unit_price * quantity)*(1-discount)) AS total_spent
FROM customers INNER JOIN orders
ON orders.customer_id = customers.customer_id
INNER JOIN order_details
ON orders.order_id = order_details.order_id
GROUP BY customers.contact_name
ORDER BY total_spent DESC LIMIT 10;

-- 5
SELECT EXTRACT(YEAR FROM orders.order_date)||' '|| EXTRACT(MONTH FROM orders.order_date) AS monthes, sum((order_Details.unit_price * quantity)*(1-discount)) AS month_spending
FROM orders INNER JOIN order_details
ON orders.order_id = order_details.order_id
GROUP BY monthes
ORDER BY monthes DESC;

-- 6
SELECT product_name , units_in_stock
from products
WHERE units_in_stock<10;

-- 7
SELECT customers.contact_name , max((order_Details.unit_price * quantity)*(1-discount)) AS biggest_order
FROM customers INNER JOIN orders
ON customers.customer_id = orders.customer_id
INNER JOIN order_details
ON orders.order_id = order_details.order_id
GROUP BY  contact_name 
ORDER BY biggest_order DESC
LIMIT 1;

-- 8
SELECT orders.ship_country as country , sum((order_Details.unit_price * quantity)*(1-discount)) AS total_country
FROM orders INNER JOIN order_details
ON orders.order_id = order_details.order_id
GROUP BY country
ORDER BY total_country DESC;

 -- 9
SELECT orders.ship_name , count(orders.ship_name) as ordersship
from orders
GROUP BY ship_name
ORDER BY ordersship DESC;

-- 10 
SELECT product_name
FROM products
INNER JOIN order_details
ON order_details.product_id IS NULL
GROUP BY product_name;