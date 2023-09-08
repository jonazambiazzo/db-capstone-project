-- exercise 1:

CREATE PROCEDURE GetMaxQuantity()
	SELECT max(quantity) as MaxQuantity FROM littlelemondm.orders;
    
CALL GetMaxQuantity;

-- exercise 2:

PREPARE GetOrderDetail FROM 'SELECT order_id, quantity, total_cost FROM littlelemondm.orders WHERE customer_id = ?';

SET @id = 1;
EXECUTE GetOrderDetail USING @id;

-- exercise 3:

CREATE PROCEDURE CancelOrder(id INT)
DELETE FROM littlelemondm.orders WHERE order_id = id;

CALL CancelOrder(5);