-- Employees ���̺�

--[ employee_id = ��� ] [ first_name = �̸� ] 

--[ last_name = �� ] [ email = �̸��� ] 

--[ phone_number = ��ȭ��ȣ ] [ hire_date = �Ի��� ]

--[ job_id = �����ڵ� ] [ salary = �޿�]

--[ commission_pct = Ŀ�̼Ǻ��� ] [ manager_id = �����̵�]

--[ department_id = �μ��ڵ�]

--  Jobs ���̺�

-- job_id �����ڵ�
-- job_title ����Ÿ��Ʋ
-- min_salary  �����޿�
-- max_salary �ְ�޿�

-- *******
-- ����011. 

-- Ŀ�̼��� ���� ���ϴ� ������ �̸�,�����ڵ�,�޿�,Ŀ�̼Ǻ����� ��ȸ
-- *******
    select first_name,job_id,salary,commission_pct
    from Employees 
    where commission_pct is null;

-- *******
-- ����012. 
-- ����� 110,120,130�� ����� ���, ��, �̸� ��ȸ
-- *******
    select employee_id,last_name,first_name
    from Employees
    where employee_id in('110','120','130');
    
-- *******
-- ����013. 
-- �μ��ڵ�� ��������, �޿��� ������������ 
-- �μ��ڵ�, �޿�, ���, �̸�, �� ����
-- �������� 0,1,2 ... �������� 9,8,7...
-- ******
    select department_id,salary,employee_id,first_name,last_name
    from Employees
    ORDER BY department_id ASC,salary DESC;


-- *******
-- ����014. 
-- �̸��� am �̶� ���ڰ� ���Ե� ������ ���,�̸�, ��
-- *******
    select employee_id,first_name,last_name
    from Employees 
    where first_name like '%am%';
-- *******
-- ����015. 
-- �̸��Ͽ� 'GG' �� 'KK'�δܾ� �� �ϳ��� ���ԵǾ ��ȸ
-- ��, ��ҹ��� ������
-- *******
    select email
    from Employees 
    where email like '%GG%' or email like '%KK%';
-- *******
-- ����016. 
-- �̸����ּҰ� A �� �������� �ʴ� �̸��� ����
-- *******
    select email
    from Employees 
    where email NOT LIKE 'A%';

-- *******
-- ����017.
-- ���� �ι�°,����° ���ڰ� ���ÿ� e �� ������ �̸�, ��
-- *******
    SELECT first_name,last_name
    FROM Employees
    WHERE last_name like '_ee%';
   

-- *******
-- ����018
 -- �����ӱ��� 10000�� �̻��� ���� �� �� ������ ǥ���Ѵ�
-- *******
    select job_id,job_title,min_salary,max_salary
    from jobs
    where min_salary>=10000;

-- *******************
-- [����19]
-- 2002����� 2005����� 
-- ������ ������ �̸��� ���� ���ڸ� ǥ���Ѵ�.
-- *******************
    SELECT FIRST_NAME,HIRE_DATE
    FROM EMPLOYEES
    WHERE HIRE_DATE BETWEEN '2002/01/01' AND '2005/12/31';
        
    -- *******************
-- [����020]
-- IT Programmer �Ǵ� Sales Man�� 
-- ������ �̸�, �Ի���, �����ڵ� ǥ��.
-- *******************

    select first_name �̸�, hire_date ������ ,job_id �����ڵ�
    from Employees
    where job_id IN('IT_PROG' ,'SA_MAN');

