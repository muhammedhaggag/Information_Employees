Select *from employees;
Select *from projects;
Select *from completed_projects;
Select *from project_assignments;
Select *from departments;
Select *from [upcoming projects];
----------------------------------------------------
Select *from employees E 
inner join departments D
on e.department_id=D.Department_ID
----------------------------
Select *from employees E 
inner join departments D
on e.department_id=D.Department_ID
Where D.department_id=5;
------------------------------------------
--Project Status
With Project_Statuses as 
(
Select 
project_id,
project_name,
project_budget,
'Upcoming'as Status
from [upcoming projects]
Union all
Select 
project_id,
project_name,
project_budget,
'Completed' as Status
from completed_projects
)
------------------------------------------------
--big table 
select 
E.employee_id,
E.first_name,
E.last_name,
E.job_title,
E.salary,
D.Department_Name,
PA.project_id,
P.project_name,
P.Status
from employees E
inner join departments D
on E.department_id=D.Department_ID
inner join project_assignments PA
on PA.employee_id=E.employee_id
inner join Project_Statuses P
on P.project_id=PA.project_id