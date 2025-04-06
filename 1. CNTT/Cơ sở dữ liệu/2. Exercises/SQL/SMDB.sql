create table Subject
(
	SubjectID char (3) primary key,
	SubjectName char (30),
	Units int
)

drop table Subject

insert into subject
values
	('S01', 'Math', 3),
	('S02', 'Literature', 3),
	('S03', 'Computer', 2),
	('S04', 'History', 2),
	('S05', 'English', 3);
	
select * from Subject
delete from Subject

create table StudentGrades
(
	StudentID char(3),
	SubjectID char(3),
	Grades real,
	primary key (StudentID, SubjectID)
)
drop table StudentGrades

insert into StudentGrades
values
	('T01','S01',8),
	('T01','S02',5),
	('T01','S03',5),
	('T01','S04',9),
	('T01','S05',7),
	('T02','S03',8.5),
	('T02','S04',5),
	('T02','S01',6),
	('T02','S02',7),
	('T03','S01',9.5),
	('T03','S02',5.5),
	('T03','S03',7),
	('T04','S01',10),
	('T04','S02',9.5),
	('T04','S03',8),
	('T04','S05',9),
	('T05','S02',5),
	('T05','S03',7.5),
	('T05','S01',5),
	('T05','S04',5.5),
	('T05','S05',7.0),
	('T06','S01',6.5),
	('T06','S02',8),
	('T06','S03',6.5),
	('T07','S01',6),
	('T07','S02',8),
	('T07','S03',8.5),
	('T08','S01',5.5),
	('T08','S02',6.5),
	('T08','S03',9),
	('T08','S04',5),
	('T09','S02',5.5),
	('T09','S01',6.5),
	('T10','S02',10),
	('T10','S01',10),
	('T10','S03',10),
	('T10','S04',10),
	('T10','S05',10);
select * from StudentGrades
delete from StudentGrades

create table Classes
(
	ClassID char (3) primary key,
	ClassName char (30),
	ClassYear char (30)	
)
drop table Classes

insert into Classes
values
	('C01', 'A1', '2022-2026'),
	('C02', 'A2', '2021-2025'),
	('C03', 'A3', '2020-2024');
select * from Classes
delete from Classes

create table Student
(
	StudentID char (3) primary key,
	StudentName char (30),
	StudentAddress char (30),
	ClassID char (3)
)
drop table Student

insert into Student
values
	('T01', 'A', 'HCM', 'C01'),
	('T02', 'B', 'HCM', 'C02'),
	('T03', 'C', 'HCM', 'C02'),
	('T04', 'D', 'HCM', 'C01'),
	('T05', 'E', 'HCM', 'C01'),
	('T06', 'F', 'HCM', 'C03'),
	('T07', 'G', 'HCM', 'C03'),
	('T08', 'H', 'HCM', 'C02'),
	('T09', 'I', 'HCM', 'C02'),
	('T10', 'J', 'HCM', 'C02'),
	('T11', 'K', 'HCM', 'C01'),
	('T12', 'L', 'HCM', 'C01'),
	('T13', 'M', 'HCM', 'C01'),
	('T14', 'N', 'HCM', 'C01'),
	('T15', 'O', 'HCM', 'C01'),
	('T16', 'P', 'HCM', 'C02'),
	('T17', 'Q', 'HCM', 'C03'),
	('T18', 'R', 'HCM', 'C01'),
	('T19', 'S', 'HCM', 'C01'),
	('T20', 'T', 'HCM', 'C02'),
	('T21', 'U', 'HN', 'C02'),
	('T22', 'V', 'HN', 'C02'),
	('T23', 'W', 'HN', 'C02');
select * from Student
delete from Student

--Ràng buộc toàn vẹn
insert into Subject
values ('S10');
select * from Subject
delete from Subject where SubjectID = 'S10'

alter table subject
alter column subjectname
set not null
alter table subject
alter column subjectID
set not null
alter table subject
alter column units
set not null

alter table classes
alter column classname
set not null
alter table classes
alter column classyear
set not null

alter table student
alter column studentname
set not null
alter table student
alter column classid
set not null

alter table studentgrades
alter column grades
set not null

