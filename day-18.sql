-- SQL Advent Calendar - Day 18
-- Title: 12 Days of Data - Progress Tracking
-- Difficulty: hard
--
-- Question:
-- Over the 12 days of her data challenge, Data Dawn tracked her daily quiz scores across different subjects. Can you find each subject's first and last recorded score to see how much she improved?
--
-- Over the 12 days of her data challenge, Data Dawn tracked her daily quiz scores across different subjects. Can you find each subject's first and last recorded score to see how much she improved?
--

-- Table Schema:
-- Table: daily_quiz_scores
--   subject: VARCHAR
--   quiz_date: DATE
--   score: INTEGER
--

-- My Solution:

select DISTINCT subject,FIRST,LAST from (

select *,first_VALUE(score)over(partition by subject order by quiz_date) first,
    last_VALUE(score)over(partition by subject order by quiz_date rows between UNBOUNDED PRECEDING and UNBOUNDED FOLLOWING)
  as last from daily_quiz_scores) t;
