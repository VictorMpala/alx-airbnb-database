-- Indexes to improve query performance

-- User table: index on email (frequent WHERE/JOIN), user_id (already PK, but explicit for clarity)
CREATE INDEX idx_user_email ON "User"(email);
CREATE INDEX idx_user_user_id ON "User"(user_id);

-- Property table: index on property_id (already PK, but explicit for clarity), host_id (frequent JOIN)
CREATE INDEX idx_property_property_id ON Property(property_id);
CREATE INDEX idx_property_host_id ON Property(host_id);

-- Booking table: index on booking_id (already PK), property_id and user_id (frequent JOIN/WHERE)
CREATE INDEX idx_booking_booking_id ON Booking(booking_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Example: Measure query performance before and after adding indexes
-- EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id = 'some-uuid';
-- EXPLAIN ANALYZE SELECT * FROM Property WHERE host_id = 'some