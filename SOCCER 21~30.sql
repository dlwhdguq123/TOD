-- SOCCER_SQL_021
-- ���� ���� �Ҽ����� ������� ���
SELECT PLAYER_NAME ������,POSITION ������,BACK_NO ��ѹ�
FROM PLAYER 
     WHERE TEAM_ID = (SELECT TEAM_ID 
                            FROM PLAYER 
                            WHERE PLAYER_NAME = '����')
ORDER BY PLAYER_NAME; 


-- SOCCER_SQL_022
-- NULL ó���� �־�
-- SUM(NVL(SAL,0)) �� ��������
-- NVL(SUM(SAL),0) ���� �ؾ� �ڿ����� �پ���
 
-- ���� �����Ǻ� �ο����� ���� ��ü �ο��� ���
 
-- Oracle, Simple Case Expr 

-- SOCCER_SQL_023
-- GROUP BY �� ���� ��ü �������� �����Ǻ� ��� Ű �� ��ü ��� Ű ���

-- SOCCER_SQL_024 
-- �Ҽ����� Ű�� ���� ���� ������� ����
SELECT P.TEAM_ID �����̵�,TEAM_NAME ����,P.PLAYER_NAME ����,
                            P.POSITION ������,P.BACK_NO ��ѹ�,P.HEIGHT Ű 
FROM PLAYER P
        JOIN TEAM T 
            ON P.TEAM_ID LIKE T.TEAM_ID
WHERE (P.TEAM_ID,P.HEIGHT) IN(SELECT TEAM_ID ,MIN(HEIGHT)
                                 FROM PLAYER
                                 GROUP BY TEAM_ID ) 
;
SELECT TEAM_ID ,HEIGHT 
FROM PLAYER;


-- SOCCER_SQL_025 
-- K-���� 2012�� 8�� ������� �� ������ �������� ABS �Լ��� ����Ͽ�
-- ���밪���� ����ϱ�

-- SOCCER_SQL_026 
-- 20120501 ���� 20120602 ���̿� ��Ⱑ �ִ� ����� ��ȸ

-- SOCCER_SQL_027 
-- ���������� �ش� ������ ����  ���� ���Ű ��ȸ
-- ��, ���Ľ� ���Ű ��������

-- SOCCER_SQL_028 
-- ���Ű�� �Ｚ ������� ���� ���Ű���� ���� ���� 
-- �̸��� �ش� ���� ���Ű

-- SOCCER_SQL_029 
-- �巡����,FC����,��ȭõ�� ������ �� �Ҽ��� GK, MF ���� ����

-- SOCCER_SQL_030 
-- 29������ ������ ���� �������� �ƴ� �������� ��
