CREATE DATABASE game_sales;
use  game_sales; 

select * from vgsales;

/* 1. Best year for gaming as per sales */

select Year, cast(sum(Global_sales) as decimal (10,2))as total_yearly_sales 
from vgsales 
group by Year
order by total_yearly_sales DESC;

/* 2. Top 5 Publisher by sales*/

SELECT Publisher, CAST(SUM(Global_sales) as DECIMAL (10,2)) as total_pub_sales
FROM vgsales
GROUP BY Publisher
ORDER BY total_pub_sales DESC;

/* 3. Top 5 genre by sales */

SELECT  Genre, CAST(SUM(Global_sales) as DECIMAL (10,2)) as total_pub_sales
FROM vgsales
GROUP BY Genre
ORDER BY total_pub_sales DESC
LIMIT 5;

/* 4. Top 5 platform by sales */

SELECT  Platform, CAST(SUM(Global_sales) as DECIMAL (10,2)) as total_plat_sales
FROM vgsales
GROUP BY Platform
ORDER BY total_plat_sales DESC
LIMIT 5;

/* 5. Best performing game in north America*/

SELECT Name, CAST(SUM(NA_Sales) as DECIMAL(10,2)) as NA_Sales
FROM vgsales
GROUP BY Name
ORDER BY NA_Sales DESC;
    
/* 6. Best performing game in Japan*/

SELECT Name, CAST(SUM(JP_Sales) as DECIMAL(10,2)) as JP_Sales
FROM vgsales
GROUP BY Name
ORDER BY JP_Sales DESC;
        
/* 7. Best performing game in Rest of the world*/

SELECT Name, CAST(SUM(Other_Sales) as DECIMAL(10,2)) as ROW_Sales
FROM vgsales
GROUP BY Name
ORDER BY ROW_Sales DESC;
        

/* 8. Publisher with most games */

SELECT Publisher, COUNT(Publisher) as total_games_released from vgsales
group by Publisher
order by total_games_released desc;

/* 9. Best platform by sales*/

SELECT Platform, cast(Sum(Global_sales) as decimal(10,2)) as total_platform_sales
from vgsales
group by Platform
order by total_platform_sales desc;

/* 10. Platform with most games*/

SELECT Platform, COUNT(Name) as total_games_platform
from vgsales
group by Platform
order by total_games_platform desc;

/* 11. Top publisher with most games sold by year */

SELECT Publisher, COUNT(Name) as total_games_published, CAST(SUM(Global_sales) as decimal(10,2)) as total_sales
from vgsales
group by Publisher
Order by total_sales desc;

/* 12. Most games released in a year*/

SELECT Year, count(Name) as total_games_published
from vgsales
group by Year 
order by total_games_published desc;

/* 13. Avg sales as platform*/

SELECT Platform, Cast(AVG(Global_sales) as decimal(10,2)) as Avg_sales_platfrom
from vgsales
group by Platform
order by Avg_sales_platfrom Desc; 

/* 14. Publishers having greater than avg global sales and total games greater than 5*/

SELECT Publisher, Cast(AVG(Global_sales) as decimal(10,2)) as Avg_sales_publisher
from vgsales
group by Publisher
Having Avg_sales_publisher >
(select avg(Global_sales) from vgsales) and count(Name) > 5
order by Avg_sales_publisher Desc;

/* 15. percentage games per platform*/

SELECT Platform, (Count(Name) *100) / (select Count(Platform) from vgsales) as percentage  
from vgsales
group by Platform
order by percentage desc;

/* 16. percentage games per genre*/

SELECT Genre, (Count(Name) *100) / (select Count(Genre) from vgsales) as percentage  
from vgsales
group by Genre
order by percentage desc;

/* 17. publisher with the highest percentage of total global sales.*/

SELECT Publisher, CAST(count(Name)*100/ (select sum(global_sales) from vgsales) as DECIMAL(10,2)) as sales_percent
from vgsales
group by Publisher
order by sales_percent desc;

/* 18. genres with the highest standard deviation of global sales */

select Genre, CAST(stddev(Global_sales) as DECIMAL(10,2)) as sd
from vgsales
group by Genre
having count(name)>5
order by sd desc;



        