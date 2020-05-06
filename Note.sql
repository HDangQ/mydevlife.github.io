SELECT EMP.EmployeeId, AFD.AdminFileId, MAN.Firstname + ' ' + MAN.Lastname 'Manager',
MAN.Trigram 'Manager trigram',
EMPS.Label, CAN.Id 'Candidate Id',
CASE EMP.EmployeeStatusId
WHEN 2 THEN 0
WHEN 1 THEN 1
WHEN 3 THEN 2 ELSE 3 END AS 'StatusOrder'
--,
    --CASE WHEN CAN.Email IS NOT NULL
    --THEN CAN.Email
    --ELSE CTD.Info
    --END AS 'Email',
    --CAN.Email 'Candidate email', CTD.Info
FROM Employee EMP
    JOIN AF_AdminFile AFD ON EMP.EmployeeId = AFD.EmployeeId
    JOIN Candidate CAN ON AFD.AdminFileId = CAN.AdminFileId
    JOIN Employee MAN ON EMP.ManagerId = MAN.EmployeeId
    --LEFT JOIN AF_ContactDetails AFCT ON AFD.AdminFileId = AFCT.AdminFileId
    --JOIN ContactDetails CTD ON AFCT.ContactDetailsId = CTD.ContactDetailsId AND CTD.ContactDetailsTypeId = 1 -- EMAIL
    JOIN EmployeeStatus EMPS ON EMP.EmployeeStatusId = EMPS.EmployeeStatusId
ORDER BY StatusOrder