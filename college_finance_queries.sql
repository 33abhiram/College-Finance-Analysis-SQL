# This is my SQL code, written in MySQL Workbench, that I used to create queries and create my 'College Finance Dashboard' in Tableau.

# Total spent in the year
Select sum(amount) total_spent from college_expenses;

# Total spending by semester
SELECT 
    year, ROUND(SUM(amount), 2) AS total_spent
FROM
    college_expenses
GROUP BY year;

# Total spending by month
SELECT 
    CASE
        WHEN year = 2022 THEN 'Fall'
        ELSE 'Spring'
    END AS semester,
    month,
    ROUND(SUM(amount), 2) AS monthly_spending
FROM
    college_expenses
GROUP BY semester , month;

# Spending by Category
SELECT 
    category, ROUND(SUM(amount), 2) AS total_spent
FROM
    college_expenses
GROUP BY category;

# Average monthly spending over the year
SELECT 
    AVG(monthly_spending) AS average_monthly_spending
FROM
    (SELECT 
        month, ROUND(SUM(amount), 2) AS monthly_spending
    FROM
        college_expenses
    GROUP BY month) AS monthly_expenses;
    
select * from college_expenses;