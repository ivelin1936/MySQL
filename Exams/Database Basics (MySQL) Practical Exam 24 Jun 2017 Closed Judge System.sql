-- **************** Database Basics (MySQL) Practical Exam ********************
-- ************************** Closed Judge System *****************************

CREATE DATABASE `closed_judge_system`;
USE `closed_judge_system`;

-- Section 1: Data Definition Language (DDL) – 40 pts -------------------------
-- 01.Table Design ------------------------------------------------------------

CREATE TABLE `users`(
`id` INT(11) NOT NULL PRIMARY KEY,
`username` VARCHAR(30) NOT NULL UNIQUE,
`password` VARCHAR(30) NOT NULL, 
`email` VARCHAR(50)
);

CREATE TABLE `categories`(
`id` INT(11) NOT NULL PRIMARY KEY,
`name` VARCHAR(50) NOT NULL,
`parent_id` INT(11),
CONSTRAINT fk_categories FOREIGN KEY (parent_id) REFERENCES `categories` (id)
);

CREATE TABLE `contests`(
`id` INT(11) NOT NULL PRIMARY KEY,
`name` VARCHAR(50) NOT NULL,
`category_id` INT(11),
CONSTRAINT fk_contests_categories FOREIGN KEY (category_id) REFERENCES `categories` (id)
);

CREATE TABLE `problems`(
`id` INT(11) NOT NULL PRIMARY KEY,
`name` VARCHAR(100) NOT NULL,
`points` INT(11) NOT NULL,
`tests` INT(11) DEFAULT 0,
`contest_id` INT(11),
CONSTRAINT fk_problems_contests FOREIGN KEY (contest_id) REFERENCES `contests` (id)
);

CREATE TABLE `submissions`(
`id` INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`passed_tests` INT(11) NOT NULL,
`problem_id` INT(11),
`user_id` INT(11),
CONSTRAINT fk_submissions_problems FOREIGN KEY (problem_id) REFERENCES `problems` (id),
CONSTRAINT fk_submissions_users FOREIGN KEY (user_id) REFERENCES `users` (id)
); 

CREATE TABLE `users_contests`(
`user_id` INT(11), 
`contest_id` INT(11),
CONSTRAINT PRIMARY KEY (user_id, contest_id),
CONSTRAINT fk_users FOREIGN KEY (user_id) REFERENCES `users` (id),
CONSTRAINT fk_contests FOREIGN KEY (contest_id) REFERENCES `contests` (id)
);

-- Section 2: Data Manipulation Language (DML) – 30 pts -----------------------

INSERT INTO users (id, username, password, email) 
VALUES
(1,'density','asteriks19','default@gmail.com'),
(2,'arien','blazeit','arienneir@yahoo.co.uk'),
(3,'booster','karuusel','booster@abv.bg'),
(4,'query','ex-deus132','ivan@abv.bg'),
(5,'andrew','karuusel','andrew@gmail.com'),
(6,'kinoa','microsecondislove','nokia@gmail.com'),
(7, 'QuandoImmersia', 'breadfish', 'denisbig@yahoo.com'),
(8, 'Miracle', 'deniedvelocity', 'miracle@outlook.com'),
(9, 'Syndaxo', 'ytrewq', 'syndaxo@gmail.com'),
(10, 'ICanHazDonuts', 'donuts4l1f3', 'peter@outlook.com'),
(11, 'Mephisto', 'thedevilincoat', 'lucy@gmail.com'),
(12, 'Emir', 'mirandaismylove', 'rime@abv.bg'),
(13, 'Ivan', 'putin4king', 'suka@wocsom.ru'),
(14, 'Tiffany', 'chalgamadafaka', 'geri@nikol.bg'),
(15, 'Oleg', 'putin4king', 'blyat@wocsom.ru'),
(16, 'Gruesome', 'asteriks19', 'denial@gmail.com'),
(17, 'Billy', '2good4you', 'billmurry@gmail.com'),
(18, 'DaRighteous1', 'tonimotori', 'toniatanasoff@gmail.com'),
(19, 'Syncy', 'SymmetryIsTheNewChaos', 'SallyIsacc@yahoo.co.uk'),
(20, 'Reine', 'whatisthemeaningoflie', 'reine@gmail.com'),
(21, 'SecretAgent', 'fbi@gmail.com', 'boundary@sofiamemes.abv.bg'),
(22, 'micro', 'breadfish', 'micro@gmail.com'),
(23, 'Mellanie', 'babyyouaremine', 'mellanie@yahoo.co.uk'),
(24, 'A4Tech', 'mousespls', 'damian@abv.bg'),
(25, 'JohnWick', 'touchmypuppyandyoudie', 'johnny@gmail.com'),
(26, 'SeriousSam', 'putin4king', 'samuel@wocsom.ru'),
(27, 'doge', 'doge', 'doge@doge.doge'),
(28, 'cate', 'cate', 'cate@cate.cate'),
(29, 'BabyYouAreMine', 'Blasphemy', 'munich@gmail.com'),
(30, 'Antena', 'seismicity', 'anderson@gmail.com');

