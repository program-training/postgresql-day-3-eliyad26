-- 1
SELECT customers.contact_name
FROM customers LEFT JOIN orders
ON customers.customer_id = orders.customer_id
WHERE orders.customer_id IS NULL;

-- 2
SELECT customers.contact_name, count(orders.order_id)
FROM customers INNER JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY customers.contact_name
HAVING count(orders.order_id) > 10 
ORDER BY count(orders.order_id) DESC;

-- 3
SELECT product_name, unit_price
FROM products
WHERE unit_price > (SELECT avg(unit_price) FROM products);

-- 4
SELECT products.product_name
FROM products LEFT OUTER JOIN order_details
ON products.product_id = order_details.product_id
WHERE order_details.product_id IS NULL;

-- 5
SELECT customers.country , count(customers.country)
FROM customers
GROUP BY country
HAVING count(customers.country) >= 5;

-- 6
SELECT customers.contact_name
FROM customers
WHERE customers.contact_name NOT IN (SELECT customers.contact_name as namee
FROM customers LEFT OUTER JOIN orders
ON customers.customer_id = orders.customer_id
 WHERE EXTRACT(YEAR FROM orders.order_date) = 1998) ;



-- 7
SELECT customers.contact_name
FROM customers 
WHERE customers.country = 'Germany' AND customers.contact_name NOT IN (SELECT customers.contact_name as namee
FROM customers LEFT OUTER JOIN orders
ON customers.customer_id = orders.customer_id
 WHERE EXTRACT(YEAR FROM orders.order_date) = 1997)
;


--8
SELECT customers.contact_name , count(orders.order_ID)
FROM customers INNER JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY customers.contact_name
HAVING count(orders.order_ID) = 3 ;


-- 10
SELECT suppliers.company_name , suppliers.country
FROM suppliers INNER JOIN products
ON suppliers.supplier_id = products.supplier_id
INNER JOIN  order_details
ON products.product_id = order_details.product_id
GROUP BY suppliers.company_name , suppliers.country 
HAVING suppliers.country LIKE 'USA';
