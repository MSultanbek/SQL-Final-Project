SELECT arrival_date_month, COUNT(*) as total_bookings
FROM Bookings
GROUP BY arrival_date_month
ORDER BY total_bookings ASC
LIMIT 3;