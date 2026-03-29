create database if not exists hotel_management;
use hotel_management;


CREATE TABLE Hotels (
    hotel_id INT AUTO_INCREMENT PRIMARY KEY,
    hotel_name VARCHAR(255)
);

CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    country VARCHAR(100),
    customer_type VARCHAR(100),
    is_repeated_guest INT,
    previous_cancellations INT,
    previous_bookings_not_canceled INT
);

CREATE TABLE MealPlans (
    meal_id INT AUTO_INCREMENT PRIMARY KEY,
    meal_type VARCHAR(100)
);

CREATE TABLE RoomTypes (
    room_type_id INT AUTO_INCREMENT PRIMARY KEY,
    room_type VARCHAR(100)
);

CREATE TABLE DepositTypes (
    deposit_type_id INT AUTO_INCREMENT PRIMARY KEY,
    deposit_type VARCHAR(100)
);



CREATE TABLE Agents (

    agent_id INT PRIMARY KEY,
    agent_name VARCHAR(100)

);



CREATE TABLE Companies (

    company_id INT PRIMARY KEY,
    company_name VARCHAR(100)

);


-- 2. Create the central Bookings Fact Table



CREATE TABLE Bookings (

-- Foreign keys

    booking_id INT PRIMARY KEY,

    hotel_id INT,

    customer_id INT,

	agent_id INT NULL,
    
	company_id INT NULL,

    meal_id INT,

    room_type_id INT,

    assigned_room_type_id INT,

    deposit_type_id INT,

    

    -- Actual info

    arrival_date_year INT,

    arrival_date_month INT,

    arrival_date_week_number INT,

    arrival_date_day_of_month INT,

    stays_in_weekend_nights INT,

    stays_in_week_nights INT,

    adults INT,

    children INT,

    babies INT,

    booking_changes INT,

    days_in_waiting_list INT,

    required_car_parking_spaces INT,

    total_of_special_requests INT,

    adr FLOAT,

    is_canceled INT,

    lead_time INT,

    market_segment VARCHAR(100),

    distribution_channel VARCHAR(100),

    reservation_status VARCHAR(100),

    reservation_status_date DATE,

    

    -- Foreign Key Constraints

    FOREIGN KEY (hotel_id) REFERENCES Hotels(hotel_id),

    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),

    FOREIGN KEY (agent_id) REFERENCES Agents(agent_id),

    FOREIGN KEY (company_id) REFERENCES Companies(company_id),

    FOREIGN KEY (meal_id) REFERENCES MealPlans(meal_id),

    FOREIGN KEY (room_type_id) REFERENCES RoomTypes(room_type_id),

    FOREIGN KEY (assigned_room_type_id) REFERENCES RoomTypes(room_type_id),

    FOREIGN KEY (deposit_type_id) REFERENCES DepositTypes(deposit_type_id)

);
