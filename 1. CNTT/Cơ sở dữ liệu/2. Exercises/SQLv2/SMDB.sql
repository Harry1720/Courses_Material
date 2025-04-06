create table Subject 
( 
	SubjectID char(3) primary key,
	SubjectName varchar(30), 
	Units int
)
select * from Subject
insert into Subject
values
	('S01', 'Toan', 3),
	('S02', 'Ly', 3),
	('S03', 'Hoa', 3),
	('S04', 'AnhVan', 3),
	('S05', 'NguVan', 3)
delete from Subject

drop table Subject

create table Classes 
( 
	ClassID char(3) primary key, 
	ClassName char(3), 
	ClassYear char(9)
)
insert into Classes
values
	('C01', 'CN1', '2022-2026'),
	('C02', 'CN2', '2022-2026'),
	('C03', 'CN3', '2022-2026')

	
select * from Classes
delete from Classes

drop table Classes 

create table Student 
( 
	StudentID char(3) primary key, 
	StudentName varchar(30), 
	StudentAddress varchar(50), 
	ClassID char(3)
)
insert into Student 
values
	('T01', 'Nguyen Van A', 'Binh Thuan', 'C01'),
	('T02', 'Nguyen Van B', 'Binh Thuan', 'C01'),
	('T03', 'Nguyen Van C', 'Binh Thuan', 'C01'),
	('T04', 'Nguyen Thi D', 'Binh Thuan', 'C01'),
	('T05', 'Nguyen Van E', 'Binh Thuan', 'C01'),
	('T06', 'Nguyen Van F', 'Binh Thuan', 'C01'),
	('T07', 'Nguyen Van Mot', 'Ninh Thuan', 'C02'),
	('T08', 'Nguyen Van Hai', 'Ninh Thuan', 'C02'),
	('T09', 'Nguyen Van Ba', 'Ninh Thuan', 'C02'),
	('T10', 'Nguyen Thi Bon', 'Ninh Thuan', 'C02'),
	('T11', 'Nguyen Van Nam', 'Ninh Thuan', 'C02'),
	('T12', 'Nguyen Van Sau', 'Ninh Thuan', 'C02'),
	('T13', 'Tran Van Q', 'TP HCM', 'C03'),
	('T14', 'Tran Bang Bang', 'TP HCM', 'C03'),
	('T15', 'Tran Van P', 'TP HCM', 'C03'),
	('T16', 'Tran Van H', 'TP HCM', 'C03'),
	('T17', 'Tran Thi Ngoc ', 'TP HCM', 'C03'),
	('T18', 'Tran Thi Ngoc Tram', 'TP HCM', 'C03'),
	('T19', 'Doan Cong Nguyen', 'TP HCM', 'C03'),
	('T20', 'Pham Long', 'TP HCM', 'C03')
	
select * from Student 
delete from Student 

drop table Student 

create table StudentGrades 
( 
	StudentID char(3), 
	SubjectID char(3), 
	Grades real,
	primary key(StudentID, SubjectID)
)
insert into StudentGrades 
values
	('T01', 'S01', 4),
	('T01', 'S02', 4),
	('T01', 'S03', 4),
	('T01', 'S04', 4),
	('T02', 'S01', 4),
	('T02', 'S02', 4),
	('T02', 'S03', 4),
	('T02', 'S04', 4),
	('T02', 'S05', 4),
	('T03', 'S01', 4),
	('T03', 'S02', 4),
	('T03', 'S04', 7),
	('T03', 'S05', 8),
	('T04', 'S01', 4.49),
	('T04', 'S02', 4.49),
	('T04', 'S04', 4.49),
	('T04', 'S05', 4.49),
	('T05', 'S01', 4.49),
	('T05', 'S02', 4.49),
	('T05', 'S03', 4.49),
	('T05', 'S04', 4.49),
	('T05', 'S05', 3),
	('T06', 'S01', 3),
	('T06', 'S02', 3),
	('T06', 'S03', 3),
	('T06', 'S04', 3),
	('T07', 'S01', 3),
	('T07', 'S02', 3),
	('T07', 'S04', 3),
	('T07', 'S05', 3),
	('T08', 'S01', 3),
	('T08', 'S02', 3),
	('T08', 'S03', 4),
	('T08', 'S04', 2),
	('T08', 'S05', 2),
	('T09', 'S01', 1),
	('T09', 'S02', 1.6),
	('T09', 'S03', 4),
	('T09', 'S04', 4.6),
	('T09', 'S05', 1),
	('T10', 'S01', 2),
	('T10', 'S02', 2),
	('T10', 'S03', 2),
	('T10', 'S04', 2),
	('T10', 'S05', 2),
	('T11', 'S01', 0),
	('T11', 'S03', 2),
	('T11', 'S04', 2),
	('T11', 'S05', 0),
	('T12', 'S01', 0),
	('T12', 'S02', 0),
	('T12', 'S04', 2),
	('T12', 'S05', 2),
	('T13', 'S01', 2),
	('T13', 'S02', 0),
	('T13', 'S03', 2),
	('T13', 'S04', 2),
	('T13', 'S05', 2),
	('T14', 'S01', 9),
	('T14', 'S02', 9),
	('T14', 'S03', 9),
	('T14', 'S04', 9),
	('T14', 'S05', 9),
	('T18', 'S01', 8.5),
	('T18', 'S02', 8.5),
	('T18', 'S03', 8.5),
	('T18', 'S04', 8.5),
	('T18', 'S05', 8.5)


