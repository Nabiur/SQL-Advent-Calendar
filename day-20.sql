-- SQL Advent Calendar - Day 20
-- Title: Hot Cocoa Break Logs
-- Difficulty: medium
--
-- Question:
-- Jack Frost wants to review all the cocoa breaks he actually took — including the cocoa type and the location he drank it in. How would you combine the necessary tables to show each logged break with its matching cocoa details and location?
--
-- Jack Frost wants to review all the cocoa breaks he actually took — including the cocoa type and the location he drank it in. How would you combine the necessary tables to show each logged break with its matching cocoa details and location?
--

-- Table Schema:
-- Table: cocoa_logs
--   log_id: INT
--   break_id: INT
--   cocoa_id: INT
--
-- Table: break_schedule
--   break_id: INT
--   location_id: INT
--
-- Table: cocoa_types
--   cocoa_id: INT
--   cocoa_name: VARCHAR
--
-- Table: locations
--   location_id: INT
--   location_name: VARCHAR
--

-- My Solution:

select c.log_id,c.break_id,c.cocoa_id,l.location_id,co.cocoa_name,l.location_name from cocoa_logs c
left join break_schedule b using(break_id)
left join locations l using(location_id)
left join cocoa_types co using(cocoa_id)
