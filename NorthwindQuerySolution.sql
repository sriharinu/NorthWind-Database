select * from Categories
select * from Customers
select * from Employees
select * from [Order Details]
select * from Orders
select * from Products
select * from Suppliers
select * from Shippers

use Northwind

--1.
select CategoryName , Description from Categories 
order by CategoryName


--2.
select ContactName, CompanyName, ContactTitle, Phone from Customers
order by Phone


--3.
select FirstName, LastName, HireDate from Employees 
order by HireDate


--4.
select OrderId, OrderDate, ShippedDate, CustomerId, Freight from Orders 
order by Freight desc


--5.
select CompanyName, Fax, Phone, HomePage, Country from Suppliers
order by Country desc, CompanyName


--6
select CompanyNAme, ContactName from Customers
where City='Buenos Aires'


--7.
select ProductName, UnitPrice, QuantityPerUnit from Products 
where UnitsInStock=0


--8.
select OrderDate, ShippedDate, CustomerID, Freight from Orders 
where OrderDate='1997-05-19'


--9.
select FirstName,LastName, Country from Employees
where Country!='USA'


--10
select EmployeeId,  OrderId, CustomerId, RequiredDate, ShippedDate from Orders
where ShippedDate>RequiredDate


--11
select City, CompanyName, ContactNAme from Customers
where  City like 'A%' or City like 'B%'


--12
select  OrderId,CustomerId,OrderDate,Freight from Orders
where Freight>500


--13
select ProductName, UnitsInStock, UnitsOnOrder, Reorderlevel from Products
where ReorderLevel>0


--14
select CompanyName, ContactName, Fax  from Customers 
where fax!='NULL'


--15
select FirstNAme, LastName,ReportsTo from Employees 
where ReportsTo IS NULL 


--16
select CompanyName, ContactName, Fax from Customers  
where fax!='NULL' order by CompanyNAme


--17
select City, CompanyName, ContactNAme from Customers 
where  City like 'A%' or City like 'B%'
order by ContactNAme desc


--18
select FirstName , LastName, BirthDate from employees 
where BirthDate between '1950-01-01' and '1959-12-31'


--19
select ProductName, SupplierId from Products
where SupplierId in 
(Select SupplierID from Suppliers
 where CompanyName='Exotic Liquids'or CompanyName='Grandma Kelly''s Homestead' or CompanyName='Tokyo Traders')


--20
select ShipPostalCode, OrderId, OrderDate from Orders 
where ShipPostalCode like '02389%'


--21
select  ContactName, ContactTitle, CompanyNAme from customers 
where ContactTitle not like '%Sales%'


--22
select FirstName, LastName, City from employees 
where City!='Seattle'


--23
select CompanyName, ContactTitle, City, Country from Customers 
where  Country='Mexico' or (Country='Spain' and City!='Madrid') 


--24
Select Firstname+ ' ' +Lastname+ 'can be reached at x' +Extension+ '.' as ContactInfo from Employees 


--25
Select UnitsInStock, UnitPrice, ceiling(UnitPrice*UnitsInStock) as TotalPrice_RounderUp,  floor(UnitPrice*UnitsInStock) as TotalPrice_RounderDown from Products 
Order by TotalPrice_RounderUp desc


--26
select Datediff(day, BirthDate, HireDate) / 365.00 as HireAgeAccurate, floor(Datediff(day, BirthDate, HireDate) / 365.00) as HireAgeInaccurate from Employees


--27
select FirstName,Lastname, datename(month,BirthDate) as Month from Employees


--28
select  ContactName,Lower(ContactTitle) as ContactTitle from Customers


--29 
select CompanyName from Customers c 


--30
select ProductName from Products where CategoryId in
(select categoryID from Categories where CategoryName='Seafood')


--31 
select c.CompanyName,CategoryID from Customers c, Orders  o, [Order Details]  od, Products as p 
where c.CustomerID=o.CustomerID and o.OrderId=od.OrderId and od.ProductId=p.productId and CategoryId=8

 

--32
select c.CompanyName, CategoryName from Customers  c, Orders  o, [Order Details]  od, Products  p, Categories as cat 
where c.CustomerID=o.CustomerID and o.OrderId=od.OrderId and od.ProductId=p.productId and p.CategoryId=cat.CategoryId and Categoryname='Seafood'


--33
select  Firstname, Lastname,OrderId from Orders  o, Employees e 
where (o.employeeId = e.employeeId and o.requiredDate<o.ShippedDate)  
order by e.LastName 


--34
Select   p.ProductName, sum(od.Quantity) as TotalUnits from [Order Details] as od 
join Products as p  on p.productId=od.ProductId 
Group By p.ProductName Having sum(Quantity)<200


--35 
select  c.CompanyName,count(o.OrderId) as NumOrders  from Orders o join Customers c on  c.CustomerID=o.CustomerId
where o.OrderDate>='1996-12-31' 
group by c.CompanyName having count(o.orderID)>15 
order by NumOrders desc


--36
select c.CompanyName, od.OrderId, UnitPrice*Quantity  as TotalPrice from Customers c, [Order Details] od 
where UnitPrice*Quantity > 10000 
order by TotalPrice desc
