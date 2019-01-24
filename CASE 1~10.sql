SELECT * FROM EMP;
-- EMPNO ���
-- ENAME �����
-- JOB ����
-- MGR �Ŵ���
-- HIREDATE �Ի���
-- SAL ����
-- COMM Ŀ�̼�
-- DEPTNO �μ��ڵ�

SELECT * FROM DEPT;

-- DEPTNO �μ��ڵ�
-- DNAME �μ���
-- LOC ȸ����ġ


--����
--CASE WHEN ���ǽ�
-- THEN ���� ���
-- ELSE ������ ���
-- END �÷������� ó��

-- EMP_TEST_01
-- CASE ǥ��
SELECT ENAME,
    CASE WHEN SAL >= 2000
        THEN SAL
        ELSE 2000
    END REVISED_SALARY
FROM EMP;
--EMP TEST_02
--�μ������� �μ���ġ�� �̱��� ����,�ߺ�,���η� �����϶�
--���� -EAST, ������ - EAST , ��ī�� - CENTER, �޶� -CENTER
--�÷��� - AREA
SELECT LOC,
   CASE WHEN LOC = 'NEW YORK' THEN 'EAST' 
        WHEN LOC = 'BOSTON' THEN 'EAST' 
        ELSE 'CENTER'
    END AS AREA
FROM DEPT
ORDER BY AREA;
--EMP TEST_03
--�޿��� 3000�̻��̸� HIGH, 1000 �̻��̸� MID , �̸��̸� LOW

SELECT ENAME,SAL,
    CASE WHEN SAL >= 3000 THEN 'HIGH'
         WHEN SAL >= 1000 THEN 'MID'
            ELSE 'LOW'
            END REVISED_SALARY
    FROM EMP;  
--EMP TEST_04
--�޿��� 2000�̻��̸� ���ʽ� 1000,
-- 1000 �̻��̸� 500,
--1000 �̸��̸� 0���� ����Ͻÿ�
-- �÷����� BONUS
SELECT ENAME,SAL,
    CASE WHEN SAL >= 2000 THEN '1000'
         WHEN SAL >= 1000 THEN '500'
         ELSE '0' 
         END BONUS
    FROM EMP
    ORDER BY SAL;     
-- EMP_TEST_05
-- �Ŵ����� "BLAKE" �̸� NULL ǥ��, ���� ������ MGR ǥ��

SELECT ENAME, EMPNO, MGR,
    CASE WHEN MGR = (SELECT MGR 
                    FROM EMP 
                    WHERE EMPNO LIKE 7698)
         THEN NULL
         ELSE MGR
    END NUIF
FROM EMP; 

-- EMP_TEST_06
-- ���� �Ի��������� ���� �����͸� �����ϱ�
-- EXTRACT() 
SELECT ENAME,DEPTNO,
    EXTRACT(MONTH FROM HIREDATE) �Ի�� ,SAL
FROM EMP;
--EMP_TEST_07
-- �����  MONTH �����͸� 12���� ���� Į������ �����ϱ�

SELECT ENAME,DEPTNO,
        EXTRACT(MONTH FROM HIREDATE) ��
FROM EMP;




-- EMP_TEST_08
-- ����� MONTH �����͸� 12���� ���� Į������ ������ ��
-- �μ����� �����ϱ�


--EMP TEST 09
--������ ����
--LEVEL : ��Ʈ �������̸� 1, �� ���� �������̸� 2�̴�.
--����(LEAF) �����ͱ��� 1�� �����Ѵ�.
--CONNECT_BY_ISLEAF ���� �������� �ش� �����Ͱ� �����������̸�
--1, �׷��� ������ 0�̴�
--
SELECT LEVEL, 
        LPAD(' ',4 *(LEVEL-1)) || EMPNO ���,
        MGR ������,
        CONNECT_BY_ISLEAF ISLEAF
FROM EMP
START WITH MGR IS NULL
CONNECT BY PRIOR EMPNO LIKE MGR;

--EMP TEST 10
--���� ����

SELECT E1.EMPNO ��� , E1.MGR ������, E2.MGR "���� ������"
FROM EMP E1
    LEFT JOIN EMP E2
        ON E1.MGR LIKE E2.EMPNO
ORDER BY E2.MGR DESC, E1.MGR,E1.EMPNO
; 
-- �ڽŰ� �ڽ��� ���Ӱ����ڴ� ������ �࿡�� ���Ҽ� ������
-- ������ �����ڴ� �ٷ� ���Ҽ� ����.
-- ������ �����ڸ� ���ϱ� ���ؼ��� �ڽ��� ���� �����ڸ�
-- �������� ���� ������ �����ؾ� �ȴ�.
-- �׷���, INNER JOIN�� ��������ν� �ڽ��� �����ڰ�
-- �������� �ʴ� ��쿡�� E2���̺��� ������ �����
-- �������� �ʱ� ������ �ش� �����ʹ� ������� �����ȴ�.
-- �̸� �����ϱ� ���ؼ��� �ƿ��� ������ ����Ѵ�.

--EMP_TEST 11
--GROUP FUNCTION �׷��Լ�
--�Ϲ����� GROUP BY �Լ�


--ANSI ���� ������ �Լ� ������
--AGGREBATE FUNCTION �����Լ� SUM(), MIN(), ...
--GROUP FUNCTION �׷��Լ� 
--Ư���׸� ���� �Ұ踦 �ϴ� �Լ�
--ROLLUP : �ұ׷찣�� �Ұ踦 ����ϴ� �Լ�
SELECT DNAME �μ���,
    JOB ����,
    COUNT(*) "��ü ���",
    SUM(SAL) "��ü �޿�"
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
GROUP BY ROLLUP(DNAME,JOB);
--CUBE : ���������� �Ұ踦 ����ϴ� �Լ� 
SELECT CASE GROUPING(DNAME)
            WHEN 1 THEN 'ALL DEPTS'
            ELSE DNAME 
            END "�μ���",
        CASE GROUPING(JOB)
            WHEN 1 THEN 'ALL JOBS'
            ELSE JOB 
        END "����",
        COUNT(*) "��ü ���",
        SUM(SAL) "��ü �޿�"        
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
GROUP BY CUBE(DNAME,JOB);
--WINDOW FUNCTION �������Լ�..RANK(), ROW_NUMBER() 

