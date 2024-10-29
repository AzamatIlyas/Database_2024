create database library_db;
drop database library_db;

create table members(
    member_id integer unique ,
    member_name VARCHAR(100),
    city varchar(100),
    membership_level integer,
    librarian_id int references librarians(librarian_id)
);

create table borrowings(
    borrowing_id int unique ,
    borrow_date date,
    return_date date,
    member_id int references members(member_id),
    librarian_id int references librarians(librarian_id),
    book_id int
);

create table librarians(
    librarian_id int unique ,
    name varchar(100),
    city varchar(100),
    commission double precision
);
drop table librarians;
drop table members;
drop table borrowings;

INSERT INTO members (member_id, member_name, city, membership_level, librarian_id)
VALUES
(1001, 'John Doe', 'New York', 1, 2001),
(1002, 'Alice Johnson', 'California', 2, 2002),
(1003, 'Bob Smith', 'London', 1, 2003),
(1004, 'Sara Green', 'Paris', 3, 2004),
(1005, 'David Brown', 'New York', 1, 2001),
(1006, 'Emma White', 'Berlin', 2, 2005),
(1007, 'Olivia Black', 'Rome', 3, 2006);

INSERT INTO borrowings (borrowing_id, borrow_date, return_date, member_id, librarian_id, book_id)
VALUES
(30001, '2023-01-05', '2023-01-10', 1002, 2002, 5001),
(30002, '2022-07-10', '2022-07-17', 1003, 2003, 5002),
(30003, '2021-05-12', '2021-05-20', 1001, 2001, 5003),
(30004, '2020-04-08', '2020-04-15', 1006, 2005, 5004),
(30005, '2024-02-20', '2024-02-28', 1007, 2006, 5005), -- исправлено
(30006, '2023-06-02', '2023-06-12', 1005, 2001, 5001);


INSERT INTO librarians (librarian_id, name, city, commission)
VALUES
(2001, 'Michael Green', 'New York', 0.15),
(2002, 'Anna Blue', 'California', 0.13),
(2003, 'Chris Red', 'London', 0.12),
(2004, 'Emma Yellow', 'Paris', 0.14),
(2005, 'David Purple', 'Berlin', 0.12),
(2006, 'Laura Orange', 'Rome', 0.13);

--3
select count(*) as total_borrowings from borrowings where borrow_date between '2020-01-01' and '2024-12-31';

--4
select avg(membership_level) as average from members;

--5
select count(*) from members where city = 'New York';

--6
select min(borrow_date) as earliest_date from borrowings ;

--7
select member_name, city from members where member_name like '%n';

--8
select * from borrowings b join librarians l on b.librarian_id = l.librarian_id where l.city = 'Paris' and b.borrow_date between '2021-01-01' and '2023-12-31';

--9
select * from borrowings where borrow_date >= '2023-01-01';

--10
select member_id, COUNT(*) as total_borrowed_books from borrowings group by member_id;

--11
select * from members where membership_level = 3;

--12
select max(librarians.commission) as highest_commision from librarians;