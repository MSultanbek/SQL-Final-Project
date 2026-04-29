SELECT 
    arrival_date_year,
    arrival_date_month,
    COUNT(*) as total_bookings,
    SUM(is_canceled) as cancellations,
    ROUND(SUM(is_canceled) * 100.0 / COUNT(*), 2) as cancellation_rate
FROM Bookings
GROUP BY arrival_date_year, arrival_date_month
ORDER BY cancellation_rate DESC
LIMIT 5;