INSERT INTO categories (id, name, parent_id)
VALUES
(1, 'JavaScript Development', NULL),
(2, 'C# Development', NULL),
(3, 'JavaScript Basics', 1),
(4, 'JavaScript Advanced', 1),
(5, 'Java Development', NULL),
(6, 'C# Fundamentals', 2),
(7, 'Java DB Fundamentals', 5),
(8, 'Java DB Basics', 7),
(9, 'C# OOP Basics', 6),
(10, 'Java DB Advanced', 7),
(11, 'JavaScript Applications', 1),
(12, 'C# OOP Advanced', 6),
(13, 'Java Fundamentals', 5),
(14, 'PHP Development', NULL),
(15, 'C# Advanced', 6),
(16, 'PHP Fundamentals', 14),
(17, 'PHP Web', 14),
(18, 'JavaScript Web', 1),
(19, 'C# DB Fundamentals', 2),
(20, 'C# Web', 2);

INSERT INTO contests (id, name, category_id)
VALUES
(1, 'JS Exercises', 15),
(2, 'Some Exam', 4),
(3, 'Contest Number 9', 10),
(4, 'Mambo Number 5', 4),
(5, 'C# OOP Exercises', 12),
(6, 'JS Lab', 3),
(7, 'JS Lab 2', 3),
(8, 'What is This', 10),
(9, 'I dunno', 15),
(10, 'Chicken Nuggets', 12),
(11, 'Algorithms Exam', 11),
(12, 'Exam That is Hard', 13),
(13, 'Test Contest', 9),
(14, 'Hello Contest World', 3),
(15, 'MySQL Exam 24-Jun-2017', 8),
(16, 'This will be fun', 15),
(17, 'Oh Im sure', 11),
(18, 'I dont know what to write anymore', 4),
(19, 'Sample Contest', 8),
(20, 'Exams Are Hard', 9),
(21, 'Making a Dataset is even Harder', 8),
(22, 'When you are comming up with tha data', 3),
(23, 'Yourself', 12),
(24, 'I am done', 10),
(25, 'Okey just a few more', 10),
(26, 'Exam Contest 24-June-3017', 13),
(27, 'Is it the end yet?', 3),
(28, 'Exam 10-Jul-2017', 9),
(29, 'Bam Bam', 4),
(30, 'Khaalesi Dies', 13);

