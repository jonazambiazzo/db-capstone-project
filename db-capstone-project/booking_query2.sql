-- exercise 1:
CREATE PROCEDURE AddBooking(booking_id INT, booking_date DATE, table_number INT, customer_id INT)
INSERT INTO bookings VALUES (booking_id, booking_date, table_number, customer_id);

CALL AddBooking(8, '2020-01-01', 5, 1);

-- exercise 2:
CREATE PROCEDURE UpdateBooking (new_booking_id INT, new_booking_date DATE)
UPDATE littlelemondm.bookings  
SET booking_date = new_booking_date
WHERE booking_id = new_booking_id;

CALL UpdateBooking(8, '2020-01-02');

-- exercise 3:
CREATE PROCEDURE CancelBooking (cancel_booking_id INT)
DELETE FROM littlelemondm.bookings  
WHERE booking_id = cancel_booking_id;

CALL CancelBooking(8);
