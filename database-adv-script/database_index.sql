-- Create indexes on frequently queried columns

-- User table: email for quick lookups
CREATE INDEX idx_user_email ON User(email);

-- Property table: host_id for filtering by host
CREATE INDEX idx_property_host_id ON Property(host_id);

-- Booking table: property_id and user_id for joins
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Booking table: start_date for partitioning and date-based queries
CREATE INDEX idx_booking_start_date ON Booking(start_date);

-- Payment table: booking_id for joins
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);

-- Review table: property_id for lookups
CREATE INDEX idx_review_property_id ON Review(property_id);
