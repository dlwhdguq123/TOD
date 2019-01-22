SELECT * FROM TEAM;
-- SQL_TEST_001
-- ��ü �౸�� ���. �̸� ��������
SELECT TEAM_NAME
FROM TEAM
ORDER BY TEAM_NAME;
-- SQL_TEST_002
-- ������ ����(�ߺ�����,������ �����)
SELECT DISTINCT POSITION
FROM PLAYER;

-- SQL_TEST_003
-- ������ ����(�ߺ�����,������ �������� ����)
-- nvl2()���
SELECT DISTINCT NVL2(POSITION,POSITION,'����') ������
FROM PLAYER;

-- SQL_TEST_004
-- ������(ID: K02)��Ű��
SELECT PLAYER_NAME �̸�
FROM PLAYER
WHERE TEAM_ID LIKE 'K02' AND POSITION LIKE 'GK';

-- SQL_TEST_005
-- ������(ID: K02)Ű�� 170 �̻� ����
-- �̸鼭 ���� ���� ����
SELECT POSITION,PLAYER_NAME �̸�
FROM PLAYER
WHERE TEAM_ID LIKE 'K02' AND HEIGHT>=170 AND PLAYER_NAME LIKE '��%'; 
-- SQL_TEST_006
-- ������(ID: K02) ������ �̸�,
-- Ű�� ������ ����Ʈ (���� cm �� kg ����)
-- Ű�� �����԰� ������ "0" ǥ��
-- Ű ��������

    
-- SQL_TEST_007
-- ������(ID: K02) ������ �̸�,
-- Ű�� ������ ����Ʈ (���� cm �� kg ����)
-- Ű�� �����԰� ������ "0" ǥ��
-- BMI���� 
-- Ű ��������

-- SQL_TEST_008
-- ������(ID: K02) �� ������(ID: K10)������ �� 
--  �������� GK ��  ����
-- ����, ����� ��������

-- SQL_TEST_009
-- ������(ID: K02) �� ������(ID: K10)������ �� ��
-- Ű�� 180 �̻� 183 ������ ������
-- Ű, ����, ����� ��������



-- SOCCER_SQL_010
-- ��� ������ ��
-- �������� �������� ���� �������� ���� �̸�
-- ����, ����� ��������

