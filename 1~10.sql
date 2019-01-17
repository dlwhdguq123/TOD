-- EMPLOYEES���̺�
--[ employee_id = ��ȣ ] [ first_name = �̸� ] 
--[ last_name = �� ] [ email = �̸��� ] 
--[ phone_number = ��ȭ��ȣ ] [ hire_date = ����� ]
--[ job_id = ����ID ] [ salary = �޿�]
--[ commission_pct = Ŀ�̼Ǻ��� ] [ manager_id = ���ID]
--[ department_id = �μ�ID]

-- *******
-- ����001. 
-- HR ��Ű�� ���̺��� ��� ���?
-- *******
select * from tab;

-- *******
-- ����002. 
-- HR ��Ű�� ���̺� ���� �?
-- *******
-- �� : 8��
select count(*) from tab;

-- *******
-- ����003. 
-- ���, ��, �̸����?
-- ******* 
select employee_id,last_name,first_name 
from EMPLOYEES;

-- *******
-- ����004. 
-- �̸��� s�� ������ ������ �̸� ���?
-- *******
 
 select first_name
 from EMPLOYEES
 where first_name like '%s';

-- *******
-- ����005. 
-- �̸��� s�� �����ϴ� ������ �̸� ���?
-- *******
 SELECT first_name
 FROM EMPLOYEES
 WHERE first_name LIKE 'S%';

-- *******
-- ����006. 
-- �޿��� ���� ������ �̸�,�μ��ڵ�,�޿� ��ȸ 
-- *******

SELECT first_name,department_id,salary FROM EMPLOYEES ORDER BY salary DESC;

-- *******
-- ����007.
-- �޿��� 12000 �̻��� ���,�̸�,�μ��ڵ�, �޿� ��ȸ 
-- *******

SELECT employee_id,first_name,department_id,salary 
FROM EMPLOYEES 
WHERE salary>=12000;

-- *******
-- ����008.
-- �޿��� 1500�̻� 2500���ϸ� �޴� ������ ���,�̸�,�μ��ڵ�, �޿� ��ȸ 
-- ( AND ��� )
-- *******
SELECT employee_id,first_name,department_id ,salary
FROM EMPLOYEES 
WHERE salary>=1500 AND salary<=2500;

-- *******
-- ����009.
-- �޿��� 1500�̻� 2500���ϸ� �޴� 
-- ������ ���,�̸�,�μ��ڵ�, �޿� ��ȸ (BETWEEN ���) 
-- *******
SELECT employee_id,first_name,department_id 
FROM EMPLOYEES WHERE salary between 1500 and 2500 ;

-- *******
-- ����010.
-- 2005�⵵�� �Ի��� ������ �̸��� �μ��ڵ�, 
-- �Ի����ڸ� ��ȸ
-- *******
select first_name,employee_id,hire_date
from EMPLOYEES
where substr(hire_date, 1, 2)=05;









