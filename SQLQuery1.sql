create database OrderDB
use OrderDB

create table Customers
(CustomerId int primary key,
FirstName nvarchar(50) not null,
LastName nvarchar(50) not null)


insert into Customers values (1, 'Sam', 'Sams')
insert into Customers values (2, 'Ram', 'Rams')
insert into Customers values (3, 'Guru', 'Gurus')
insert into Customers values (4, 'Boy', 'Boys')

create table Orders
(OrderId int primary key identity,
CustomerId int foreign key references Customers,
OrderDate datetime,
TotalAmount float)

create proc PlaceOrder
@customerId int,
@totalAmount float
as 
begin
declare @orderId int
insert into Orders (CustomerId, OrderDate, TotalAmount)
values (@customerId, GETDATE(), @totalAmount)
set @orderId = SCOPE_IDENTITY()
select @orderId as OrderId
end

exec PlaceOrder
@customerId = 4,
@totalAmount = 10000.50


select * from Customers
select * from Orders
