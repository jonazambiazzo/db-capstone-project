
-- Exercise 1:
INSERT INTO littlelemondm.bookings VALUES
(1, '2022-10-10', 5, 1),
(2, '2022-10-11', 3, 3),
(3, '2022-10-12', 2, 2),
(4, '2022-10-13', 5, 1);

-- excercise 2:
CREATE PROCEDURE CheckBooking (bookdate DATE, booktable INT)
	SELECT 
		CASE 
			WHEN booking_date = bookdate AND table_number = booktable
            THEN "Table is free"
            ELSE "Table is already booked"
		END AS Booking_Status
	FROM littlelemondm.bookings;
    

CALL CheckBooking("2020-11-09", 11);

-- exercise 3:
DELIMITER //

CREATE PROCEDURE AddValidBooking(bookingdate DATE, tablenumber INT)
    START TRANSACTION;
    INSERT INTO bookings VALUES (6, bookingdate, tablenumber, 1)
	IF 
    (SELECT MAX(repeated) as max_repeated  from (    
SELECT booking_date, table_number, count(table_number) as repeated
FROM bookings
group by booking_date, table_number) as booking_sub) > 1;
	THEN
		ROLLBACK;
	ELSE
		COMMIT;
	END IF;

DELIMITER ;

CALL AddValidBooking('2020-10-11', 5);
