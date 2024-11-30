
-- Insert sample data into User table
INSERT INTO [User] (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES 
    ('00000000-0000-0000-0000-000000000001', 'Alice', 'Smith', 'alice@example.com', 'hashedpassword1', '1234567890', 'guest', CURRENT_TIMESTAMP),
    ('00000000-0000-0000-0000-000000000002', 'Bob', 'Johnson', 'bob@example.com', 'hashedpassword2', '0987654321', 'host', CURRENT_TIMESTAMP),
    ('00000000-0000-0000-0000-000000000003', 'Charlie', 'Brown', 'charlie@example.com', 'hashedpassword3', NULL, 'admin', CURRENT_TIMESTAMP);

-- Insert sample data into Location table
INSERT INTO Location (location_id, location_name)
VALUES 
    ('00000000-0000-0000-0000-000000000101', 'New York, NY'),
    ('00000000-0000-0000-0000-000000000102', 'Los Angeles, CA');

-- Insert sample data into Property table
INSERT INTO Property (property_id, host_id, location_id, name, description, price_per_night, created_at, updated_at)
VALUES 
    ('00000000-0000-0000-0000-000000000201', '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000101', 'Cozy Apartment', 'A nice apartment in NYC', 150.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('00000000-0000-0000-0000-000000000202', '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000102', 'Modern Villa', 'A luxury villa in LA', 500.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert sample data into Booking table
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES 
    ('00000000-0000-0000-0000-000000000301', '00000000-0000-0000-0000-000000000201', '00000000-0000-0000-0000-000000000001', '2024-12-01', '2024-12-05', 600.00, 'confirmed', CURRENT_TIMESTAMP),
    ('00000000-0000-0000-0000-000000000302', '00000000-0000-0000-0000-000000000202', '00000000-0000-0000-0000-000000000001', '2024-12-10', '2024-12-15', 2500.00, 'pending', CURRENT_TIMESTAMP);

-- Insert sample data into Payment table
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES 
    ('00000000-0000-0000-0000-000000000401', '00000000-0000-0000-0000-000000000301', 600.00, CURRENT_TIMESTAMP, 'credit_card');

-- Insert sample data into Review table
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES 
    ('00000000-0000-0000-0000-000000000501', '00000000-0000-0000-0000-000000000201', '00000000-0000-0000-0000-000000000001', 5, 'Amazing stay!', CURRENT_TIMESTAMP);

-- Insert sample data into Message table
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES 
    ('00000000-0000-0000-0000-000000000601', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000002', 'Is the property available on the selected dates?', CURRENT_TIMESTAMP);