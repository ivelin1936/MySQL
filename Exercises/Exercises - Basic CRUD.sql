********************** Exercises: Basic CRUD ***************************
************************************************************************

-- Part I – Queries for SoftUni Database -------------------------------

USE soft_uni;

-- 1.	Find All Information About Departments -------------------------

SELECT 
    *
FROM
    `departments`
ORDER BY `department_id` ASC;

-- 2.	Find all Department Names --------------------------------------

SELECT 
    d.name
FROM
    `departments` AS d
ORDER BY d.department_id ASC; 

-- 3.	Find salary of Each Employee -----------------------------------

SELECT 
    e.first_name, e.last_name, e.salary
FROM
    `employees` AS e
ORDER BY e.employee_id ASC;

-- 4.	Find Full Name of Each Employee ---------------------------------

SELECT 
    e.first_name, e.middle_name, e.last_name
FROM
    `employees` AS e
ORDER BY e.employee_id ASC;

-- 5.	Find Email Address of Each Employee -----------------------------

SELECT 
    CONCAT(e.first_name,
            '.',
            e.last_name,
            '@softuni.bg') AS `full_email_address`
FROM
    `employees` AS e;

-- 6.	Find All Different Employee’s Salaries --------------------------

SELECT DISTINCT
    e.salary
FROM
    `employees` AS e
ORDER BY e.employee_id ASC;

-- 7.	Find all Information About Employees ----------------------------

SELECT 
    *
FROM
    `employees` AS e
WHERE
    e.job_title = 'Sales Representative'
ORDER BY e.employee_id ASC;

-- 8.	Find Names of All Employees by salary in Range ------------------

SELECT 
    e.first_name, e.last_name, e.job_title
FROM
    `employees` AS e
WHERE
    e.salary BETWEEN 20000 AND 30000
ORDER BY e.employee_id ASC;

-- 9.	 Find Names of All Employees ------------------------------------

SELECT 
    CONCAT_WS(' ',
            e.first_name,
            e.middle_name,
            e.last_name) AS `full_name`
FROM
    `employees` AS e
WHERE
    e.salary IN (25000 , 14000, 12500, 23600);

-- 10.	Find All Employees Without Manager ------------------------------

SELECT 
    e.first_name, e.last_name
FROM
    `employees` AS e
WHERE
    e.manager_id IS NULL;

-- 11.	Find All Employees with salary More Than 50000 ------------------

SELECT 
    e.first_name, e.last_name, e.salary
FROM
    `employees` AS e
WHERE
    e.salary > 50000
ORDER BY e.salary DESC;

-- 12.	Find 5 Best Paid Employees --------------------------------------

SELECT 
    e.first_name, e.last_name
FROM
    `employees` AS e
ORDER BY e.salary DESC
LIMIT 5;

-- 13.	Find All Employees Except Marketing -----------------------------

SELECT 
    e.first_name, e.last_name
FROM
    `employees` AS e
WHERE
    e.department_id != 4;

-- 14.	Sort Employees Table --------------------------------------------

SELECT 
    *
FROM
    `employees` AS e
ORDER BY e.salary DESC , e.first_name , e.last_name DESC , e.middle_name;

-- 15.	Create View Employees with Salaries -----------------------------

CREATE VIEW `v_employees_salaries` AS
    SELECT 
        e.first_name, e.last_name, e.salary
    FROM
        `employees` AS e;

-- 16.	Create View Employees with Job Titles ---------------------------

CREATE VIEW `v_employees_job_titles` AS
    SELECT 
        CONCAT_WS(' ',
                e.first_name,
                COALESCE(e.middle_name, ''),
                e.last_name) AS `full_name`,
        e.job_title
    FROM
        `employees` AS e;

-- 17. Distinct Job Titles ----------------------------------------------

SELECT DISTINCT
    e.job_title
FROM
    `employees` AS e;

-- 18.	Find First 10 Started Projects ----------------------------------

SELECT 
    *
FROM
    `projects` AS p
ORDER BY p.start_date ASC , p.name ASC , p.project_id
LIMIT 10;

-- 19.	 Last 7 Hired Employees -----------------------------------------

SELECT 
    e.first_name, e.last_name, e.hire_date
FROM
    `employees` AS e
ORDER BY e.hire_date DESC
LIMIT 7;

-- 20.	Increase Salaries -----------------------------------------------

UPDATE `employees` AS e 
SET 
    e.salary = e.salary * 1.12
WHERE
    e.department_id IN (1 , 2, 4, 11);

SELECT 
    `salary`
FROM
    `employees`;

-- Part II – Queries for Geography Database -----------------------------

USE `geography`;

-- 21.	 All Mountain Peaks ---------------------------------------------

SELECT 
    p.peak_name
FROM
    `peaks` AS p
ORDER BY p.peak_name ASC;

-- 22. Biggest Countries by Population ----------------------------------

SELECT 
    c.country_name, c.population
FROM
    `countries` AS c
WHERE
    c.continent_code = 'EU'
ORDER BY c.population DESC , c.country_name ASC
LIMIT 30;

-- 23. Countries and Currency (Euro / Not Euro) -------------------------

SELECT 
    c.country_name,
    c.country_code,
    (CASE
        WHEN c.currency_code = 'EUR' THEN 'Euro'
        ELSE 'Not Euro'
    END) AS `currency`
FROM
    `countries` AS c
ORDER BY c.country_name ASC;

-- Part III – Queries for Diablo Database -------------------------------

USE `diablo`;

-- 24.	 All Diablo Characters ------------------------------------------

SELECT 
    `characters`.`name`
FROM
    `characters`
ORDER BY `characters`.`name` ASC;

-- ----------------------------------------------------------------------
