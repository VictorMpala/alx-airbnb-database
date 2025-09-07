# Performance Monitoring Report

## Tools Used
- EXPLAIN
- EXPLAIN ANALYZE
- SHOW PROFILE (where supported)

## Findings
- Booking queries without indexes performed full table scans.
- JOINs between Booking, User, and Property were costly without indexes.

## Actions Taken
1. Created indexes on user_id, property_id, booking_id, and start_date.
2. Refactored complex queries to only select necessary columns.
3. Applied partitioning on the Booking table by start_date.

## Results
- Query response times reduced drastically.
- Query plans show use of indexes instead of sequential scans.
- Schema now supports scalability for large datasets.