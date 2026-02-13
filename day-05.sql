-- SQL Advent Calendar - Day 5
-- Title: Elf Vacation Status
-- Difficulty: medium
--
-- Question:
-- Some elves took time off after the holiday rush, but not everyone has returned to work. List all elves by name, showing their return date. If they have not returned from vacation, list their return date as "Still resting".
--
-- Some elves took time off after the holiday rush, but not everyone has returned to work. List all elves by name, showing their return date. If they have not returned from vacation, list their return date as "Still resting".
--

-- Table Schema:
-- Table: elves
--   elf_id: INT
--   elf_name: VARCHAR
--
-- Table: vacations
--   elf_id: INT
--   start_date: DATE
--   return_date: DATE
--

-- My Solution:

SELECT elf_name ,case when return_date is null then 'Still resting' 
else return_date::TEXT end as return_date from elves
left join vacations using(elf_id)