INSERT INTO problems (id, name, points, tests, contest_id)
VALUES
(1, 'NeedForSpeed', 100, 5, 5),
(2, 'Matrix Shuffle', 25, 10, 13),
(3, 'Watermelon', 150, 7, 24),
(4, 'Vegetable Ninja', 49, 8, 30),
(5, 'Largest Rectangle', 200, 99, 9),
(6, 'Airport Management System', 30, 5, 16),
(7, 'Users In Countries', 350, 0, 21),
(8, 'House', 400, 20, 29),
(9, 'Monsters', 1000, 25, 17),
(10, 'Mass Effect', 500, 10, 4),
(11, 'Mass Defect', 300, 10, 11),
(12, 'Lambda Core', 100, 1, 6),
(13, 'Restaurant', 200, 2, 10),
(14, 'Weekday Madness', 150, 3, 5),
(15, 'Usernames', 10, 10, 3),
(16, 'Default Value', 5, 5, 2),
(17, 'Dict-Ref', 10, 0, 24),
(18, 'Cubic Artillery', 25, 20, 25),
(19, 'Royalism', 30, 35, 12),
(20, 'Second Nature', 100, 4, 16),
(21, 'H.E.L.L.', 400, 1, 21),
(22, 'Emergency', 50, 50, 22),
(23, 'Dict-Ref Advanced', 100, 20, 13),
(24, 'Phone', 40, 25, 25),
(25, 'Winecraft', 80, 99, 4),
(26, 'Sound Of Silence', 20, 10, 30),
(27, 'Blasphemy', 30, 25, 29),
(28, 'Jeremy', 10, 10, 30),
(29, 'Football', 5, 25, 1),
(30, 'BitsofBits', 2, 30, 2),
(31, 'NumbersToHex', 100, 29, 18),
(32, 'Binary Search', 1000, 10, 1),
(33, 'Designed To Crash', 450, 15, 7),
(34, 'Bugs', 200, 9, 2),
(35, 'Hornet Assault', 30, 10, 19),
(36, 'Cubic\'s Rube', 100, 0, 3),
(37, 'Major Payne', 25, 99, 2),
(38, 'Borrowed Time', 300, 7, 7),
(39, 'Bear Wear', 25, 6, 7),
(40, 'Merry\'s games', 400, 10, 7),
(41, 'Roli The Coder', 50, 25, 30),
(42, 'Something', 200, 30, 13),
(43, 'Test Problem', 10, 99, 14),
(44, 'Hornet Armada', 200, 45, 29),
(45, 'Royal NonStop', 30, 9, 27),
(46, 'Sanity\'s Eclipse', 400, 5, 3),
(47, 'Indestructible', 50, 1, 14),
(48, 'Word Boundary', 100, 1, 19),
(49, 'Sentence Split', 1000, 2, 18),
(50, 'Closed Judge System', 10000, 100, 30);

