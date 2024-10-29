create database lab3;

-- 2. Create table for Students
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    email VARCHAR(100) UNIQUE,
    city VARCHAR(50)
);

-- 3. Create table for Courses
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_code VARCHAR(10) UNIQUE,
    course_name VARCHAR(100),
    credits INT
);

-- 4. Create table for Registration (link between students and courses)
CREATE TABLE registration (
    registration_id SERIAL PRIMARY KEY,
    student_id INT,
    course_id INT,
    registration_date DATE,
    grade VARCHAR(2),
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);

-- 5. Insert sample data into students table
INSERT INTO students (first_name, last_name, date_of_birth, email, city) VALUES
('Alice', 'Johnson', '2001-05-14', 'alice.johnson@example.com', 'Almaty'),
('Bob', 'Smith', '2000-09-20', 'bob.smith@example.com', 'New York'),
('Cathy', 'Williams', '2002-01-10', 'cathy.williams@example.com', 'Almaty'),
('David', 'Brown', '1999-03-22', 'david.brown@example.com', 'Los Angeles');

-- 6. Insert sample data into courses table
INSERT INTO courses (course_code, course_name, credits) VALUES
('CS101', 'Introduction to Computer Science', 4),
('MATH201', 'Calculus I', 3),
('PHYS301', 'General Physics', 3),
('HIST101', 'World History', 2);

-- 7. Insert sample data into registration table
INSERT INTO registration (student_id, course_id, registration_date, grade) VALUES
(1, 1, '2023-09-01', NULL),  -- Alice registered for CS101
(2, 2, '2023-09-01', NULL),  -- Bob registered for MATH201
(3, 3, '2023-09-01', NULL),  -- Cathy registered for PHYS301
(4, 1, '2023-09-01', NULL),  -- David registered for CS101
(1, 4, '2023-09-01', NULL);  -- Alice registered for HIST101


--3
select last_name from students;

--4
select distinct last_name from students;

--5
select * from students where last_name='Johnson';

--6
select * from students where last_name='Johnson' or last_name='Smith';

--7
SELECT s.*
FROM students s
JOIN registration r ON s.student_id = r.student_id
JOIN courses c ON r.course_id = c.course_id
WHERE c.course_code = 'CS101';

--8
SELECT s.*
FROM students s
JOIN registration r ON s.student_id = r.student_id
JOIN courses c ON r.course_id = c.course_id
WHERE c.course_code = 'MATH201' or c.course_code = 'PHYS301';

--9
select sum(credits) as total_credits from courses;

--10
select r.course_id,count(*) from registration r group by r.course_id ;

--11
select r.course_id from registration r group by r.course_id having count(*)>=2;

--12
select course_name from courses order by credits desc limit 1 offset 1;

--13
select s.first_name,s.last_name from students s
    join registration r on s.student_id = r.student_id
    join courses c on c.course_id = r.course_id
    where c.credits = (select min(credits) from courses);

--14
select students.first_name,students.last_name from students where city = 'Almaty';

--15
select * from courses where credits>=3 order by credits asc , course_id desc ;

--16
update courses set credits = credits+1 where credits = (select credits from courses order by credits asc limit 1);

--17
update registration
    set course_id = (select course_id from courses where course_code = 'CS101')
    where course_id = (select course_id from courses where course_code = 'MATH201');

--18
DELETE FROM students
WHERE student_id IN (
    SELECT r.student_id
    FROM registration r
    JOIN courses c ON r.course_id = c.course_id
    WHERE c.course_code = 'CS101'
);

--19
delete from students;
delete from registration;
delete from courses;








































select * from courses where credits>=3 order by credits asc, course_id desc;