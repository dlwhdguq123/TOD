-- SOCCER_SQL_011
-- ���� ��Ÿ����� �����Ͽ�
-- ���̸�, ��Ÿ��� �̸� ���

SELECT T.TEAM_NAME ��, S.STADIUM_NAME ��Ÿ���
FROM TEAM T
    JOIN STADIUM S
        ON T.STADIUM_ID LIKE S.STADIUM_ID;

-- SOCCER_SQL_012
-- ���� ��Ÿ���, �������� �����Ͽ�
-- 2012�� 3�� 17�Ͽ� ���� �� ����� 
-- ���̸�, ��Ÿ���, ������� �̸� ���
-- �������̺� join �� ã�Ƽ� �ذ��Ͻÿ�.
SELECT T.TEAM_NAME Ȩ��, S.STADIUM_NAME ��Ÿ���, C.AWAYTEAM_ID ������ID, C.SCHE_DATE �����쳯¥
FROM STADIUM S
    JOIN TEAM T
        ON T.STADIUM_ID LIKE S.STADIUM_ID
    JOIN SCHEDULE C
        ON S.STADIUM_ID LIKE C.STADIUM_ID
WHERE C.SCHE_DATE LIKE '20120317';
-- SOCCER_SQL_013
-- 2012�� 3�� 17�� ��⿡ 
-- ���� ��ƿ���� �Ҽ� ��Ű��(GK)
-- ����, ������,���� (����������), 
-- ��Ÿ���, ��⳯¥�� ���Ͻÿ�
-- �������� ���̸��� ������ ���ÿ�
SELECT P.PLAYER_NAME ������, 
             P.POSITION ������,
               T.REGION_NAME||' '||T.TEAM_NAME ����,
                S.STADIUM_NAME ��Ÿ���, 
                C.SCHE_DATE ��¥
FROM STADIUM S
        JOIN SCHEDULE C
            ON C.STADIUM_ID LIKE S.STADIUM_ID
        JOIN TEAM T      
            ON T.STADIUM_ID LIKE S.STADIUM_ID
        JOIN PLAYER P
            ON P.TEAM_ID LIKE T.TEAM_ID 
WHERE C.SCHE_DATE LIKE '20120317' AND P.POSITION LIKE 'GK' AND T.TEAM_NAME LIKE '��ƿ����'
;
     

-- SOCCER_SQL_014
-- Ȩ���� 3���̻� ���̷� �¸��� ����� 
-- ����� �̸�, ��� ����
-- Ȩ�� �̸��� ������ �̸���
-- ���Ͻÿ�

SELECT 
    S.STADIUM_NAME ��Ÿ���,
    C.SCHE_DATE ��⳯¥,
    HT.REGION_NAME || ' '||HT.TEAM_NAME Ȩ��,
    AT.REGION_NAME || ' '||AT.TEAM_NAME ������,
    C.HOME_SCORE "Ȩ�� ����",
    C.AWAY_SCORE "������ ����"
FROM 
    SCHEDULE C 
    JOIN STADIUM S
        ON C.STADIUM_ID LIKE S.STADIUM_ID
    JOIN TEAM HT 
        ON S.HOMETEAM_ID LIKE HT.TEAM_ID
    JOIN TEAM AT
        ON C.AWAYTEAM_ID LIKE AT.TEAM_ID
WHERE C.HOME_SCORE - C.AWAY_SCORE >= 3  
ORDER BY C.SCHE_DATE ; 

-- SOCCER_SQL_015
-- STADIUM �� ��ϵ� ��� �߿���
-- Ȩ���� ���� �������� ���� ��������
-- ī��Ʈ ���� 20

--1�ܰ�
SELECT S.STADIUM_NAME, 
        S.STADIUM_ID,
         S.SEAT_COUNT , S.HOMETEAM_ID , T.E_TEAM_NAME
FROM STADIUM S
        LEFT JOIN TEAM T
            ON S.STADIUM_ID LIKE T.STADIUM_ID ;

--2�ܰ�
SELECT S.STADIUM_NAME, 
        S.STADIUM_ID,
         S.SEAT_COUNT , S.HOMETEAM_ID , 
         (SELECT T.E_TEAM_NAME 
          FROM TEAM T 
          WHERE S.STADIUM_ID LIKE T.STADIUM_ID)
FROM STADIUM S;

-- SOCCER_SQL_016
-- ���Ű�� ��õ ������Ƽ������ ���Ű ���� ���� ���� 
-- ��ID, ����, ���Ű ����
	
    --1�ܰ�
	SELECT P.TEAM_ID ��ID,T.TEAM_NAME ���̸�, AVG(P.HEIGHT) ���Ű
	 FROM TEAM T
            JOIN PLAYER P
                ON T.TEAM_ID LIKE P.TEAM_ID
     GROUP BY P.TEAM_ID,T.TEAM_NAME
     ORDER BY ���Ű;
     ;

    --2�ܰ�
	SELECT P.TEAM_ID ��ID,T.TEAM_NAME ���̸�, ROUND(AVG(P.HEIGHT),2) ���Ű
	 FROM TEAM T
            JOIN PLAYER P
                ON T.TEAM_ID LIKE P.TEAM_ID
     GROUP BY P.TEAM_ID,T.TEAM_NAME
     HAVING AVG(P.HEIGHT) < (SELECT AVG(P.HEIGHT)
                               FROM TEAM T
                                 JOIN PLAYER P
                                    ON T.TEAM_ID LIKE P.TEAM_ID
                                    WHERE T.TEAM_NAME LIKE '������Ƽ��')
     ORDER BY ���Ű;


           
-- SOCCER_SQL_017
-- �������� MF �� ��������  �Ҽ����� �� ������, ��ѹ� ���
SELECT T.TEAM_NAME �Ҽ�����,P.PLAYER_NAME ����,P.BACK_NO ��ѹ�
FROM PLAYER P
        JOIN TEAM T
            ON T.TEAM_ID LIKE P.TEAM_ID
WHERE P.POSITION LIKE 'MF'
ORDER BY P.PLAYER_NAME 
  ;

-- SOCCER_SQL_018
-- ���� Űū ���� 5 ����, ����Ŭ, �� Ű ���� ������ ����
SELECT PLAYER_NAME �̸�,BACK_NO ��ѹ�,POSITION ������,HEIGHT Ű
FROM (SELECT PLAYER_NAME,BACK_NO,POSITION,HEIGHT
        FROM PLAYER
        WHERE HEIGHT IS NOT NULL
        ORDER BY HEIGHT DESC)
WHERE ROWNUM BETWEEN 1 AND 5
;


-- SOCCER_SQL_019
-- ���� �ڽ��� ���� ���� ���Ű���� ���� ���� ���� ���
SELECT *
FROM PLAYER P
    JOIN TEAM T
        ON P.TEAM_ID LIKE T.TEAM_ID;
--2�ܰ�
SELECT *
FROM PLAYER P
    JOIN TEAM T
        ON P.TEAM_ID LIKE T.TEAM_ID
WHERE P.HEIGHT<175
        ;
--3�ܰ�
SELECT T.TEAM_NAME ����,P.PLAYER_NAME ������,P.POSITION ������,P.BACK_NO ��ѹ�,P.HEIGHT Ű
FROM PLAYER P
    JOIN TEAM T
        ON P.TEAM_ID LIKE T.TEAM_ID
WHERE P.HEIGHT< (SELECT AVG(P2.HEIGHT)
                            FROM PLAYER P2
                            WHERE P2.TEAM_ID LIKE P.TEAM_ID
                            
                            )
ORDER BY P.PLAYER_NAME
;

-- SOCCER_SQL_020
-- 2012�� 5�� �Ѵް� ��Ⱑ �ִ� ����� ��ȸ
-- EXISTS ������ �׻� ���������� ����Ѵ�.
-- ���� �ƹ��� ������ �����ϴ� ���� ���� ���̶�
-- ������ �����ϴ� 1�Ǹ� ã���� �߰����� �˻��� �������� �ʴ´�.

SELECT S.STADIUM_ID ID , S.STADIUM_NAME ������
FROM STADIUM S
WHERE EXISTS (SELECT 1
                FROM SCHEDULE C
                WHERE C.STADIUM_ID LIKE S.STADIUM_ID
                AND C.SCHE_DATE BETWEEN '20120501' AND '20120531');