INSERT INTO submissions (id, passed_tests, problem_id, user_id)
VALUES
(1, 2, 22, 7),(2, 13, 32, 22),(3, 0, 24, 25),(4, 19, 46, 2),(5, 10, 17, 12),
(6, 10, 21, 8),(7, 21, 48, 17),(8, 7, 13, 2),(9, 0, 20, 26),(10, 19, 8, 21),
(11, 19, 7, 25),(12, 9, 19, 22),(13, 19, 1, 23),(14, 20, 13, 17),(15, 21, 40, 29),
(16, 10, 47, 10),(17, 6, 45, 16),(18, 9, 44, 17),(19, 10, 11, 5),(20, 0, 4, 7),
(21, 2, 44, 9),(22, 91, 43, 23),(23, 20, 48, 20),(24, 10, 20, 15),(25, 22, 34, 1),
(26, 7, 22, 3),(27, 15, 22, 16),(28, 16, 12, 5),(29, 24, 12, 7),(30, 14, 7, 17),
(31, 0, 46, 16),(32, 0, 19, 8),(33, 14, 47, 5),(34, 99, 5, 12),(35, 14, 6, 16),
(36, 10, 44, 3),(37, 25, 36, 5),(38, 15, 39, 10),(39, 15, 3, 27),(40, 9, 26, 29),
(41, 13, 40, 3),(42, 7, 24, 28),(43, 5, 15, 22),(44, 66, 25, 27),(45, 9, 8, 27),
(46, 19, 3, 27),(47, 23, 17, 21),(48, 26, 42, 7),(49, 0, 37, 20),(50, 22, 41, 16),
(51, 11, 32, 3),(52, 100, 50, 30),(53, 13, 29, 5),(54, 7, 19, 3),(55, 13, 4, 14),
(56, 21, 8, 14),(57, 82, 43, 13),(58, 12, 15, 28),(59, 11, 20, 15),(60, 19, 32, 9),
(61, 5, 18, 28),(62, 13, 41, 6),(63, 0, 21, 27),(64, 18, 17, 16),(65, 16, 15, 22),
(66, 11, 8, 14),(67, 97, 25, 14),(68, 7, 4, 25),(69, 12, 40, 18),(70, 16, 46, 3),
(71, 17, 26, 7),(72, 0, 36, 7),(73, 13, 31, 6),(74, 11, 3, 26),(75, 0, 6, 7),
(76, 17, 49, 5),(77, 23, 11, 19),(78, 9, 7, 24),(79, 16, 20, 26),(80, 9, 41, 12),
(81, 6, 10, 29),(82, 11, 47, 10),(83, 9, 22, 10),(84, 4, 17, 25),(85, 14, 47, 12),
(86, 16, 26, 28),(87, 14, 6, 24),(88, 0, 29, 20),(89, 87, 25, 12),(90, 17, 16, 12),
(91, 11, 40, 23),(92, 3, 42, 26),(93, 9, 8, 7),(94, 8, 27, 5),(95, 20, 44, 4),
(96, 16, 10, 12),(97, 22, 44, 27),(98, 18, 34, 18),(99, 0, 31, 9),(100, 10, 22, 18);

INSERT INTO users_contests (user_id, contest_id)
VALUES
(22, 10),(8, 21),(12, 20),(20, 6),(26, 1),(15, 21),(14, 8),(26, 10),(19, 23),
(29, 13),(20, 24),(29, 11),(27, 26),(25, 8),(5, 1),(29, 6),(4, 25),(21, 8),
(15, 15),(17, 18),(13, 24),(3, 22),(15, 10),(7, 2),(9, 4),(20, 10),(3, 19),
(14, 28),(12, 27),(25, 17),(25, 13),(2, 25),(2, 10),(17, 20),(17, 19),(26, 4),
(6, 12),(30, 26),(22, 8),(27, 17),(29, 1),(12, 19),(3, 16),(12, 24),(27, 18),
(21, 1),(23, 1),(23, 9),(20, 5),(24, 17),(16, 21),(9, 17),(5, 22),(20, 18),
(6, 4),(1, 8),(28, 2),(15, 1),(13, 14),(9, 24),(23, 8),(13, 6),(19, 30),(4, 13),
(19, 22),(24, 3),(8, 8),(23, 26),(15, 12),(26, 24),(18, 23),(18, 13),(3, 21),
(16, 22),(27, 6),(28, 22),(9, 23),(29, 2),(4, 30),(3, 20),(14, 23),(16, 9),(15, 26),
(24, 7),(29, 26),(6, 15),(6, 30),(20, 30),(3, 28),(14, 13),(17, 13),(25, 2),
(24, 16),(10, 22),(23, 16),(10, 7),(10, 25),(7, 10),(29, 8),(27, 10);

-- 02.Data Insertion From SELECT ----------------------------------------------
-- ----------------------------------------------------------------------------

INSERT INTO `submissions` (`passed_tests`, `problem_id`, `user_id`)
SELECT 
		CEIL(SQRT(POWER(CHAR_LENGTH(p.name), 3)) - CHAR_LENGTH(p.name)),
		p.id,
        CEIL(p.id * 3 / 2)
	FROM `problems` AS p
    WHERE p.id BETWEEN 1 AND 10;

-- 03.Data Update -------------------------------------------------------------
-- ----------------------------------------------------------------------------

