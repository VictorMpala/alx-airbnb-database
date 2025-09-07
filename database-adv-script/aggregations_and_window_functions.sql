-- 1. Total number of bookings made by each user
SELECT b.user_id, u.first_name, u.last_name, COUNT(b.booking_id) AS total_bookings
FROM Booking b
INNER JOIN "User" u ON b.user_id = u.user_id
GROUP BY b.user_id, u.first_name, u.last_name;

-- 2. Rank properties based on total number of bookings using RANK() and ROW_NUMBER()
SELECT *
FROM (
    SELECT 
        p.property_id, 
        p.name, 
        COUNT(b.booking_id) AS booking_count,
        RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS property_rank,
        ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS property_row_number
    FROM Property p
    LEFT JOIN Booking b ON p.property_id = b.property_id
    GROUP BY p.property_id, p.name
)