create database Emp
create table Employes(
	[Id] int,
	[Name] nvarchar(50),
	[Surname] nvarchar(50),
	[Age] int
)
insert into Employes([Id],[Name],[Surname],[Age])
values (1,'Nurane','Ismayilzade',21),
		(2,'Nunu','Isi',22),
		(3,'Ismayil','Ismayilov',18)

select Count (*) as 'Employe count' from Employes

select Sum (Age) as 'Employee age sum' from Employes

select Avg(Age) as 'Employee avg age' from Employes

select Max(Age) as 'Employee max age' from Employes

select Min(Age) as 'Employee min age' from Employes

--sql aggregate function

select SUBSTRING ('Nurane',1,3)

select REPLACE ('salam','s','b')

select SUBSTRING ([Surname],1,4) from Employes

declare @avgAge int = (select AVG(Age) from Employes)

declare @sumAge int = (select Sum(Age) from Employes)

if @sumAge>@avgAge
	print 'Yes'
else 
	print 'No'


create table Countriess(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(50),
)


insert into Countriess([Name])
values ('Azerbaycan'),
		('Turkiye'),
		('Ispaniya'),
		('Almaniya')

select *from Countriess

create table Citiess(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(50),
	[CountryId] int,
	foreign key (CountryId) references Countriess(Id)
)

select *from Citiess

insert into Citiess([Name],[CountryId])
values ('Baku',1),
		('Aghsu',1),
		('Shusha',1),
		('Antalya',2),
		('Madrid',3),
		('Barcelona',3),
		('Berlin',4),
		('Hamburg',4)

select *from Citiess where CountryId=1

create table Studentss(
	[Id] int primary key identity (1,1),
	[FullName] nvarchar(100) not null,
	[Email] nvarchar(50),
	[Address] nvarchar(100),
	[Age] int,
 	[CityId] int,
	foreign key (CityId) references Citiess(Id)
	)
select * from Studentss

insert into Studentss([FullName],[Email],[Address],[Age],[CityId])
values('NuraneIsmayilzade','nunu@gmail.com','Ramana',22,1),
	('NunuIsmayilzade','nunnu@gmail.com','Xalqlar',23,1),
	('IsmayilIsmayilov','isi@gmail.com','merdekan',17,2),
	('RuslanEliyev','rus@gmail.com','sumgayit',20,2),
	('NurlanEliyev','nurlan@gmail.com','ehmedli',21,2),
	('KonulQasimova','konul@gmail.com','tovuz',46,3),
	('AqsinIsmayilov','aqsin@gmail.com','gence',47,3),
	('HuseynHuseynov','huseyn@gmail.com','naxcivan',44,4),
	('TuraneAnarli','turane@gmail.com','seki',34,4)

create table Teachersss(
	[Id] int primary key identity(1,1),
	[FullName] nvarchar(100),
	[Salary] float,
	[Age] int,
	[CityId] int,
	foreign key (CityId) references Citiess(Id)
)

insert into Teachersss([FullName],[Salary],[Age],[CityId])
values('Test1',500,22,1),
	  ('Test2',1000,24,2),
	  ('Test3',5000,27,4)

create table TeachersStudents(
	[Id] int primary key identity(1,1),
	[TeacherId] int,
	[StudentId] int,
	foreign key (TeacherId) references Teachersss(Id),
	foreign key (StudentId) references Studentss(Id)
)


select *from Countriess co
inner join Citiess ct
on co.Id=ct.Id

select *from Countriess co
inner join Citiess ct
on co.Id=ct.CountryId


select ct.Name as 'City',co.Name as 'Country' from Countriess co
left join Citiess ct
on co.Id=ct.CountryId

 select ct.Name as 'City',co.Name as 'Country' from Countriess co
right join Citiess ct
on co.Id=ct.CountryId

select ct.Name as 'City',co.Name as 'Country' from Countriess co
right outer join Citiess ct
on co.Id=ct.CountryId

select ct.Name as 'City',co.Name as 'Country' from Countriess co
full join Citiess ct
on co.Id=ct.CountryId

select ct.Name as 'City',co.Name as 'Country' from Countriess co
full outer join Citiess ct
on co.Id=ct.CountryId

select *from Studentss st
join Citiess ct
on ct.Id=st.CityId
join Countriess co
on ct.CountryId=co.Id

select st.FullName as 'Student name',st.Email 'Student email',
st.Age as 'Student age',ct.Name as 'City',co.Name as 'Country' from Studentss st
join Citiess ct
on ct.Id=st.CityId
join Countriess co
on ct.CountryId=co.Id

select st.FullName as 'Student name',st.Email 'Student email',
st.Age as 'Student age',ct.Name as 'City',co.Name as 'Country', t.FullName as 'Teacher fullname'
from Studentss st
join Citiess ct
on ct.Id=st.CityId
join Countriess co
on ct.CountryId=co.Id
join TeachersStudents ts
on st.Id=ts.StudentId
join Teachersss t
on t.Id=ts.TeacherId

select st.FullName as 'Student name',st.Email 'Student email',
st.Age as 'Student age',ct.Name as 'City',co.Name as 'Country', t.FullName as 'Teacher fullname'
from Studentss st
join Citiess ct
on ct.Id=st.CityId
join Countriess co
on ct.CountryId=co.Id
join TeachersStudents ts
on st.Id=ts.StudentId
join Teachersss t
on t.Id=ts.TeacherId
order by st.Age desc


select st.FullName as 'Student name',st.Email 'Student email',
st.Age as 'Student age',ct.Name as 'City',co.Name as 'Country', t.FullName as 'Teacher fullname',
t.Salary as 'Teacher Salary' 
from Studentss st
join Citiess ct
on ct.Id=st.CityId
join Countriess co
on ct.CountryId=co.Id
join TeachersStudents ts
on st.Id=ts.StudentId
join Teachersss t
on t.Id=ts.TeacherId
where t.Id=1