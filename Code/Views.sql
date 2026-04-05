CREATE VIEW v_seasonal_occupancy AS
SELECT 
    arrival_date_year,
    arrival_date_month,
    COUNT(*) AS total_bookings,
    SUM(is_canceled) AS total_cancellations,
    COUNT(*) - SUM(is_canceled) AS confirmed_bookings,
    ROUND(SUM(is_canceled) * 100.0 / COUNT(*), 2) AS cancellation_rate
FROM Bookings
GROUP BY arrival_date_year, arrival_date_month
ORDER BY arrival_date_year, arrival_date_month;


Create view v_guest_profitability as
select 
	p.customer_type,
	ROUND(AVG(adr), 2) AS avg_adr,
    SUM(b.is_canceled) * 100.0 / COUNT(*) AS cancellation_rate,
    COUNT(*) AS total_bookings
from bookings as b
join customers as p 
on p.customer_id = b.customer_id
group by p.customer_type
order by p.customer_type;


CREATE VIEW v_guest_loyalty AS
SELECT
	AVG(total_of_special_requests) as avg_requests,
    AVG(b.room_type_id = b.assigned_room_type_id) * 100 as room_match_rate,
    AVG(p.previous_cancellations) as avg_prev_cancellations,
    p.is_repeated_guest
from bookings as b
join customers as p
on p.customer_id = b.customer_id
group by is_repeated_guest
order by is_repeated_guest desc;



CREATE VIEW v_company_requirement AS
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
order by avg_adr;