select * from StudentGrades 
delete from StudentGrades 

dau ba rot hai
drop table StudentGrades 
select *
from student
where studentid in (select studentid
				   from studentgrades
				   where grades >= 5 
				   group by studentid
				   having count(*) =3)
  and studentid in (select studentid
				   from studentgrades
				   where grades < 5 
				   group by studentid
				   having count(*) =2)
				   
sv nao thi dat tat ca mon hoc
select distinct Y.*
from studentgrades X, student Y
where X.studentid = Y.studentid
  and not exists (select *
				  from subject
				  where subjectid not in 
				  			(select subjectid from studentgrades
							 where grades >= 5
								and X.studentid = studentid))
								
5.1. Show Students of class ID = "C02".								
select *
from student
where classid = 'C02'

5.2. Show Students of class name = "Computer Science"
select X.*
from student X, classes Y
where X.classid = Y.classid
and classname = 'CN1'

5.3. Show Students (All information) of class year = "2020-2024".

5.7 Show all the Subject (*) that Student ID = "T03" never took the exam
(select subjectid
from subject)
except 
(Select subjectid
from studentgrades where studentid = 'T03')

select *
from subject
where subjectid not in
		(select subjectid
		 from studentgrades
		 where studentid = 'T03')
		 
5.8 Number of Students for each class.
select classid, count(*) as ss
from student
group by classid

5.10
select studentID,avg(grades)
from studentgrades
where studentID='T02'
group by studentID
5.11
select studentID,avg(grades)
from studentgrades
group by studentID
5.12
select Y.studentid, classid, avg(grades)
from student X, studentgrades Y
where X.studentid = Y.studentid
and classid = 'C02'
group by Y.studentid, classid
5.13
select x.classid, avg(grades)
from student X, studentgrades Y
where X.studentid = Y.studentid
group by X.classid	
5.4
select X.subjectname, X.units
from subject X
where subjectid = 'S02'
5.5
select X.grades
from studentgrades X
where subjectID='S02'and studentid='T02'
5.6
select X.subjectid,X.subjectname,Y.grades
from subject X, studentgrades Y
where X.subjectid = Y.subjectid
and Y.studentid='T02'
and Y.grades<5
///
select classid,count(*)
From student
group by classid
having count(*)<7
////
select A,sum(B)
from R
group by A
having sum(B)>
5.9
select classid, count(*)
from student 
group by classid
having count(*)>=All (select  count(*)
                      from student 
                      group by classid)
5.14
select studentid,avg(grades)
from studentgrades
group by studentID
having avg(grades)>= all(select avg(grades)
from studentgrades
group by studentID)
5.15
select X.studentid,X.studentname,avg(grades)
from student X, studentgrades Y
where X.studentid=Y.studentid
group by X.studentid,X.studentname
having avg(grades)>= all(select avg(grades)
from student X, studentgrades Y
where X.studentid=Y.studentid
group by X.studentid,X.studentname )



alter table subject
 alter column SubjectName
 set not null
 alter table subject
 alter column units
 set not null
 insert into subject 
 values ('S10')
 
  alter table classes
 alter column ClassName
 set not null
 alter table classes
 alter column ClassYear
 set not null
 
  alter table student
 alter column StudentName
 set not null
 alter table student
 alter column StudentAddress
 set not null
 
 alter table StudentGrades
 alter column Grades
 set not null
 
 alter table subject
 add unique(subjectname)
 select *from subject
 
 insert into subject
 values ('S10','Dia',3)
 delete from subject
 where subjectid ='S10'
 
 alter table subject
 add constraint KTUnit
 check(units>0)
 
 insert into subject
 values ('S11','Su',-3)
 
 alter table studentgrades
 add constraint KTgrade
 check(Grades>=0
 and Grades <= 10)
 
 insert into studentgrades
 values ('T16','S01',-3)