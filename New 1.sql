select e.LAST_NAME �̸�, d.DEPARTMENT_NAME �μ��� 
from employees e
inner join departments d
on e.department_id like
    d.department_id;
    

 select department_name AS "���� �μ�"
 from departments
 where department_id like( select department_id from employees where last_name like 'Fay');