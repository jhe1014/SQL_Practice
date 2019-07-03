-- day 13

------------------------------------------------
-- ����Ŭ�� Ư���� �÷� 2���� : ����ڰ� ���� �� ��� �ڵ����� �����Ǵ� �÷�

-- 1. ROWID : ���������� ��ũ�� ����� ��ġ�� ����Ű�� ��
--            ������ ��ġ�̹Ƿ� �� ��� �ݵ�� ������ ���� �� �ۿ� ����
--            ORDER BY ���� ���� ������� �ʴ� ��

-- 2. ROWNUM : ��ȸ�� ����� ù���� ����� 1�� �����ϴ� ��

------------------------------------------------------------------------

-- ��) emp ���̺��� 'SMITH'�� ��ȸ

SELECT e.empno
     , e.ename
  FROM emp e
 WHERE e.ename = 'SMITH'
;

-- ROWID�� ���� ��ȸ

SELECT e.rowid
     , e.empno
     , e.ename
  FROM emp e
 WHERE e.ename = 'SMITH'
;

/*
ROWID,              EMPNO,  ENAME
--------------------------------------
AAAR9ZAAHAAAACXAAA	7369	SMITH
*/

-- ROWNUM�� ���� ��ȸ

SELECT rownum
     , e.empno
     , e.ename
  FROM emp e
 WHERE e.ename = 'SMITH'
;

/*
ROWNUM, EMPNO,  ENAME
--------------------------
1	    7369	SMITH
*/

------------------------------------------
-- ORDER BY���� ���� ROWNUM�� ����Ǵ� ��� Ȯ��
-- (1) ORDER BY�� ���� ���� ROWNUM

SELECT rownum
     , e.empno
     , e.ename
  FROM emp e
;

/*
ROWNUM, EMPNO,  ENAME
------------------------
1	    7777	JJ
2	    8888	J_JAMES
3	    7369	SMITH
4	    7499	ALLEN
5	    7521	WARD
6	    7566	JONES
7	    7654	MARTIN
8	    7698	BLAKE
9	    7782	CLARK
10	    7839	KING
11	    7844	TURNER
12	    7900	JAMES
13	    7902	FORD
14	    7934	MILLER
*/

-- (2) ename ������ �������� ���� �� ROWNUM �� Ȯ��

SELECT rownum
     , e.empno
     , e.ename
  FROM emp e
 ORDER BY e.ename
;

/*
4	7499	ALLEN
8	7698	BLAKE
9	7782	CLARK
13	7902	FORD
12	7900	JAMES
1	7777	JJ
6	7566	JONES
2	8888	J_JAMES
10	7839	KING
7	7654	MARTIN
14	7934	MILLER
3	7369	SMITH
11	7844	TURNER
5	7521	WARD
*/

-- => ROWNUM�� ORDER BY ����� ������ ���� �ʴ� ��ó�� ���� �� ����.
--    SUB-QUERY�� ����� �� ������ ����

-- (3) SUB-QUERY�� ���� �� ROWNUM�� �� Ȯ��

SELECT rownum
     , a.empno
     , a.ename
     , a.numrow
  FROM (SELECT rownum as numrow 
             , e.empno
             , e.ename
          FROM emp e
         ORDER BY e.ename) a
;

/*
ROWNUM, EMPNO,  ENAME, NUMROW
---------------------------------
1	    7499	ALLEN	4
2	    7698	BLAKE	8
3	    7782	CLARK	9
4	    7902	FORD	13
5	    7900	JAMES	12
6	    7777	JJ	    1
7	    7566	JONES	6
8	    8888	J_JAMES	2
9	    7839	KING	10
10	    7654	MARTIN	7
11	    7934	MILLER	14
12	    7369	SMITH	3
13	    7844	TURNER	11
14	    7521	WARD	5
*/

-- �̸��� A�� ���� ������� �̸� ������ ��ȸ

