CREATE DATABASE COLLEGE;
USE COLLEGE;

CREATE TABLE student (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    course VARCHAR(50)
);

INSERT INTO student (name, age, course)
VALUES
('GIREESH', 18, 'AIML'),
('JUNNU', 19, 'AIML');

SELECT * FROM student;

ALTER TABLE student
ADD email VARCHAR(100);

ALTER TABLE student
MODIFY age SMALLINT;

ALTER TABLE student
ADD dob DATE;

INSERT INTO student (name, age, course, email)
VALUES
('GIREESH', 18, 'AIML', 'jogigireesh962@gmail.com');

UPDATE student
SET email = 'jogigireesh962@gmail.com'
WHERE id = 3;

INSERT INTO student (name, age, course)
VALUES
('JUNNU', 19, 'AIML');

SELECT * FROM student;