--Unique (không trùng)
Alter Table Subject
Add Unique (SubjectName)
select * from Subject
Insert into Subject
values ('S06', 'Math', 3);

--Check điều kiện
Alter table Subject
add constraint KTUnit
Check (units > 0)


alter table studentGrades
add constraint KTGrades
check (grades >= 0 and grades <= 10)
insert into studentgrades
values ('T09','S05', -5);


insert into subject
values('S07', 'Mathematics', -5);

select StudentID, count(*)
from StudentGrades
where grades < 5
group by StudentID

select StudentID
from StudentGrades X
where grades >= 5
	and not exists (select *
				   from subject
				   where subjectID not in
				   		(select subjectID from Studentgrades
						where X.studentID = StudentID))

5.1
select *
from Student
where ClassID = 'C02'

5.2
Select A.*
from Student A, Classes B
where A.ClassID = B.ClassID
	and ClassName = 'A1'
	
5.6
Cập nhật điểm:
update StudentGrades
set Grades = 3
where StudentID = 'T01'
	and subjectID = 'S01'
	
update StudentGrades
set Grades = 4
where StudentID = 'T02'
	and subjectID = 'S01'

Cập nhật lên thêm 1 điểm: Set grades = grades + 1
	
Kết tự nhiên:	
Select B.SubjectID, SubjectName, Grades
from StudentGrades A, Subject B
where A.subjectID = B.subjectID
	and StudentID = 'T02'
	and grades < 5
	
5.7
Select *
From Subject
where SubjectID not in
	(Select subjectID
	from studentgrades
	where studentID = 'T03')

5.8
Select ClassID, Count (*)
From Student
Group by ClassID

5.8.1 Hiện tên lớp
Select B.ClassID, ClassName, Count (*)
From Student A, Classes B
Where A.classID = B.ClassID
Group by B.ClassID, className

5.9
Select ClassID, Count (*)
From Student
Group by ClassID
Having count(*) >= All(Select count(*)
					  from Student
					  Group by ClassID)

5.10
select avg(Grades)
from StudentGrades
where studentID = 'T02'

5.11
select studentID, avg(Grades)
from StudentGrades
group by studentID

5.12
select A.studentID, B.classID, avg(Grades)
from studentgrades A, Student B
where A.studentid = B.StudentID
	and classID = 'C02'
group by B.classID, A.studentID

5.13
select B.classID, avg(Grades)
from StudentGrades A, Student B
where A.studentid = B.StudentID
group by B.classID

5.14
select B.*, avg(A.Grades)
from StudentGrades A, student B
where A.studentid = B.studentid
group by B.studentid
having avg(grades) >= all(select avg(A.Grades)
							from StudentGrades A, student B
							where A.studentid = B.studentid
							group by B.studentid)
--Cách 1
select studentID, avg(Grades)
from StudentGrades
group by studentid
having avg(grades) >= all(select avg(Grades)
							from StudentGrades
							group by studentid)

--Cách 2
select StudentID, avg(grades)
from StudentGrades
Group by StudentID
Having avg(grades)=	(select max(G)
	From (select avg(grades) as G
		 From StudentGrades
		 Group by StudentID) as X)

SELECT   StudentID,  Avg( Grades )  AS  AvgG
FROM        StudentGrades
GROUP BY    StudentID
HAVING       AvgG    =      (  SELECT  Max( AvgG )
                                                FROM       (   SELECT   Avg( Grades ),   AS   AvgG
                                                                       FROM        StudentGrades
                                                                       GROUP BY    SubjectID   )
                                              )  
5.15
select B.studentid, B. studentname, avg(Grades)
from StudentGrades A, student B
where A.studentid = B.studentid
group by B.studentid
having avg(grades) >= all(select avg(Grades)
							from StudentGrades A, student B
							where A.studentid = B.studentid
							group by B.studentid)
5.16
select b.classid, c.classname, avg(Grades)
from StudentGrades A, student B, classes C
where A.studentid = B.studentid
and b.classid = c.classid
group by B.classid, c.classname
having avg(grades) >= all(select avg(Grades)
							from StudentGrades A, student B, classes C
							where A.studentid = B.studentid
							and b.classid = c.classid
							group by B.classid, c.classname)