SELECT ROWNUM
     , e.ename
  FROM emp e
 WHERE e.ename LIKE '%A%'
 ORDER BY e.ename
;

/*
ROWNUM, ENAME
----------------
2	ALLEN
5	BLAKE
6	CLARK
7	JAMES
1	J_JAMES
4	MARTIN
3	WARD
*/

-- �̸��� S�� ���� ������� ��ȸ

SELECT ROWNUM
     , e.rowid
     , e.ename
  FROM emp e
 WHERE e.ename LIKE '%S%'
 ORDER BY e.ename
;

/*
ROWNUM, ROWID,              ENAME
----------------------------------
4	    AAAR9ZAAHAAAACXAAJ	JAMES
3	    AAAR9ZAAHAAAACXAAD	JONES
1	    AAAR9ZAAHAAAACWAAB	J_JAMES
2	    AAAR9ZAAHAAAACXAAA	SMITH
*/

-- �̸��� S�� ���� ������� ��ȸ����� SUB-QUERY�� ������ ���� ROWNUM, ROWID Ȯ��

SELECT ROWNUM
     , a.rowid
     , a.ename
  FROM (SELECT e.rowid
             , e.ename
          FROM emp e
         WHERE e.ename LIKE '%S%'
         ORDER BY e.ename ) a
;

/*
ROWNUM, ROWID,              ENAME
--------------------------------
1	    AAAR9ZAAHAAAACXAAJ	JAMES
2	    AAAR9ZAAHAAAACXAAD	JONES
3	    AAAR9ZAAHAAAACWAAB	J_JAMES
4	    AAAR9ZAAHAAAACXAAA	SMITH
*/

-- ROWNUM���� �� �� �ִ� ����
-- emp���� �޿��� ���� �޴� ���� 5���� ��ȸ�Ͻÿ�.

-- 1. �޿��� ���� ���� ����

SELECT e.empno
     , e.ename
     , e.sal
  FROM emp e
 ORDER BY e.sal DESC
;

/*
EMPNO,  ENAME,  SAL
-----------------------
7839	KING	5000
7902	FORD	3000
7566	JONES	2975
7698	BLAKE	2850
7782	CLARK	2450
7499	ALLEN	1600
7844	TURNER	1500
7934	MILLER	1300
7521	WARD	1250
8888	J_JAMES	1250
7654	MARTIN	1250
7900	JAMES	950
7777	JJ	    900
7369	SMITH	800
*/

-- 2. 1�� ����� SUB-QUERY�� FROM ���� ����Ͽ� ROWNUM�� ���� ��ȸ

SELECT ROWNUM
     , a.*
  FROM (SELECT e.empno
             , e.ename
             , e.sal
          FROM emp e
         ORDER BY e.sal DESC) a
;
         
/*
ROWNUM, EMPNO,  ENAME,  SAL
-----------------------------
1	    7839	KING	5000
2	    7902	FORD	3000
3	    7566	JONES	2975
4	    7698	BLAKE	2850
5	    7782	CLARK	2450
6	    7499	ALLEN	1600
7	    7844	TURNER	1500
8	    7934	MILLER	1300
9	    7521	WARD	1250
10	    8888	J_JAMES	1250
11  	7654	MARTIN	1250
12	    7900	JAMES	950
13	    7777	JJ	    900
14	    7369	SMITH	800
*/

-- 3. �� ��, ROWNUM < = 5 ������ �߰�

SELECT ROWNUM
     , a.*
  FROM (SELECT e.empno
             , e.ename
             , e.sal
          FROM emp e
         ORDER BY e.sal DESC) a
;

/*
ROWNUM, EMPNO, ENAME, SAL
-----------------------------
1	7839	KING	5000
2	7902	FORD	3000
3	7566	JONES	2975
4	7698	BLAKE	2850
5	7782	CLARK	2450
6	7499	ALLEN	1600
7	7844	TURNER	1500
8	7934	MILLER	1300
9	7521	WARD	1250
10	8888	J_JAMES	1250
11	7654	MARTIN	1250
12	7900	JAMES	950
13	7777	JJ	    900
14	7369	SMITH	800
*/

