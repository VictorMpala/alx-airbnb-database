-- Insert Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
(gen_random_uuid(), 'Alice', 'Johnson', 'alice@example.com', 'hashed_password1', '1234567890', 'guest', NOW()),
(gen_random_uuid(), 'Bob', 'Smith', 'bob@example.com', 'hashed_password2', '2345678901', 'host', NOW()),
(gen_random_uuid(), 'Charlie', 'Brown', 'charlie@example.com', 'hashed_password3', '3456789012', 'guest', NOW()),
(gen_random_uuid(), 'Diana', 'Miller', 'diana@example.com', 'hashed_password4', '4567890123', 'host', NOW());

-- Insert Properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at)
VALUES
(gen_random_uuid(), (SELECT user_id FROM User WHERE email='bob@example.com'), 'Cozy Apartment', 'A lovely apartment in the city center.', 'New York', 120.00, NOW(), NOW()),
(gen_random_uuid(), (SELECT user_id FROM User WHERE email='diana@example.com'), 'Beach House', 'A spacious beach house with sea view.', 'Miami', 250.00, NOW(), NOW());

-- Insert Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
(gen_random_uuid(),
 (SELECT property_id FROM Property WHERE name='Cozy Apartment'),
 (SELECT user_id FROM User WHERE email='alice@example.com'),
 '2025-09-01', '2025-09-05', 480.00, 'confirmed', NOW()),

(gen_random_uuid(),
 (SELECT property_id FROM Property WHERE name='Beach House'),
 (SELECT user_id FROM User WHERE email='charlie@example.com'),
 '2025-09-10', '2025-09-15', 1250.00, 'pending', NOW());

-- Insert Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
(gen_random_uuid(),
 (SELECT booking_id FROM Booking WHERE total_price=480.00),
 480.00, NOW(), 'credit_card'),

(gen_random_uuid(),
 (SELECT booking_id FROM Booking WHERE total_price=1250.00),
 1250.00, NOW(), 'paypal');

-- Insert Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
(gen_random_uuid(),
 (SELECT property_id FROM Property WHERE name='Cozy Apartment'),
 (SELECT user_id FROM User WHERE email='alice@example.com'),
 5, 'Amazing stay, very comfortable!', NOW()),

(gen_random_uuid(),
 (SELECT property_id FROM Property WHERE name='Beach House'),
 (SELECT user_id FROM User WHERE email='charlie@example.com'),
 4, 'Great location but could be cleaner.', NOW());

-- Insert Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
(gen_random_uuid(),
 (SELECT user_id FROM User WHERE email='alice@example.com'),
 (SELECT user_id FROM User WHERE email='bob@example.com'),
 'Hi Bob, I loved staying at your apartment!', NOW()),

(gen_random_uuid(),
 (SELECT user_id FROM User WHERE email='charlie@example.com'),
 (SELECT user_id FROM User WHERE email='diana@example.com'),
 'Hi Diana, is the beach house available next month?', NOW());
