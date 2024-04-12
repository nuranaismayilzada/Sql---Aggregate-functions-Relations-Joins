create database Task2
create table Students(
	[Id] int primary key identity(1,1),
	[FullName] nvarchar(100),
	[Email] nvarchar(100)
	)
insert into Students ([FullName],[Email])
values		('NuraneIsmayilzade','nunu@gmail.com'),
			('KonulQasimova','konul@gmail.com'),
			('IsmayilIsmayilov','ismayil@gmail.com'),
			('AlisaSafarli','alisa@gmail.com'),
			('NazrinIsmayilzade','nazrin@gmail.com'),
			('GulaySafarli','gulay@gmail.com')

SELECT  FullName, SUBSTRING(Email, 1, CHARINDEX('@', Email)-1) as 'Email'
FROM Students

Select FullName,SUBSTRING(Email,CHARINDEX('@',Email)+1,LEN(Email)) as 'Email' from Students