5.17
select a.studentid, sum(grades*units)/sum(units)
from StudentGrades A, subject B
where A.subjectid = B.subjectid
group by a.studentid

--Khóa ngoại
Alter table student
add constraint FK1
Foreign key (classid)
references classes (classid)

insert into student
values
	('xxx','Nguyen Van A', 'Ho Chi Minh', 'yyy')

Alter table studentgrades
add constraint FK2
Foreign key (studentid)
references student (studentid)

Alter table studentgrades
add constraint FK3

Foreign key (subjectid)
references subject (subjectid)

--Nhóm
create table songuyen
(
	a int,
	b int,
	c int
)
insert into songuyen
values
	(1,2,1),
	(1,2,2),
	(2,1,3),
	(3,3,4),
	(3,1,5);
select * from songuyen

select A
from songuyen
group by A

select A,B
from songuyen
group by A,B

/*Hàm thống kê
sum(.): Tổng
max(.), min(.)
avg(.): Trung bình cộng
count (*): đếm số bộ*/

select A, sum(B) --tính tổng của A trong B
from songuyen
group by A

select A, max(C)
from songuyen
group by A

select A, count (*)
from songuyen
group by A

--Nhóm có điều kiện
select A, sum(B)
from songuyen
group by A
Having sum(B)=4

--Cho biết sĩ số từng lớp
select classid, count (*) as Siso
from student
group by classid

--Điểm trung bình cộng của từng SV
select studentid, avg(grades)
from studentgrades
group by studentid

--Điểm TBC của từng SV (mã số và tên)
select A.studentid, B.studentname, avg(grades)
from studentgrades A, student B
where A.studentid = B.StudentID
group by A.studentid, B. studentname

--ĐTB = (Tổng hệ số x điểm)/ (Tổng hệ số)
--ĐK > 8.5
select C.studentid, B.studentname, (sum(units*grades)/sum(units))
from subject A, student B, studentgrades C
where A.subjectid = C.subjectid
and B.studentid = C.studentid
group by C.studentid, B.studentname
Having (sum(units*grades)/sum(units)) > 8.5

--Nhóm lớn nhất
select A, sum(B)
from songuyen
group by A
Having sum(B) >= All (select sum(B)
						from songuyen
						group by A)

--SV nào (mã số & tên) có ĐTB (có hệ số) lớn nhất
select C.studentid, B.studentname, (sum(units*grades)/sum(units))
from subject A, student B, studentgrades C
where A.subjectid = C.subjectid
and B.studentid = C.studentid
group by C.studentid, B.studentname
Having (sum(units*grades)/sum(units)) >= All (select (sum(units*grades)/sum(units))
											from subject A, student B, studentgrades C
											where A.subjectid = C.subjectid
											and B.studentid = C.studentid
											group by C.studentid, B.studentname)
											
--Lớp nào (mã số & tên) có nhiều sinh viên đạt điểm A nhất (>=8.5)
select C.classid, classname, count (*)
from studentgrades A, student B, classes C
where A.studentid = B.studentid
	and B.classid = C.classid
	and grades >=8.5
group by C.classid, className

--Điểm 1 môn cao nhất của 1 SV trong lớp C01
select C.classid, B. studentid, grades
from studentgrades A, student B, classes C
where A.studentid = B.studentid
	and B.classid = C.classid
	and C.classid = 'C01'
group by C.classid, B.studentid
Having max(grades) >= All(select grades
							from studentgrades A, student B, classes C
							where A.studentid = B.studentid
								and B.classid = C.classid
								and C.classid = 'C01'
							group by C.classid, B.studentid)

select classid, B.studentid, grades
from studentGrades A, student B
where A.studentid = B. studentid
and grades =
	(select max (grades)
	from studentgrades C, student D
	where C.studentid = D.studentid
	and B.classid = D.classid )
order by classid, B.studentid


SELECT   *
FROM      Subject
WHERE   units >  2

SELECT        ClassID,   Count(*)
FROM           Student
GROUP BY   ClassID
HAVING        Count(*)  >  3

