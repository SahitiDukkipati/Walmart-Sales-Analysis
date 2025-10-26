---1.selecting the table
select*from walmart_sales

---2.counting the rows
select count(*)from walmart_sales


---3.count the store 2 in the walmart
select count(*) from walmart_sales
where store=2

----4.check the profit and loss
select store,sales_change
from walmart_sales
where status='Profit'

select store,sales_change
from walmart_sales
where status='Loss'

----5.for each month which had the highest sales
SELECT 
    store,
    YEAR(date) AS year,
    MONTH(date) AS month,
    SUM(weekly_sales) AS total_sales
FROM walmart_sales
GROUP BY 
    store,
    YEAR(date),
    MONTH(date)
ORDER BY 
    YEAR(date) ASC,
    MONTH(date) ASC,
    store ASC;


    ---5.1BASED ON STORES
    SELECT 
    store,
    YEAR(date) AS year,
    MONTH(date) AS month,
    SUM(weekly_sales) AS total_sales
FROM walmart_sales
where store=1
GROUP BY 
    store,
    YEAR(date),
    MONTH(date)
ORDER BY 
    YEAR(date) ASC,
    MONTH(date) ASC,
    store ASC;

    ---6.How many stores in total
   select count(DISTINCT store) AS total_stores
   from walmart_sales


   ---sales before and after holiday
   select 
   holiday_flag,
   ROUND(AVG(weekly_sales),2)AS avg_sales
   FROM walmart_sales
   GROUP BY holiday_flag

   ---month with unemployement above average
   SELECT 
    YEAR(date) AS year,
    MONTH(date) AS month,
    ROUND(AVG(unemployment), 2) AS avg_unemployment
FROM walmart_sales
GROUP BY YEAR(date), MONTH(date)
HAVING AVG(unemployment) > (
    SELECT AVG(unemployment) FROM walmart_sales
)
ORDER BY year, month;
