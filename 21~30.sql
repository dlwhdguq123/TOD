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


-- *******************
-- [����021]
-- JOB_TITLE �� "Programmer" �Ǵ� "Sales Manager"�� 
-- ������ �̸�, �Ի���, ������ ǥ��.
-- ������ �̸��� ������������ �����Ͻÿ�
-- *******************
SELECT E.FNAME �̸�,E.HDATE �Ի���, J.TITLE ������
FROM JOB J
    INNER JOIN EMP E
    ON J.JID LIKE E.JID 
WHERE J.TITLE IN('Programmer','Sales Manager')
ORDER BY E.FNAME;

-- *******************
-- [����022]
-- �μ��� �� �������̸� ǥ��
-- (��, �÷����� ������ [����] �̸� �� �ǵ��� ...)
-- DEPARTMENTS ���� MANAGER_ID �� ������ �ڵ�
-- *******************  


-- *******************
-- [����023]
-- ������(MARKETING) �μ����� �ٹ��ϴ� ����� 
-- ���, ��å �̸�, �ټӱⰣ
-- (��, �ټӱⰣ�� JOB_HISTORY ���� END_DATE-START_DATE�� ���� ��)
-- EMPLOYEE_ID ���, JOB_TITLE ��å��
-- *******************  

SELECT EMPLOYEE_ID,DEPARTMENT_NAME
FROM EMPLOYEES;

SELECT * FROM DEPT;
