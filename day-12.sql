-- SQL Advent Calendar - Day 12
-- Title: North Pole Network Most Active Users
-- Difficulty: hard
--
-- Question:
-- The North Pole Network wants to see who's the most active in the holiday chat each day. Write a query to count how many messages each user sent, then find the most active user(s) each day. If multiple users tie for first place, return all of them.
--
-- The North Pole Network wants to see who's the most active in the holiday chat each day. Write a query to count how many messages each user sent, then find the most active user(s) each day. If multiple users tie for first place, return all of them.
--

-- Table Schema:
-- Table: npn_users
--   user_id: INT
--   user_name: VARCHAR
--
-- Table: npn_messages
--   message_id: INT
--   sender_id: INT
--   sent_at: TIMESTAMP
--

-- My Solution:

with cte as(
select date(sent_at) as date , user_name,COUNT(*) as cnt from npn_messages
left join npn_users on npn_messages.sender_id=npn_users.user_id 
group by 1,2
order by 3 desc
  ),
  cte1 as(
select date,user_name,cnt, RANK()over(partition by date order by cnt desc) as rk from cte)
select date, user_name,cnt from cte1
where rk=1;
