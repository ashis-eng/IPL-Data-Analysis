CREATE DATABASE IPL_Analysis;
Go

Use IPL_Analysis;
--Data Verification
select top 10 * FROM matches;

--Total Matches Played
select count(*) as Total_matches
from matches

--Different IPL Seasons
select distinct season
from matches
order by season;

--Most Successful Teams
select winner,count(*) as Total_Wins
from matches
group by winner
order by Total_Wins DESC;

-- Data cleaning: standardizing IPL team names
update matches 
set winner = 'Delhi Capitals'
where winner = 'Delhi Daredevils';

update matches 
set winner = 'Punjab Kings'
where winner = 'Kings XI Punjab';

update matches 
set winner = 'Royal Challengers Bengaluru'
where winner = 'Royal Challengers Bangalore';

UPDATE matches
SET winner = 'Rising Pune Supergiants'
WHERE winner = 'Rising Pune Supergiant';

update matches
set winner = 'No Result'
where winner = 'NA'

--Most Successful Teams
select winner,count(*) as Total_Wins
from matches
group by winner
order by Total_Wins DESC;

--Analyszing toss decison preferences across ipl matches
select toss_decision, count(*) as Total_Decision
from matches
group by toss_decision
order by Total_Decision DESC;

--Analysing how often toss winner also won the match
select count(*) as Toss_And_Match_Wins
from matches
where toss_winner = winner;

--Calculate the persentage of matches where toss winner also won the match
select round((count(*) * 100.00) / (select count(*) from matches),2) as Toss_Win_Persentage
from matches
where toss_winner = winner;

--Analyzing cities with highest number of IPL matches
select city, count(*) as Total_Matches
from matches
group by city
order by Total_Matches DESC;

--Checking rows where city information is missing 
select * from matches
where city = 'NA';

--Flilling missing city names for Dubai stadium matches
--Dubai International Stadium
update matches
set city = 'Dubai'
where venue = 'Dubai International Stadium'
and city = 'NA';

--Flilling missing city names for Sharjah Cricket Stadium
update matches 
set city = 'Sharjah'
where venue = 'Sharjah Cricket Stadium'
and city = 'NA';

-- Standardizing stadium and venue names
update matches
set venue = 'Sheikh Zayed Stadium'
where venue = 'Zayed Cricket Stadium,Abu Dhabi';

--Filling missing city names for Abu Dhabi stadium matches
update matches
set City = 'Abu Dhabi'
where venue = 'Sheikh Zayed Stadium'
and City = 'NA';

--Analysz total matches played in IPL season
select season,count(*) as Total_season
from matches
group by season
order by season;

--Analysing stadiums hosting the highest number of IPL matches
select venue, count(*) as Total_matches
from matches
group by venue
order by Total_matches desc;

select venue from matches;