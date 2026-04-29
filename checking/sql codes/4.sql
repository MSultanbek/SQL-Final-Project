SELECT 
    c.customer_type,
    ROUND(AVG(b.adr), 2) as avg_adr,
    COUNT(*) as total_bookings
FROM Bookings b
JOIN Customers c ON b.customer_id = c.customer_id
GROUP BY c.customer_type
ORDER BY avg_adr DESC;