UPDATE `problems` AS p
JOIN `contests` AS c ON c.id = p.contest_id
JOIN `categories` AS ca ON ca.id = c.category_id
SET p.tests = 
    CASE p.id % 3
		WHEN 0 THEN CHAR_LENGTH(c.name)
        WHEN 1 THEN ( SELECT SUM(s.id) 
					  FROM `submissions` AS s
                      WHERE s.problem_id = p.id )
        WHEN 2 THEN CHAR_LENGTH(c.name)
	END
WHERE p.tests = 0;

-- 04.Date Deletion -----------------------------------------------------------
-- ----------------------------------------------------------------------------

DELETE u FROM `users` AS u
        LEFT JOIN
    `users_contests` AS uc ON uc.user_id = u.id 
WHERE
    uc.user_id IS NULL;

-- Section 3: Querying – 100 pts ----------------------------------------------
-- 05.Users -------------------------------------------------------------------
-- ----------------------------------------------------------------------------

SELECT 
    u.id, u.username, u.email
FROM
    `users` AS u
ORDER BY u.id ASC;

-- 06.Root Categories ---------------------------------------------------------
-- ----------------------------------------------------------------------------

SELECT 
    c.id, c.name
FROM
    `categories` AS c
WHERE
    c.parent_id IS NULL
ORDER BY c.id ASC;

-- 07.Well Tested Problems ----------------------------------------------------
-- ----------------------------------------------------------------------------

SELECT 
    p.id, p.name, p.tests
FROM
    `problems` AS p
WHERE
    p.tests > p.points AND p.name LIKE '% %'
ORDER BY p.id DESC;

-- 08.Full Path Problems ------------------------------------------------------
-- ----------------------------------------------------------------------------

SELECT 
    p.id,
    CONCAT_WS(' - ', c.name, co.name, p.name) AS 'full_path'
FROM
    `categories` AS c
        JOIN
    `contests` AS co ON co.category_id = c.id
        JOIN
    `problems` AS p ON p.contest_id = co.id
ORDER BY p.id ASC;

-- 09.Leaf Categories ---------------------------------------------------------
-- ----------------------------------------------------------------------------

SELECT 
    c.id, c.name
FROM
    `categories` AS c
        LEFT JOIN
    `categories` AS ca ON ca.parent_id = c.id
WHERE
    ca.id IS NULL
ORDER BY c.name ASC , c.id ASC; 

-- 10.Mainstream Passwords ----------------------------------------------------
-- ----------------------------------------------------------------------------

SELECT 
    u.id, u.username, u.password
FROM
    `users` AS u
WHERE
    u.password IN (SELECT 
            `password`
        FROM
            `users`
        WHERE
            id <> u.id)
ORDER BY u.username ASC , u.id ASC;

-- 11.Most Participated Contests ----------------------------------------------
-- ----------------------------------------------------------------------------

SELECT 
    cc.id, cc.name, cc.contestants
FROM
    (SELECT 
        c.id, c.name, COUNT(uc.user_id) AS 'contestants'
    FROM
        `contests` AS c
    LEFT JOIN `users_contests` AS uc ON uc.contest_id = c.id
    GROUP BY c.id , c.name
    ORDER BY contestants DESC , c.id ASC
    LIMIT 5) AS cc
ORDER BY cc.contestants ASC , cc.id ASC;

-- 12.Most Valuable Person ----------------------------------------------------
-- ----------------------------------------------------------------------------

SELECT 
    s.id,
    u.username,
    p.name,
    CONCAT_WS(' / ', s.passed_tests, p.tests) AS result
FROM
	( SELECT 
    user_id AS 'mvp', 
    COUNT(contest_id) AS 'count' 
    FROM `users_contests`
    GROUP BY `mvp`
    ORDER BY `count` DESC
    LIMIT 1
    ) AS `mvp_table`
		JOIN
    `users` AS u ON u.id = mvp_table.mvp
		JOIN 
	`submissions` AS s ON s.user_id = mvp_table.mvp
        JOIN
    `problems` AS p ON p.id = s.problem_id
ORDER BY s.id DESC;

