WITH sales AS (
    SELECT 'North' AS region, 'Q1' AS quarter, 1000 AS sales_amount FROM dual UNION ALL
    SELECT 'North' AS region, 'Q2' AS quarter, 1500 AS sales_amount FROM dual UNION ALL
    SELECT 'North' AS region, 'Q3' AS quarter, 2000 AS sales_amount FROM dual UNION ALL
    SELECT 'North' AS region, 'Q4' AS quarter, 2500 AS sales_amount FROM dual UNION ALL
    SELECT 'South' AS region, 'Q1' AS quarter, 1200 AS sales_amount FROM dual UNION ALL
    SELECT 'South' AS region, 'Q2' AS quarter, 1300 AS sales_amount FROM dual UNION ALL
    SELECT 'South' AS region, 'Q3' AS quarter, 1700 AS sales_amount FROM dual UNION ALL
    SELECT 'South' AS region, 'Q4' AS quarter, 2100 AS sales_amount FROM dual
)
SELECT region, quarter, SUM(sales_amount) AS total_sales
FROM sales
GROUP BY region, quarter;

WITH sales AS (
    SELECT 'North' AS region, 'Q1' AS quarter, 1000 AS sales_amount FROM dual UNION ALL
    SELECT 'North' AS region, 'Q2' AS quarter, 1500 AS sales_amount FROM dual UNION ALL
    SELECT 'North' AS region, 'Q3' AS quarter, 2000 AS sales_amount FROM dual UNION ALL
    SELECT 'North' AS region, 'Q4' AS quarter, 2500 AS sales_amount FROM dual UNION ALL
    SELECT 'South' AS region, 'Q1' AS quarter, 1200 AS sales_amount FROM dual UNION ALL
    SELECT 'South' AS region, 'Q2' AS quarter, 1300 AS sales_amount FROM dual UNION ALL
    SELECT 'South' AS region, 'Q3' AS quarter, 1700 AS sales_amount FROM dual UNION ALL
    SELECT 'South' AS region, 'Q4' AS quarter, 2100 AS sales_amount FROM dual
)
SELECT region, quarter, SUM(sales_amount) AS total_sales
FROM sales
GROUP BY rollup(region, quarter);


WITH sales AS (
    SELECT 'North' AS region, 'Q1' AS quarter, 1000 AS sales_amount FROM dual UNION ALL
    SELECT 'North' AS region, 'Q2' AS quarter, 1500 AS sales_amount FROM dual UNION ALL
    SELECT 'North' AS region, 'Q3' AS quarter, 2000 AS sales_amount FROM dual UNION ALL
    SELECT 'North' AS region, 'Q4' AS quarter, 2500 AS sales_amount FROM dual UNION ALL
    SELECT 'South' AS region, 'Q1' AS quarter, 1200 AS sales_amount FROM dual UNION ALL
    SELECT 'South' AS region, 'Q2' AS quarter, 1300 AS sales_amount FROM dual UNION ALL
    SELECT 'South' AS region, 'Q3' AS quarter, 1700 AS sales_amount FROM dual UNION ALL
    SELECT 'South' AS region, 'Q4' AS quarter, 2100 AS sales_amount FROM dual
)
SELECT region, quarter, SUM(sales_amount) AS total_sales
FROM sales
GROUP BY region, quarter
union all
select region, null quarter, SUM(sales_amount) AS total_sales
FROM sales
group by region
union all
select null, null, sum(sales_amount) total_sales
FROM sales
order by 1,2,3 --제외하고 쿼리해본다.
;


WITH sales AS (
    SELECT 'North' AS region, 'Q1' AS quarter, 1000 AS sales_amount FROM dual UNION ALL
    SELECT 'North' AS region, 'Q2' AS quarter, 1500 AS sales_amount FROM dual UNION ALL
    SELECT 'North' AS region, 'Q3' AS quarter, 2000 AS sales_amount FROM dual UNION ALL
    SELECT 'North' AS region, 'Q4' AS quarter, 2500 AS sales_amount FROM dual UNION ALL
    SELECT 'South' AS region, 'Q1' AS quarter, 1200 AS sales_amount FROM dual UNION ALL
    SELECT 'South' AS region, 'Q2' AS quarter, 1300 AS sales_amount FROM dual UNION ALL
    SELECT 'South' AS region, 'Q3' AS quarter, 1700 AS sales_amount FROM dual UNION ALL
    SELECT 'South' AS region, 'Q4' AS quarter, 2100 AS sales_amount FROM dual
)
SELECT region, quarter, SUM(sales_amount) AS total_sales
FROM sales
GROUP BY cube(region, quarter);


WITH sales AS (
    SELECT 'Korea' nation, 'North' AS region, 'Q1' AS quarter, 1000 AS sales_amount FROM dual UNION ALL
    SELECT 'Korea' nation, 'North' AS region, 'Q2' AS quarter, 1500 AS sales_amount FROM dual UNION ALL
    SELECT 'Korea' nation, 'North' AS region, 'Q3' AS quarter, 2000 AS sales_amount FROM dual UNION ALL
    SELECT 'Korea' nation, 'North' AS region, 'Q4' AS quarter, 2500 AS sales_amount FROM dual UNION ALL
    SELECT 'Korea' nation, 'South' AS region, 'Q1' AS quarter, 1200 AS sales_amount FROM dual UNION ALL
    SELECT 'Korea' nation, 'South' AS region, 'Q2' AS quarter, 1300 AS sales_amount FROM dual UNION ALL
    SELECT 'Korea' nation, 'South' AS region, 'Q3' AS quarter, 1700 AS sales_amount FROM dual UNION ALL
    SELECT 'Korea' nation, 'South' AS region, 'Q4' AS quarter, 2100 AS sales_amount FROM dual
)
SELECT nation, region, quarter, SUM(sales_amount) AS total_sales
FROM sales
GROUP BY nation, region, quarter
order by nation, region, quarter
;