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

SELECT E.EID ���, J.TITLE ��å, E.FNAME �̸� ,H.EDATE- H.SDATE �ټӱⰣ
FROM HIS H
    JOIN JOB J
        ON H.JID LIKE J.JID
    JOIN EMP E
        ON E.EID LIKE H.EID
WHERE E.DID LIKE (
                SELECT D.DID
                FROM DEP D
                WHERE D.DNAME LIKE 'Marketing');

SELECT D.DID
    FROM DEP D
    WHERE D.DNAME LIKE 'Marketing';
    --�� 20
    

-- *******************
-- [����024]
-- �� �μ��� ��ġ�� IT ������ �̸� ��� 
-- DEPARTMENT_NAME �μ���, �̸�(FIRST_NAME + [����] + LAST_NAME)���� ���
-- �̸��� �ߺ��Ǿ ��µ�. �� �Ѹ��� �����μ����� ������ ������
-- *******************  





-- *******************
-- [����025]
-- �μ���, ������ �̸�, �μ���ġ ���� ǥ��
-- �μ��� ��������
-- *******************
SELECT 
    DNAME �μ���,
    FNAME ||' '|| E.LNAME "������ �̸�",
    L.CITY "�μ���ġ ����"
FROM DEP D
    JOIN EMP E
        ON D.MID LIKE E.EID
    JOIN LOC L
        USING(LID)
    ORDER BY DNAME;
    
    
    
-- *******************
-- [����026]
-- �μ��� ��� �޿�
-- *******************  

SELECT 
    D.DNAME �μ���,
    ROUND(AVG(E.SAL),2) "�μ��� ��� �޿�"
FROM EMP E
    JOIN DEP D
        ON E.DID LIKE D.DID
GROUP BY E.DID, D.DNAME
HAVING ROUND(AVG(E.SAL),2) >= 10000
;
        
 -- *******************
-- [����027]
-- �μ��� ��� �޿��� 10000 �� �Ѵ�
--  �μ���, "�μ��� ��� �޿�" �� ����Ͻÿ�
-- *******************  

-- *******************
-- [����028]
-- ���� �������� 10% �λ�� �޾��� ���� ��������
-- å���Ǿ����ϴ�. ���� ������� ����޿���
-- ����ϼ���.
-- ��, ���� = �޿� * 12 �Դϴ�
-- *********************


-- *******************
-- [����029]
-- �μ����� ����ϴ� �����ڿ� ������ 
-- �ѹ����� ����Ͻÿ� (11��)
-- *********************

-- *******************
-- [����030]
-- �̹� �б⿡ IT�μ�(�μ���: IT)������ �ű� ���α׷��� �����ϰ� 
-- �����Ͽ� ȸ�翡 �����Ͽ���. 
-- �̿� �ش� �μ��� ��� �޿��� 12.3% �λ��Ͽ� �����մϴ�.
-- ������(�ݿø�) ǥ���Ͽ� ������ �ۼ��Ͻÿ�. 
-- ������ �����ȣ, ���� �̸�(�̸�), 
-- �޿�, ���� ������ ����Ͻÿ�
-- �޾��� õ��������
-- *********************       