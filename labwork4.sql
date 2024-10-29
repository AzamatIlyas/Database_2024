create database lab4;

create table Warehouses(
    code int ,
    location varchar(255),
    capacity integer
);

create table Packs(
    code varchar(4),
    contents varchar(255),
    value real,
    warehouses integer
);

INSERT INTO Warehouses(code, location, capacity) VALUES(1, 'Chicago', 3);
INSERT INTO Warehouses(code, location, capacity) VALUES(2, 'Rocks', 4);
INSERT INTO Warehouses(code, location, capacity) VALUES(3, 'New York', 7);
INSERT INTO Warehouses(code, location, capacity) VALUES(4, 'Los Angeles', 2);
INSERT INTO Warehouses(code, location, capacity) VALUES(5, 'San Francisko', 8);

INSERT INTO Packs(code, contents, value, warehouses) VALUES ('0MN7', 'Rocks', 180, 3);
INSERT INTO Packs(code, contents, value, warehouses) VALUES ('4H8P', 'Rocks', 250, 1);
INSERT INTO Packs(code, contents, value, warehouses) VALUES ('4RT3', 'Scissors', 190, 4);
INSERT INTO Packs(code, contents, value, warehouses) VALUES ('7G3H', 'Rocks', 200, 1);
INSERT INTO Packs(code, contents, value, warehouses) VALUES ('8JN6', 'Papers', 75, 1);
INSERT INTO Packs(code, contents, value, warehouses) VALUES ('8Y6U', 'Papers', 50, 3);
INSERT INTO Packs(code, contents, value, warehouses) VALUES ('9J6F', 'Papers', 175, 2);
INSERT INTO Packs(code, contents, value, warehouses) VALUES ('LL08', 'Rocks', 140, 4);
INSERT INTO Packs(code, contents, value, warehouses) VALUES ('P0H6', 'Scissors', 125, 1);
INSERT INTO Packs(code, contents, value, warehouses) VALUES ('P2T6', 'Scissors', 150, 2);
INSERT INTO Packs(code, contents, value, warehouses) VALUES ('TUSS', 'Papers', 90, 5);


--4
select * from Warehouses;

--5
select * from Packs where value>=150;

--6
select distinct contents from Packs;

--7
select warehouses,count(*) from Packs group by warehouses ;

--8
select warehouses,count(*) from Packs where value>=2 group by warehouses ;

--9
insert into Warehouses(code, location, capacity) values (6,'New York', 3);

--10
insert into Packs (code, contents, value, warehouses)
values ('H5RT','Papers',200,2);

--11
update Packs set value = value*0.85 where value = (select distinct value from Packs limit 1 offset 2);

--12
delete from Packs where value=150;

--13
delete from Packs where warehouses=(select code from Warehouses where location='New York' limit 1)
returning *;

drop table Warehouses;
drop table Packs;



















select distinct warehouses,count(*) from  Packs group by warehouses ;

delete from Packs where warehouses = (select code from Warehouses where location = 'New York' );
