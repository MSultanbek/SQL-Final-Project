DELIMITER //
CREATE PROCEDURE booking_stats(IN p_year INT, IN p_month INT)
BEGIN
    SELECT 
    count(*) as total_bookings,
    SUM(is_canceled) AS total_cancellations,
    COUNT(*) - SUM(is_canceled) AS confirmed_bookings,
    ROUND(AVG(adr), 2) AS avg_adr,
    SUM(is_canceled) * 100.0 / COUNT(*) AS cancellation_rate
    from bookings
    WHERE arrival_date_year = p_year 
    AND arrival_date_month = p_month
    group by arrival_date_year, arrival_date_month
    order by arrival_date_year, arrival_date_month;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE top_n_companies(IN lim INT)
BEGIN
    SELECT
	c.company_name as Company_name,
	COUNT(*) as total_bookings,
    ROUND(AVG(b.adr), 2) AS avg_adr,
    SUM(b.is_canceled) * 100.0 / COUNT(*) AS cancellation_rate,
    avg(b.stays_in_weekend_nights + b.stays_in_week_nights) AS avg_stay_length
from bookings as b
join companies as c
on b.company_id = c.company_id
group by Company_name
order by total_bookings desc
LIMIT lim;
END //
DELIMITER ;