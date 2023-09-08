
-- exercise 1:

CREATE VIEW OrdersView AS
SELECT orders.order_id, orders.quantity, orders.total_cost FROM littlelemondm.orders
WHERE orders.quantity > 2

-- exercise 2:

SELECT customers.customer_id, customers.customer_name, orders.order_id,
	orders.total_cost, menu.cuisine, menu_items.course_name, menu_items.starter_name
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
INNER JOIN menu
ON orders.menu_id = menu.menu_id
INNER JOIN menu_items
ON menu.menu_item_id = menu_items.menu_item_id
WHERE orders.total_cost > 15.00
ORDER BY orders.total_cost 

-- exercise 3:

SELECT cuisine FROM menu WHERE menu_id = ANY
	(SELECT menu_id FROM orders WHERE quantity > 2);

