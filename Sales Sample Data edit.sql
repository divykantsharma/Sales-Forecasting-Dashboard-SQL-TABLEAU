---Inspecting Data
select * from [dbo].[sales_data_sample]

--Checking unique values
select distinct status from [dbo].[sales_data_sample] -- 6 status -> Resolved, On Hold, Cancelled, Shipped, Dispatched, In Process
select distinct year_id from [dbo].[sales_data_sample]	-- 3 years -> 2003, 2004, 2005
select distinct PRODUCTLINE from [dbo].[sales_data_sample] -- 7 products -> Trains, Motorccyle, Ships, Trucks and Buses, Vintage Cars, Classic Cars, Planes
select distinct COUNTRY from [dbo].[sales_data_sample] -- 19 countries -> From Finland to Singapore
select distinct DEALSIZE from [dbo].[sales_data_sample] -- 3 sizes -> Large, Medium, Small
select distinct TERRITORY from [dbo].[sales_data_sample] -- 4 territories -> EMCA, APAC, Japan, NA

select distinct MONTH_ID from [dbo].[sales_data_sample] 
where year_id = 2003



--ANALYSIS
--Let's start by grouping sales by productline
select PRODUCTLINE, sum(sales) Revenue
from [dbo].[sales_data_sample]
group by PRODUCTLINE
order by 2 desc



--In which year they made the most sales?
select YEAR_ID, sum(sales) Revenue
from [dbo].[sales_data_sample]
group by YEAR_ID
order by 2 desc



--Which dealsize generated the most revenue?
select  DEALSIZE,  sum(sales) Revenue
from [PortfolioDB].[dbo].[sales_data_sample]
group by  DEALSIZE
order by 2 desc



--What was the best month for sales in a specific year? How much was earned that month?
select  MONTH_ID, sum(sales) Revenue, count(ORDERNUMBER) Frequency
from [PortfolioDB].[dbo].[sales_data_sample]
where YEAR_ID = 2004 --change year to see the rest
group by  MONTH_ID
order by 2 desc



--November seems to be the month, what product do they sell in November?
select  MONTH_ID, PRODUCTLINE, sum(sales) Revenue, count(ORDERNUMBER)
from [PortfolioDB].[dbo].[sales_data_sample]
where YEAR_ID = 2004 and MONTH_ID = 11 --change year to see the rest
group by  MONTH_ID, PRODUCTLINE
order by 3 desc



---EXTRAs----
--What city has the highest number of sales in a specific country
select city, sum (sales) Revenue
from [PortfolioDB].[dbo].[sales_data_sample]
where country = 'UK'
group by city
order by 2 desc



---What is the best product in United States?
select country, YEAR_ID, PRODUCTLINE, sum(sales) Revenue
from [PortfolioDB].[dbo].[sales_data_sample]
where country = 'USA'
group by  country, YEAR_ID, PRODUCTLINE
order by 4 desc