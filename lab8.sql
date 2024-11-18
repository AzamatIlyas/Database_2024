create table members(
    member_id integer unique ,
    member_name VARCHAR(100),
    city varchar(100),
    membership_level integer,
    librarian_id int references librarians(librarian_id)
);
drop table members;

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
create view librrians_city as select * from librarians where city = 'New York' with local check option ;
select * from librrians_city;

--4
create view borrowing_records as select b.borrowing_id, m.member_name, l.name as librarian_name, b.borrow_date, b.return_date
from borrowings b
    join members m on b.member_id = m.member_id
    join librarians l on l.librarian_id = b.librarian_id;
select * from borrowing_records;
create role library_user with login ;
grant select on borrowing_records to library_user;

--5
create view membership_level_view as select * from members
    where membership_level = (select max(membership_level) from members) with local check option ;
select * from membership_level_view;
grant select on membership_level_view to library_user;

--6
create view librarians_city as select l.city,count(city) as count_of_city from librarians l group by l.city ;
select * from librarians_city;

--7
create view relationship_view as select l.name, m.member_name, count(b.librarian_id) as count_of_librarian_members
    from borrowings b
    join librarians l on l.librarian_id = b.librarian_id
    join public.members m on b.librarian_id = m.librarian_id
    group by l.name, m.member_name ;
select * from relationship_view;

--8
create role intern;
grant library_user to intern;




























--6
create view library_city9 as select city, count(city) from librarians group by city ;
select * from library_city9;