--------------------------------------------------------------

-- DML : ������ ���۾�

-- 1) INSERT : ���̺� ������ ��(row)�� �߰��ϴ� ���

DROP TABLE member;

CREATE TABLE member
(  member_id   VARCHAR2(4)
 , member_name VARCHAR(15)  NOT NULL
 , phone       VARCHAR2(4)  -- NULL ����Ϸ��� ���������� �Ⱦ��� �ȴ�.
 , reg_date    DATE         DEFAULT sysdate
 , address     VARCHAR2(30)
 , major       VARCHAR2(50)
 , birth_month NUMBER(2)
 , gender      VARCHAR2(1)
 , CONSTRAINT PK_MEMBER PRIMARY KEY (member_id)
 , CONSTRAINT CK_GENDER CHECK (gender IN ('F', 'M'))
 , CONSTRAINT CK_BIRTH CHECK (birth_month BETWEEN 1 AND 12)
);

-- 1. INTO ������ �÷��̸� ���� �� ������ �߰�
--    : VALUES ���� �ݵ�� ��ü �÷��� �����͸� ������� ��� ����

INSERT INTO MEMBER VALUES ('M001', '�ڼ���', '9155', sysdate, '������', '����', '3', 'M');
INSERT INTO MEMBER VALUES ('M002', '������', '1418', sysdate, '������',  NULL, NULL, 'M');

/*
INSERT INTO MEMBER VALUES ('M002', '������', '1418', sysdate, '������', 'M');
-- ��ó�� VALUES ���� ������ ���� ������ ��ü �÷� ���� ��ġ���� ������ �Ʒ��� ���� ������ �߻��ϹǷ�, NULL�Է��� �ؼ��� ���� ������ ���߾�� �Ѵ�.
*/

INSERT INTO MEMBER VALUES ('M003', '�̺���', '0186', sysdate, NULL, NULL, '3', 'M');
INSERT INTO MEMBER VALUES ('M004', '�蹮��', NULL, sysdate, 'û�ֽ�', '�Ͼ�', '3', 'F');
INSERT INTO MEMBER VALUES ('M005', '����ȯ', '0322', sysdate, '�Ⱦ��', '����', '3', NULL);
COMMIT;

-- PK �������ǿ� ���ݵǴ� ������ �߰� �õ�

INSERT INTO MEMBER VALUES ('M005', 'ȫ�浿', '0001', sysdate, '������', '����', 3, 'M');
-- ORA-00001: ���Ἲ ���� ����(SCOTT.PK_MEMBER)�� ����˴ϴ�

-- GENDER �÷��� CHECK ���������� �����ϴ� ������ �߰� �õ�
-- GENDER �÷���, 'F', 'M', NULL���� �ٸ� ���� �߰��ϸ�

INSERT INTO MEMBER VALUES ('M005', 'ȫ�浿', '0001', sysdate, '������', '����', 3, 'G');
-- ORA-02290: üũ ��������(SCOTT.CK_GENDER)�� ����Ǿ����ϴ�

-- BIRTH_MONTH �÷��� 1 ~ 12 ���� ���ڰ� �Է� �õ�
INSERT INTO MEMBER VALUES ('M005', 'ȫ�浿', '0001', sysdate, '������', '����', 0, 'M');
-- ORA-02290: üũ ��������(SCOTT.CK_BIRTH)�� ����Ǿ����ϴ�

-- MEMBER_NAME�� NULL �Է� �õ�
INSERT INTO MEMBER VALUES ('M006', NULL, '0001', sysdate, '������', '����', 5, 'M');
-- ORA-01400: NULL�� ("SCOTT"."MEMBER"."MEMBER_NAME") �ȿ� ������ �� �����ϴ�

