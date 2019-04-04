-- Get Users Of Group
DECLARE	@return_value int
EXEC	@return_value = [Security].[GetUsersOfGroup]
		@groupName = N'%PORTALIA_Staff%'
-- 8162
-- 9036
-- 11532
-- 12133
-- 13611

SELECT Trigram FROM Employee
WHERE EmployeeId = 14200
-- FPO04

--Agathe Dreo
SELECT Trigram AS trigram
  FROM Employee 
 WHERE Firstname LIKE 'Agathe' 
   AND Lastname LIKE 'Dreo'

-------------------------------------------------------------------------------
SELECT etrm.TransferManagerId 'Employee_Transfer_Manager_ID', 
       etr.TransferId 'Employee_Transfer_ID', 
	   etrm.ManagerId, tfman.Lastname + ' ' + tfman.Firstname AS 'Manager FullName', 
	   etrm.IsNewManager, mt.Label AS 'Manager Type', etr.EmployeeId, tarEmp.Lastname + ' ' + tarEmp.Firstname AS 'Concerned Employee',
	   etr.TransferDate, etrs.Label AS 'Status'
FROM Employee_Transfer_Manager etrm
JOIN Employee tfman ON etrm.ManagerId = tfman.EmployeeId
JOIN ManagerType mt ON etrm.ManagerTypeId = mt.ManagerTypeId
JOIN Employee_Transfer etr ON etrm.TransferId = etr.TransferId
JOIN Employee tarEmp ON tarEmp.EmployeeId = etr.EmployeeId
JOIN Employee_TransferStatus etrs ON etr.StatusId = etrs.TransferStatusId
WHERE etr.EmployeeId = 8372

SELECT * FROM Employee_Transfer_Manager where ManagerId = 13684
select * from Employee_Transfer WHERE EmployeeId = 8372
---------------
select getdate()

select DATEDIFF(DAY,'2019-02-02','2019-03-04')

select emp.Trigram, can.Id, emp.CandidateId 'employee canID', cansk.CandidateId 'candidate has skills' from Employee emp
join AF_AdminFile adf on emp.AdminFileId = adf.AdminFileId and emp.EmployeeStatusId <> 4
join Candidate can on adf.AdminFileId = can.AdminFileId
join smart.SMART_CandidateSkills cansk on cansk.CandidateId = can.Id

select * from smart.SMART_CandidateSkills
select * from CF_Skill

----------------------
--//Employee_Manager
select empManager.EmployeeManagerId 'ID', empManager.EmployeeId 'Concern employee', empManager.ManagerId, emp.Lastname + ' ' + emp.Firstname as 'Manager Name' 
from Employee_Manager  empManager
join Employee emp on empManager.ManagerId = emp.EmployeeId
where empManager.EmployeeId = 9612
-- and ManagerTypeId = 2 --financial manager

--//Employee_Transfer_Manager
--1	Main
--2	Financial
--3	Functional Advisor
select empTransManager.TransferId, empTransManager.ManagerTypeId 'Type',
empTransManager.ManagerId 'Financial manager Id', emp.Lastname + ' ' + emp.Firstname 'FM name',
 IsNewManager, empTrans.EmployeeId 'Concern employee', empTrans.TransferDate, CreatedById, empTrans.CreatedDate
 from Employee_Transfer_Manager empTransManager
join Employee_Transfer empTrans on empTransManager.TransferId = empTrans.TransferId
join Employee emp on empTransManager.ManagerId = emp.EmployeeId
where 
--ManagerTypeId = 2 and 
empTrans.StatusId = 3 and empTrans.EmployeeId = 9612
order by CreatedDate desc

select * from Employee_Manager 
where ManagerTypeId = 1
where EmployeeId = 7965
select * from Employee_Transfer
select * from Employee_TransferStatus

select * from Employee_Manager 
--where EmployeeManagerId = 3405
where EmployeeId = 9612

select * from ManagerType
select * from Employee where employeeid = 9612
update Employee_Manager set ManagerId = 6862 where EmployeeManagerId = 3405



select * from Employee_Transfer where EmployeeId = 8372 and StatusId = 3

select * from employee where EmployeeId = 8893