-- 13.Contests Maximum Points -------------------------------------------------
-- ----------------------------------------------------------------------------

SELECT 
    c.id, c.name, SUM(p.points) AS 'maximum_points'
FROM
    `contests` AS c
        JOIN
    `problems` AS p ON p.contest_id = c.id
GROUP BY c.id , c.name
ORDER BY maximum_points DESC , c.id ASC;

-- 14.Contestants’ Submissions ------------------------------------------------
-- ----------------------------------------------------------------------------

SELECT 
    c.id, c.name, COUNT(s.id) AS 'submissions'
FROM
    `submissions` AS s
        JOIN
    `problems` AS p ON p.id = s.problem_id
        JOIN
    `contests` AS c ON c.id = p.contest_id
WHERE
    s.user_id IN (SELECT 
					usc.user_id
				FROM
					`users_contests` AS usc
				WHERE
					c.id = usc.contest_id)
GROUP BY c.id , c.name
ORDER BY submissions DESC , c.id ASC;

-- Section 4: Programmability – 30 pts ----------------------------------------

CREATE TABLE logged_in_users (
	id INT,
    username VARCHAR(30) NOT NULL UNIQUE,
    password VARCHAR(30) NOT NULL,
    email VARCHAR(50),
    CONSTRAINT pk_logged_in_users PRIMARY KEY (id)
);

CREATE TABLE evaluated_submissions (
	id INT AUTO_INCREMENT,
    problem VARCHAR(100) NOT NULL,
    user VARCHAR(30) NOT NULL,
    result INT NOT NULL,
    CONSTRAINT pk_evaluated_submissions PRIMARY KEY (id)
);

-- 15.Login -------------------------------------------------------------------
-- ----------------------------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE udp_login(`username` VARCHAR(30), `password` VARCHAR(30))
BEGIN
	IF `username` NOT IN (SELECT u.username FROM `users` AS u)
		THEN 
			SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Username does not exist!';
	ELSEIF `password` <> (SELECT u.password FROM `users` AS u 
							WHERE u.username = `username`)
		THEN 
			SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Password is incorrect!';
	ELSEIF `username` IN (SELECT lu.username FROM `logged_in_users` AS lu)
		THEN 
			SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'User is already logged in!';
	ELSE 
		INSERT INTO `logged_in_users`(`id`, `username`, `password`, `email`)
        SELECT 
			`id`, `username`, `password`, `email`
		FROM `users` AS u 
        WHERE u.username = `username`;
	END IF;
END $$
DELIMITER ;

-- 16.Evaluate Submission -----------------------------------------------------
-- ----------------------------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE udp_evaluate(`id` INT(11))
BEGIN
	IF `id` NOT IN (SELECT`id` FROM `submissions`)
		THEN
			SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Submission does not exist!';
	ELSE 
		INSERT INTO `evaluated_submissions`
        SELECT 
			s.id,
			p.name, 
            u.username,
            CEIL(p.points / p.tests * s.passed_tests) AS 'result'
        FROM `submissions` AS s
        JOIN `problems` AS p ON s.problem_id = p.id
        JOIN `users` AS u ON s.user_id = u.id
        WHERE s.id = `id`;
    END IF;
END $$
DELIMITER ;

-- Section 5: Bonus – 20 pts --------------------------------------------------
-- 17.	Check Constraint ------------------------------------------------------
-- ----------------------------------------------------------------------------

DELIMITER $$
CREATE TRIGGER tr_check_constraint
BEFORE INSERT
ON `problems` 
FOR EACH ROW
BEGIN
	IF NEW.name NOT LIKE '% %'
		THEN 
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'The given name is invalid!';
	ELSEIF NEW.points <= 0
		THEN 
			SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'The problem’s points cannot be less or equal to 0!';
	ELSEIF NEW.tests <= 0
		THEN
			SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'The problem’s tests cannot be less or equal to 0!';
	END IF;
END $$
DELIMITER ;

-- ----------------------------------------------------------------------------





