INSERT INTO MEMBER VALUES ('M006', 'ȫ�浿', '0001', sysdate, '������', '����', 5, 'M');

-- 2. INTO���� �÷� �̸��� ����� ����� ������ �߰�
--    : VALUES ���� INTO�� ������� ���� Ÿ��, ������ ���߾ �ۼ�

INSERT INTO MEMBER (member_id, member_name) VALUES ('M007', '������');
COMMIT;

INSERT INTO MEMBER (member_id, member_name, gender) VALUES('M008', '������', 'M');
COMMIT;

-- ����� member_id, member_name, reg_date, gender �÷��鿡 ���� �� �� Ȯ��

-- ���̺� ���� ������ ������� INTO���� �÷��� ������ �� �ִ�.

INSERT INTO MEMBER (birth_month, member_name, member_id) VALUES (7, '������', 'M009');
COMMIT;

-- INTO���� �÷� ������ VALUES���� ���� ���� ����ġ

INSERT INTO MEMBER(member_id, member_name, gender) VALUES ('M010', '���');
/*
SQL ����: ORA-00947: ���� ���� ������� �ʽ��ϴ�
00947. 00000 -  "not enough values"
*/

-- INTO���� VALUES���� ������ ������ ���� Ÿ���� ��ġ���� ���� ��
-- ���� ������ �÷��� birth_month�� '�Ѿ�'�̶�� ���ڸ� �߰��Ϸ��ϴ� �õ�

INSERT INTO MEMBER(member_id, member_name, birth_month) VALUES ('M010', '���', '�Ѿ�');
--ORA-01722: ��ġ�� �������մϴ�

-- �ʼ� �Է� �÷��� �������� ���� ��
-- member_id : PK, member_name : NOT NULL

INSERT INTO MEMBER (birth_month, address, gender) VALUES (12, '��������', 'F');
-- ORA-01400: NULL�� ("SCOTT"."MEMBER"."MEMBER_ID") �ȿ� ������ �� �����ϴ�

-------------------------------------------------------------------------------------

-- ���� �� �Է� : SUB-QUERY�� ����Ͽ� ����

-- ��������

INSERT INTO ���̺��̸�
SELECT ����; -- ��������

/*
CREATE TABLE ���̺��̸�
AS
SELECT .....
: ���������� �����͸� �����ϸ鼭 �� ���̺��� ����

vs.

INSERT INTO ���̺��̸�
SELECT ����;
:�̹� ������� ���̺� �����͸� �����ؼ� �߰�
*/

-- new_member ����

DROP TABLE new_member;

-- member �����ؼ� ���̺� ����
CREATE TABLE new_member
AS
SELECT m.*
  FROM member m
 WHERE 1 = 2
;

-- ���� �� �Է� ���������� new_member ���̺� ������ �߰�
INSERT INTO new_member
SELECT m.*
  FROM member m
 WHERE m.member_name LIKE '_��_'
;
COMMIT;

--------------------------------------------------------------

-- �÷��� ����� ������ �Է�

INSERT INTO new_member (member_id, member_name, phone)
SELECT m.member_id
     , m.member_name
     , m.phone
  FROM member m
 WHERE m.member_id < 'M004'
;

-- new_member�� �߰��� �� ��� ����
DELETE new_member;
COMMIT;

UPDATE "SCOTT"."MEMBER"
   SET BIRTH_MONTH = '1'
 WHERE MEMBERID = 'M001';

UPDATE "SCOTT"."MEMBER"
   SET BIRTH_MONTH = '2'
 WHERE MEMBERID = 'M002';
 
UPDATE "SCOTT"."MEMBER"
   SET BIRTH_MONTH = '3'
 WHERE MEMBERID = 'M003';
 
-----------------------------------------------------
-- ����) new_member���̺� member ���̺�κ��� �����͸� �����Ͽ� ������ �Է��� �Ͻÿ�.
--       ��, member ���̺��� �����Ϳ��� birth_month�� Ȧ������ ����鸸 ��ȸ�Ͽ� �Է��Ͻÿ�.

