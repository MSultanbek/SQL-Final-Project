SELECT 
    c.company_name,
    COUNT(*) as total_bookings
FROM Bookings b
JOIN Companies c ON b.company_id = c.company_id
GROUP BY c.company_name
ORDER BY total_bookings DESC
LIMIT 5;