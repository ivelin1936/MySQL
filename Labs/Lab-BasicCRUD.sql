*******************************************************************
******************** Exercises: Basic CRUD ************************
***************************** Lab *********************************

-- ----------------------------------------------------------------
-- Problem 1: Select Employee Information -------------------------

SELECT 
    `id`, `first_name`, `last_name`, `job_title`
FROM
    `employees`
ORDER BY `id` ASC;

-- ----------------------------------------------------------------
-- Problem 2: Select Employees with Filter ------------------------

SELECT 
    `id`,
    CONCAT(`first_name`, ' ', `last_name`) AS `full_name`,
    `job_title`,
    `salary`
FROM
    `employees`
WHERE
    `salary` > 1000
ORDER BY `id` ASC;

-- ----------------------------------------------------------------
-- Problem 3: Update Employees Salary -----------------------------

UPDATE `employees` 
SET 
    `salary` = `salary` * 1.1
WHERE
    `job_title` = 'Therapist';

SELECT 
    `salary`
FROM
    `employees`
ORDER BY `salary` ASC;

-- ----------------------------------------------------------------
-- Problem 4: Top Paid Employee -----------------------------------

SELECT 
    *
FROM
    `employees`
ORDER BY `salary` DESC
LIMIT 1;

-- ----------------------------------------------------------------
-- Problem 5: Select Employees by Multiple Filters ----------------

SELECT 
    *
FROM
    `employees` AS e
WHERE
    e.department_id = 4 AND e.salary >= 1600
ORDER BY e.id;

-- ----------------------------------------------------------------
-- Problem 6: Delete from Table -----------------------------------

DELETE FROM `employees` 
WHERE
    `employees`.`department_id` IN (2 , 1);

SELECT 
    *
FROM
    `employees`
ORDER BY `id` ASC;


























