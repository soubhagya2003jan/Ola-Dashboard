-- Retrieve all successful bookings

CREATE VIEW successfull_bookings AS (
SELECT * FROM bookings
WHERE Booking_Status = "Success"
);

SELECT * FROM successfull_bookings;

-- Find the average ride distance for each vehicle type:

CREATE VIEW avg_distance AS (
SELECT vehicle_type, round(AVG(ride_distance),2) AS 
avg_distance
FROM successfull_bookings
GROUP BY vehicle_type
);

SELECT * FROM avg_distance;

-- Get the total number of cancelled rides by customer:

CREATE VIEW cancelled AS (
SELECT COUNT(*) AS cacelled_bookings FROM bookings
WHERE Booking_status = "Canceled by Customer"
);

SELECT * FROM cancelled;


-- List the top 5 customers who booked the highest number of rides:

CREATE VIEW top5 AS (
SELECT customer_id, COUNT(booking_id) AS number_of_books
FROM bookings
GROUP BY customer_id
ORDER BY COUNT(booking_id) DESC 
LIMIT 5
);

SELECT * FROM top5;

-- Get the number of rides cancelled by 
-- drivers due to personal and car-related issues:

CREATE VIEW personal_reason AS (
SELECT * FROM bookings
WHERE Canceled_Rides_by_Driver = "Personal & Car related issue"
);

SELECT * FROM personal_reason;

-- Find the maximum and minimum driver ratings for Prime Sedan bookings:

CREATE VIEW low_min AS (
SELECT MIN(driver_ratings) AS min_driver_rating,
MAX(driver_ratings) AS max_driver_ratings
FROM bookings
);

SELECT * FROM low_min;


-- Find the average customer rating per vehicle type:

CREATE VIEW rating_by_vehicle AS (
SELECT vehicle_type, round(AVG(customer_rating),2) AS avg_rating
FROM bookings
GROUP BY vehicle_type
);

SELECT * FROM rating_by_vehicle;

-- Calculate the total booking value of rides completed successfully:

CREATE VIEW total_booking_values AS (
SELECT SUM(booking_value) AS total_value
FROM bookings
WHERE Incomplete_Rides != "No"
);

SELECT * FROM total_booking_values;

-- List all incomplete rides along with the reason:

CREATE VIEW reason AS (
SELECT booking_id,customer_id,vehicle_type,pickup_location,drop_location,incomplete_rides,incomplete_rides_reason
FROM bookings
WHERE Incomplete_rides = "No"
);

SELECT * FROM reason;

-- Retrieve all rides where payment was made using UPI:

CREATE VIEW payment_by_upi AS (
SELECT * FROM bookings
WHERE Payment_Method = "UPI"
);

SELECT * FROM payment_by_upi;


