DROP TABLE new_member;

CREATE TABLE new_member
AS
SELECT m.*
  FROM member m
 WHERE 1 = 2
;

INSERT INTO new_member
SELECT m.*
  FROM member m
 WHERE MOD(m.birth_month, 2) = 1 
;
COMMIT;

--------------------------------------------------------------------------
-- 2) UPDATE : ���̺��� ��(���ڵ�)�� ����
--             WHERE �������� ���տ� ���� 1�ุ �����ϰų� ���� �� ������ ����
--             ���� ���� �����Ǵ� ���� �ſ� ���ǰ� �ʿ�!!

-- UPDATE ���� ����

UPDATE ���̺� �̸�
   SET �÷�1 = ��1
     [,�÷�2 = ��2]
     ....
     [,�÷�n = ��n]
[WHERE ����]
;

-- ��) ȫ�浿�� �̸��� �����õ�

UPDATE member m -- ���̺� ��Ī
   SET m.member_name = '�浿��'
 WHERE m.member_id = 'M006'
 -- PK�� ã�ƾ� ��Ȯ�� ȫ�浿 ���� ã�ư� �� ����
;

-- ��) �蹮�� ����� ��ȭ��ȣ ���ڸ� ������Ʈ
--     �ʱ⿡ INSERT �� NULL�� �����͸� ���� ���� ���
--     �Ŀ� ������ ������ �߻��� �� �ִ�.
--     �̷� ��� UPDATE �������� ó��.

UPDATE member m
   SET m.phone = '1392'
 WHERE m.member_id = 'M004'
;
COMMIT;

-- ��) ������(M009) ����� ������ ����
-- ������

UPDATE member m
   SET m.major = '������'
 -- WHERE m.member_id = "M009' -- �Ǽ��� WHERE ����
 ;

/* 9�� �� ��(��) ������Ʈ�Ǿ����ϴ�.
   : WHERE ������ ���������� ��� �࿡ ���ؼ� major �÷��� ��� ������ �Ͼ ���
   
   ==> DML �۾� �Ǽ�
       ������: �׷��� UPDATE ���� ������ �ƴ϶�� ��.
*/

-- ���� COMMIT �۾����� �ǵ����� ROLLBACK ������� �߸��� ������Ʈ �ǵ�����

ROLLBACK;
-- �ѹ� �Ϸ�.
-- M004 ����� ��ȭ��ȣ�� ������Ʈ �� ���� ������ Ŀ���̹Ƿ� �� ������ �����ͷ� ����

-- ��Ȯ�� M009 ����� major ������Ʈ ����

UPDATE member m
   SET m.major = '������'
 WHERE m.member_id = 'M009';
COMMIT;

-- ���� �÷� ������Ʈ(2�� �̻��� �÷� �� ���� ������Ʈ)
-- ��) ������(M008) ����� ��ȭ��ȣ, �ּ�, ������ �� ���� ������Ʈ

UPDATE member m
   SET m.phone = '4119'
     , m.address = '�ƻ��'
     , m.major = '�Ͼ�'
 WHERE m.member_id = 'M008'
;
COMMIT;

-- ��) '�Ⱦ��'�� ��� '����ȯ' ����� GENDER ���� ����
--      WHERE ���ǿ� �ּҸ� ���ϴ� ������ ���� ���

UPDATE member m
   SET m.gender = 'M'
 WHERE m.address = '�Ⱦ��'
;
-- WHERE ������ ����(X), WHERE ������ ���� ����(X)

ROLLBACK;

-- ���� �������� ���� �����۵��� ��ó�� �������� �����Ͱ� �پ������� ���۵��� ������ �ִ� �����̴�.
-- ���� UPDATE �ۼ� �ÿ��� WHERE ������ �ۼ� �� ���Ǹ� ��￩�� ��.

