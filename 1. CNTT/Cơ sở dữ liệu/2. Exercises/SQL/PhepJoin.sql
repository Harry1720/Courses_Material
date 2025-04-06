create table R1
(
	A int,
	B int
)
drop table R1

insert into R1
values
	(1,2),
	(3,4),
	(1,3),
	(2,2),
	(2,3);
select * from R1
delete from R1

create table R2
(
	B int,
	C int
)
insert into R2
values
	(2,3),
	(5,6);
select * from R2
delete from R2

create table R3
(
	C int,
	D int
)
insert into R3
values
	(3,7),
	(8,9);
select * from R3
delete from R3

--R1 kết tự nhiên R2
--Cách 1:
select * from R1, R2
where R1.B = R2.B

--Cách 2: (Recommend)
select * from R1 inner join R2 on R1.B = R2.B

-- R3 kết tn (R1 kết tn R2) (không viết thiếu ngoặc() ); 

--R1 kết tn R2 kết tn R3;
-- Cách 1:
select * from R1, R2, R3
where R1.B = R2.B 
	and R2.C=R3.C
	
--Cách 2:
select *
from (R1 inner join R2 on R1.B = R2.B) inner join R3 on R2.C = R3.C

--Left semi join R1 và R2
--Cách 1:
Select R1.*
from R1,R2
where R1.B = R2.B

--Cách 2:
select R1.*
from R1 inner join R2 on R1.B = R2.B

--Left outer join R1 và R2
--Cách 1: Cách cổ điển không thực hiện được
--Cách 2: left - right - full join
select *
from R1 left join R2 on R1.B = R2.B

select *
from R1 right join R2 on R1.B = R2.B

select *
from R1 full join R2 on R1.B = R2.B

--R1 anti join R2 --> 3, 4
Select R1.*
from R1 left join R2 on R1.B = R2.B
where C is null

--Phép chia R1 và R4
create table R4
(
	B int
)
insert into R4
values
	(2),
	(3);
	--(4);
select * from R4
delete from R4

select distinct A
from R1 X
where not Exists
	(select *
	from R4
	where B not in (select B
				   From R1
				   Where X.A = A))