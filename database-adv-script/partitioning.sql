-- Partitioning the Booking table by start_date (RANGE partitioning example in PostgreSQL)

-- Step 1: Create a partitioned table
CREATE TABLE Booking_partitioned (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- Step 2: Create partitions by year
CREATE TABLE Booking_2024 PARTITION OF Booking_partitioned
FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE Booking_2025 PARTITION OF Booking_partitioned
FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Step 3: Example query to check performance
EXPLAIN ANALYZE
SELECT * 
FROM Booking_partitioned
WHERE start_date BETWEEN '2025-01-01' AND '2025-03-31';