-- 1���� �����ϴ� �����̶�� �ݵ�� PK �÷��� ���ؾ��Ѵ�.
-- PK �÷��� ��ü �࿡�� �����ϰ� NOT NULL�� ����Ǵ� �÷��̹Ƿ� �ݵ�� �� ���� ã�� �� �ִ� ���̱� ������, PK ����� �����.

-- UPDATE ������ SELECT ���������� ���
-- ��) ������(M008) ����� major�� ������(M002) ����� major�� ����

-- 1) M008�� major�� ���ϴ� SELECT

SELECT m.major
  FROM member m
 WHERE m.member_id = 'M008'
;

-- 2) M002 ����� major�� �����ϴ� UPDATE ���� 

UPDATE member m
   SET m.major = ?
 WHERE m.member_id = 'M002'
;

-- 3) (1)�� ����� (2) UPDATE ������ ����

UPDATE member m
   SET m.major = (SELECT m.major
                    FROM member m
                   WHERE m.member_id = 'M008')
 WHERE m.member_id = 'M002'
;
COMMIT;

-- ���� SET ���� ����ϴ� ���������� ����� ��Ȯ�ϰ� 1�� 1���� 1���� ���� �ƴ� ��� ���� ����

UPDATE member m
   SET m.major = (SELECT m.major
                    FROM member m)
 WHERE m.member_id = 'M002'
;
-- ORA-01427: ���� �� ���� ���ǿ� 2�� �̻��� ���� ���ϵǾ����ϴ�.

UPDATE member m
   SET m.major = (SELECT m.major
                       , m.member_name
                    FROM member m
                   WHERE m.member_id = 'M008')
 WHERE m.member_id = 'M002'
;
--SQL ����: ORA-00913: ���� ���� �ʹ� �����ϴ�

-- UPDATE �� �������� �����ϴ� ���
-- ��) M001 member_id ������ �õ� : PK �÷����� �ߺ� ������ �����ϴ� ���

UPDATE member m
   SET m.member_id = 'M002'
 WHERE m.member_id = 'M001'
;
-- ORA-00001: ���Ἲ ���� ����(SCOTT.PK_MEMBER)�� ����˴ϴ�

UPDATE member m
   SET m.member_name = NULL
 WHERE m.member_id = 'M001'
;
-- ORA-01407: NULL�� ("SCOTT"."MEMBER"."MEMBER_NAME")�� ������Ʈ�� �� �����ϴ�

-- ��) M001 �����Ϳ� ���ؼ� birth_month�� -1�� �����õ�

UPDATE member m
   SET m.birth_month = -1
 WHERE m.member_id = 'M001'
;
--ORA-02290: üũ ��������(SCOTT.CK_BIRTH)�� ����Ǿ����ϴ�

-------------------------------------------------------------------------------
-- ������ �ǽ�

-- 1) PHONE �÷��� NULL�� ������� �ϰ������� '0000'���� ������Ʈ
--    PK�� �� �ʿ� ���� ����

UPDATE member m
   SET m.phone = '0000'
 WHERE m.phone IS NULL
;

-- 2) M001 ����� ������ NULL ������ ������Ʈ
--    PK�� �ɾ �����ؾ��ϴ� ����

UPDATE member m
   SET m.major = NULL
 WHERE m.member_id = 'M001'  
;

-- 3) ADDRESS �÷��� NULL�� ������� �ϰ������� '�ƻ��'�� ������Ʈ
--    PK�� �� �ʿ� ���� ����

UPDATE member m
   SET m.address = '�ƻ��'
 WHERE m.address IS NULL
;

-- 4) M009 ����� NULL �����͸� ��� ������Ʈ
--    PHONE : 3581
--    ADDRESS : õ�Ƚ�
--    GENDER : M

UPDATE member m
   SET m.phone = '3581'
     , m.address = 'õ�Ƚ�'
     , m.gender = 'M'
 WHERE m.member_id = 'M009'
;

COMMIT;