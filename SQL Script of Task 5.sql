/*
	Table Used:- Customers, Products, Orders, Order_Items 
*/
Select * From Customers
Select * From Products
Select * From ORDERS
Select * From Order_Items

/*
	Joins  Types
	==============
	1. Inner Join (default join)
			- Equi Join
			- Non-Equi Join
			- Self Join

	2. Outer Join
			- Left Join / Left Outer Join
			- Right Join / Right Outer Join
			- Full Join

	3. Cross Join / Cartesian Product
*/

/* Inner Join (Equi Join)*/

--Display Order number,Order Date,Delivery Date,Customer Name and Address details ?
Select O.Orderno,O.Order_DT,O.Delivery_DT,C.Cname,C.Caddr From Customers as C Inner Join Orders as O on C.Cid=O.Cid

--Display order details with customer details to be delivered today ? 
Select O.*,C.Cname,C.Caddr From Customers as C Inner Join Orders as O  on C.Cid=O.Cid 
Where O.Delivery_DT=Format(GetDate(),'yyyy-MM-dd')

/*
	Joining Multiples Tables in order to get the required data
	==========================================================
	Qns. Display  Order no, Customer name, Address, Prodid, Pname, Price, Qty, Total value  ?

		Here following Column are  present in 4 different tables
			Orders Table => Orderno
			Customers Table => Cname, Address
			Products Table => Prodid, Pname, Price
			Order_Items Table => Qty

			and Total Value is obtained by (Price*Qty) column, so we need to join 4 tables
*/
Select O.Orderno,C.Cname,C.Caddr,P.Prodid,P.Pname,P.Pname,OI.Qty,(P.Price*OI.Qty) as [Total Value] From Orders as O 
Join Customers as C ON O.Cid=C.Cid Join Order_Items as OI ON O.Orderno=OI.Ordid join Products as P ON OI.Prodid=P.Prodid

/* 
	Inner Join (Non-Equi Join)
	===========================
	Table Used :- Emp, Salgrade
*/
Select * From Emp
Select * From Salgrade

--Display Employee Name, Salary, Grade?
Select E.Ename,E.Sal,S.Grade From Emp as E join Salgrade as S ON E.Sal Between S.Losal And S.Hisal

--Display list of employees who got grade 3?
Select E.Ename,E.Sal,S.Grade From Emp as E join Salgrade as S ON E.Sal Between S.Losal And S.Hisal Where S.Grade=3

/*
	 Self Join
	===========
	Table Used :- Employee
*/
Select * From Employee

--Display Employee Name and their Manager Name?
Select E.Ename as [Employee Name], M.Ename as [Manager Name] From Employee as E join Employee as M ON E.MGR=M.EMPNO

--Display employee names reporting to blake ?
Select E.Ename as [Employee Name], M.Ename as [Manager Name] From Employee as E join Employee as M ON E.MGR=M.EMPNO
Where M.ENAME='Blake'

--Display blake's manager name  ?
Select E.Ename as [Employee Name], M.Ename as [Manager Name] From Employee as E join Employee as M ON E.MGR=M.EMPNO
Where E.ENAME='Blake'

--Display employees earning more than their managers ?
SELECT E.Ename,E.SAL,M.Ename as Manager,M.SAL as Manager_Sal FROM Employee as E JOIN Employee as M ON E.MGR=M.Empno WHERE E.SAL>M.SAL

--Employees who are senior to their mangers ? 
SELECT E.Ename,E.Hiredate,M.Ename as Manager,M.Hiredate as Mgrhire FROM Employee as E 
JOIN Employee as M ON E.MGR=M.Empno WHERE E.HIREDATE<M.HIREDATE

--How many employees working under Blake?
Select Count(*) as [No. of Employees] From Employee as E join Employee as M ON E.MGR=M.EMPNO
Where M.ENAME='Blake'


/* 
	  Outer Join
	=============
	Table Used :-  Emp_Details, Project
*/	
Select * From Project
Select * From Emp_Details

/* Left Outer Join*/
--Display employee details with project details and also display employees not assigned to any project ?
Select * From Emp_Details as E Left Join Project as P on E.Projid=P.Projid

/* Right Outer Join*/
Select E.Ename,P.Projid,P.Pname,P.Duration From Emp_Details as E Right Join Project as P on E.Projid=P.Projid Where E.Ename IS Null

/* Full Join */
Select E.*,P.Pname,P.Duration From Emp_Details as E Full Join Project as P on E.Projid=P.Projid

/*
	CROSS / CARTESIAN Join
	=======================
	Table Used :- ITEMS1, ITEMS2
*/
Select * From ITEMS1
Select * From ITEMS2

--Display the Food Item with Cold drink Combo with Combo Price
Select F.IName,B.IName,(F.Price+B.Price) as [Combo Price] From ITEMS1 as F Cross Join ITEMS2 as B