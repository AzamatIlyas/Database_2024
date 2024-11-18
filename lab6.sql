create database lab_courses;

CREATE TABLE courses (
 course_id SERIAL PRIMARY KEY,
 course_name VARCHAR(50),
 course_code VARCHAR(10),
 credits INTEGER
);
CREATE TABLE professors (
 professor_id SERIAL PRIMARY KEY,
 first_name VARCHAR(50),
 last_name VARCHAR(50),
 department VARCHAR(50)
);
CREATE TABLE students (
 student_id SERIAL PRIMARY KEY,
 first_name VARCHAR(50),
 last_name VARCHAR(50),
 major VARCHAR(50),
 year_enrolled INTEGER
);
CREATE TABLE enrollments (
 enrollment_id SERIAL PRIMARY KEY,
 student_id INTEGER REFERENCES students,
 course_id INTEGER REFERENCES courses,
 professor_id INTEGER REFERENCES professors,
 enrollment_date DATE
);


INSERT INTO courses (course_name, course_code, credits)
VALUES
  ('Introduction to Computer Science', 'CS101', 4),
  ('Data Structures', 'CS201', 3),
  ('Database Systems', 'CS301', 3),
  ('Algorithms', 'CS401', 4),
  ('Operating Systems', 'CS501', 4);

INSERT INTO professors (first_name, last_name, department)
VALUES
  ('Alice', 'Johnson', 'Computer Science'),
  ('Bob', 'Smith', 'Computer Science'),
  ('Carol', 'Williams', 'Mathematics'),
  ('David', 'Taylor', 'Computer Science'),
  ('Eve', 'Anderson', 'Mathematics');

INSERT INTO students (first_name, last_name, major, year_enrolled)
VALUES
  ('John', 'Doe', 'Computer Science', 2020),
  ('Jane', 'Doe', 'Mathematics', 2021),
  ('Tom', 'Brown', 'Computer Science', 2019),
  ('Lucy', 'Green', 'Computer Science', 2020),
  ('Mark', 'Wilson', 'Mathematics', 2022);

INSERT INTO enrollments (student_id, course_id, professor_id, enrollment_date)
VALUES
  (1, 1, 1, '2024-09-01'),
  (2, 2, 2, '2024-09-01'),
  (3, 3, 1, '2024-09-02'),
  (4, 4, 2, '2024-09-03'),
  (5, 5, 3, '2024-09-04');

--3
select s.first_name, s.last_name, e.enrollment_id, p.last_name from enrollments e
    join students s on s.student_id = e.student_id
    join professors p on e.professor_id = p.professor_id;

--4
select first_name, last_name from students s
    join enrollments e on s.student_id = e.student_id
    join courses c on e.course_id = c.course_id
    where c.credits > 3;

select s.first_name, s.last_name from enrollments
    join courses c on enrollments.course_id = c.course_id
    join students s on enrollments.student_id = s.student_id
    where c.credits > 3;

--5
select course_name, count(*) from courses c
    join enrollments e on c.course_id = e.course_id
    group by course_name;



select c.course_name, count(*) from enrollments
    join courses c on c.course_id = enrollments.course_id
    group by c.course_name ;


--6
select p.first_name, p.last_name from professors p
    join enrollments e on p.professor_id = e.professor_id
    group by p.first_name, p.last_name having count(e.course_id) > 0;


select p.first_name, p.last_name from enrollments e
    join professors p on p.professor_id = e.professor_id
    group by p.first_name, p.last_name having count(e.course_id) > 0;


--7
select first_name, last_name from students s
    join enrollments e on s.student_id = e.student_id
    join courses c on c.course_id = e.course_id
    where c.course_name = 'Introduction to Computer Science';



select s.first_name, s.last_name from enrollments e
    join students s on s.student_id = e.student_id
    join courses c on e.course_id = c.course_id
    where c.course_name = 'Introduction to Computer Science';



--8
select c.course_name, p.last_name, sum(credits) as total_number from courses c
    join enrollments e on c.course_id = e.course_id
    join professors p on e.professor_id = p.professor_id
    where p.last_name LIKE 'S%'
    group by c.course_name,p.last_name ;



--9
select * from students
    join enrollments e on students.student_id = e.student_id
    where enrollment_date > '2022-01-01';

--10
select course_name from courses
    right join enrollments e on courses.course_id = e.course_id
    where e.course_id is null;










































select s.first_name, s.last_name from enrollments
    join students s on s.student_id = enrollments.student_id
    join courses c on enrollments.course_id = c.course_id
    where c.credits > 3;