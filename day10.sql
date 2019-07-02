-- 9. �⵵��, ���� �Ի� �ο��� ���Ͻÿ�.
--  : (1) hiredate�� Ȱ��
--    (2) hiredate���� �⵵, ���� ����
--    (3) ����� �� ���� �׷�ȭ �������� ���

-- a) �⵵ ���� : TO_CHAR(e.hiredate, 'YYYY')
--    �� ���� : TO_CHAR(e.hiredate, 'MM')

-- b) �� ���� �������� �׷�ȭ ����
SELECT TO_CHAR(e.hiredate, 'YYYY') "�Ի�⵵"
     , TO_CHAR(e.hiredate, 'MM') "�Ի� ��"
     , COUNT(*) "�ο�(��)"
FROM emp e
GROUP BY TO_CHAR(e.hiredate, 'YYYY'), TO_CHAR(e.hiredate, 'MM')
ORDER BY "�Ի�⵵", "�Ի� ��"
;

-- c) �⵵��, ���� �Ի� �ο��� ����� ���� ǥ ���·� ��ȯ

-- : �⵵ ���� : TO_CHAR(e.hiredate, 'YYYY')
--   �� ���� : TO_CHAR(e.hiredate, 'MM')

-- : hiredate���� ������ ���� ���� 01�� ���� ��
--   �� ���� ���� ������ 1������ ī��Ʈ (COUNT())
--   �� ������ 12������ �ݺ�

SELECT e.empno
     , e.ename
     , TO_CHAR(e.hiredate, 'YYYY') "�Ի� �⵵"
     , TO_CHAR(e.hiredate, 'MM') "�Ի� ��"
     , DECODE(TO_CHAR(e.hiredate, 'MM'), '01', 1, 0) "1��"
     , DECODE(TO_CHAR(e.hiredate, 'MM'), '02', 1, 0) "2��"
     , DECODE(TO_CHAR(e.hiredate, 'MM'), '03', 1, 0) "3��"
     , DECODE(TO_CHAR(e.hiredate, 'MM'), '04', 1, 0) "4��"
     , DECODE(TO_CHAR(e.hiredate, 'MM'), '05', 1, 0) "5��"
     , DECODE(TO_CHAR(e.hiredate, 'MM'), '06', 1, 0) "6��"
     , DECODE(TO_CHAR(e.hiredate, 'MM'), '07', 1, 0) "7��"
     , DECODE(TO_CHAR(e.hiredate, 'MM'), '08', 1, 0) "8��"
     , DECODE(TO_CHAR(e.hiredate, 'MM'), '09', 1, 0) "9��"
     , DECODE(TO_CHAR(e.hiredate, 'MM'), '10', 1, 0) "10��"
     , DECODE(TO_CHAR(e.hiredate, 'MM'), '11', 1, 0) "11��"
     , DECODE(TO_CHAR(e.hiredate, 'MM'), '12', 1, 0) "12��"
  FROM emp e
 ORDER BY "�Ի� �⵵"
;

-- �׷�ȭ ���� �÷��� "�Ի� �⵵"�� ��´�.
-- �� ���� 1�� ~ 12���� 1�� �����ϴ� ������ ����� �ϹǷ� COUNT() ���
SELECT TO_CHAR(e.hiredate, 'YYYY') "�Ի� �⵵"
     , COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '01', 1)) "1��"
     , COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '02', 1)) "2��"
     , COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '03', 1)) "3��"
     , COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '04', 1)) "4��"
     , COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '05', 1)) "5��"
     , COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '06', 1)) "6��"
     , COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '07', 1)) "7��"
     , COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '08', 1)) "8��"
     , COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '09', 1)) "9��"
     , COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '10', 1)) "10��"
     , COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '11', 1)) "11��"
     , COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '12', 1)) "12��"
  FROM emp e
 GROUP BY TO_CHAR(e.hiredate, 'YYYY')
 ORDER BY "�Ի� �⵵"
;

-- ���� �� �Ի� �ο��� ���� ���η� ���
-- �׷�ȭ ���� �÷��� �ʿ� ����
SELECT '�ο�(��)' AS "�Ի� ��"
     , COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '01', 1)) "1��"
     , COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '02', 1)) "2��"
     , COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '03', 1)) "3��"
     , COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '04', 1)) "4��"
     , COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '05', 1)) "5��"
     , COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '06', 1)) "6��"
     , COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '07', 1)) "7��"
     , COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '08', 1)) "8��"
     , COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '09', 1)) "9��"
     , COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '10', 1)) "10��"
     , COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '11', 1)) "11��"
     , COUNT(DECODE(TO_CHAR(e.hiredate, 'MM'), '12', 1)) "12��"
  FROM emp e group by '�ο�(��)'
;

-- day 10
---- 7. ���ΰ� ��������
-- (1) ���� : JOIN
--     �ϳ� �̻��� ���̺��� �������� ��� �ϳ��� ���̺��� ��ó�� �ٷ�� ���
--     ������ �߻���Ű���� FROM ���� ���ο� ����� ���̺��� ����

-- ����) ������ �Ҽ� �μ� ��ȣ�� �ƴ� �μ� ���� ���� ��ȸ�ϰ� �ʹ�.
-- a) FROM ���� ���̺��� ����
--    emp, dept �� ���̺��� ���� ==> ������ �߻� ==> �� ���̺��� ��� ����

/* 7777, 8888 ���� ���� ����

DELETE FROM "SCOTT"."EMP" WHERE EMPNO = 7777
DELETE FROM "SCOTT"."EMP" WHERE EMPNO = 8888

COMMIT;
*/

SELECT e.empno
     , e.ename
     , e.deptno
     , '|' "������"
     , d.deptno
     , d.dname
  FROM emp e
     , dept d
;

-- ==> (emp) 12 x (dept) 4 = 48 ���� �����Ͱ� �������� ����

-- b) ���� ������ �߰��Ǿ�� ������ �Ҽ� �μ��� ��Ȯ�� ������ �� �ִ�.

SELECT e.empno
     , e.ename
     , e.deptno
     , '|' "������"
     , d.deptno
     , d.dname
  FROM emp e
     , dept d
 WHERE e.deptno = d.deptno -- ����Ŭ�� �������� ���� ���� �ۼ� ���
 ORDER BY d.deptno
;

-- ���, �̸�, �μ��� �����

SELECT e.empno
     , e.ename
     , e.deptno
     , '|' "������"
     , d.deptno
     , d.dname
  FROM emp e
     , dept d
 WHERE e.deptno = d.deptno -- ����Ŭ�� �������� ���� ���� �ۼ� ���
 ORDER BY d.deptno
;

-- ���� �����ڸ� ����Ͽ� ���� (�ٸ� DBMS���� �ַ� ���)
SELECT e.empno
     , e.ename
     , e.deptno
     , d.dname
  FROM emp e JOIN dept d ON (e.deptno = d.deptno)
 ORDER BY d.deptno
;

-- ���� ������� ACCOUNTING �μ� ������ �˰� �ʹ�.
-- 10   �μ� ������ ��ȸ�Ͽ���

SELECT e.empno
     , e.ename
  FROM emp e
 WHERE e.deptno = 10
;

SELECT e.empno
     , e.ename
     , d.dname
  FROM emp e
     , dept d
 WHERE e.deptno = d.deptno -- ��������
   AND d.dname = 'ACCOUNTING' -- �Ϲ�����
;

-- ACCOUNTING �μ� �Ҽ��� ���� ��ȸ��
-- ���� �����ڸ� ����� ������ �����غ��ÿ�.

SELECT e.empno
     , e.ename
     , d.dname
  FROM emp e JOIN dept d ON (e.deptno = d.deptno) -- ��������
  WHERE d.dname = 'ACCOUNTING' -- �Ϲ�����
;

-- 2) ���� : īƼ�� �� (ī��� ����)
--           ���� ��� ���̺��� �����͸� ������ ��� �������� ���� ��
--           WHERE ���� ���� ���� ������ �߻�
--           CROSS JOIN �����ڷ� �߻���Ŵ(����Ŭ 9i ���� ���ķ� ��밡��)

--  emp, dept, salgrade �� ���� Ÿ������ īƼ�� �� �߻�

SELECT e.ename
     , d.dname
     , s.grade
  FROM emp e
     , dept d
     , salgrade s
;

-- ==> 12 x 4 x 5 = 240  ���� ��� �߻�

-- CROSS JOIN �����ڸ� ����ϸ�
SELECT e.ename
     , d.dname
     , s.grade
  FROM emp e CROSS JOIN dept d
             CROSS JOIN salgrade s
;

-- 3) EQUI JOIN : ������ ���� �⺻ ����
--                ���� ��� ���̺� ������ ���� �÷��� '='�� ����
--                ���� �÷��� (join-attribute)��� �θ�

-- a) ����Ŭ ���� ������� 
SELECT e.empno
     , e.ename
     , e.deptno
     , '|' "������"
     , d.deptno
     , d.dname
  FROM emp e
     , dept d
 WHERE e.deptno = d.deptno -- ����Ŭ�� �������� ���� ���� �ۼ� ���
 ORDER BY d.deptno
;

-- b) JOIN ~ ON
SELECT e.empno
     , e.ename
     , e.deptno
     , d.dname
  FROM emp e JOIN dept d ON (e.deptno = d.deptno)
 ORDER BY d.deptno
;

-- c) NATURAL JOIN Ű����� �ڵ� ����
--    : ON ���� ����
--      join-attribute�� ����Ŭ DBMS�� �ڵ����� �Ǵ�

SELECT e.empno
     , e.ename
     , d.dname
  FROM emp e NATURAL JOIN dept d -- ���� ���� �÷� ��ð� ����.
;

-- d) JOIN ~ USING

SELECT e.empno
     , e.ename
     , d.dname
 FROM emp e JOIN dept d USING (deptno)
; -- USING �ڿ� ���� �÷��� ��Ī ���� ���


-- 4) �� ���� EQUI-JOIN ���� �ۼ���
-- a) ����Ŭ ���� ���� ����

SELECT [��Ī 1.]�÷���1, [��Ī2.]�÷���2
  FROM ���̺� 1 ��Ī 1, ���̺� 2 ��Ī2 [, ...]
 WHERE ��Ī1.�����÷�1 = ��Ī2.�����÷�1 -- �������� WHERE ����
  [AND ��Ī1.�����÷�2 = ��Īn.�����÷�2] -- ���δ�� ���̺��� �������� ���
  [AND ... ]                              -- WHERE ���� �����Ǵ� �������ǵ� �þ
  [AND ... �߰� ������ �Ϲ� ���ǵ�]
;

-- b) JOIN ~ ON

SELECT [��Ī1.]�÷���1, [��Ī2.] �÷���2[, ...]
  FROM ���̺�1 ��Ī1 JOIN ���̺� 2 ��Ī2 ON (��Ī1.�����÷�1 = ��Ī2.�����÷�1)
                    [JOIN ���̺� 3 ��Ī3 ON (��Ī1.�����÷�2 = ��Ī3.�����÷�2)
                    [JOIN ���̺� n ��Īn ON (��Īn-1.�����÷�n-1 = ��Īn.�����÷�n-1)
[WHERE �Ϲ�����]
  [AND �Ϲ�����]
  
-- c) NATURAL JOIN

SELECT [��Ī1.]�÷���1, [��Ī2.]�÷���2[, ...]
  FROM ���̺�1 ��Ī1 NATURAL JOIN ���̺�2 ��Ī2
                    [NATURAL JOIN ���̺�n ��Īn]
;

-- d) JOIN ~ USING

SELECT [��Ī1.] �÷���1, [��Ī2.] �÷���2 [, ...]
  FROM ���̺�1 ��Ī1 JOIN ���̺�2 ��Ī2 USING (�����÷�)
                    [JOIN ���̺�n ��Īn USING (�����÷�)] -- ��Ī ������
                    
;
---------------------------------------------------------------

-- 5) NON-EQUI JOIN : WHERE �������� join-attribute ����ϴ� ���
--                    �ٸ� �� �����ڸ� ����Ͽ� ���� ���̺��� ���� ���

-- ����) emp, salgrade ���̺��� ����ؼ� ������ �޿��� 

SELECT e.empno
     , e.ename
     , e.sal
     , s.grade
  FROM emp e
     , salgrade s 
 WHERE e.sal BETWEEN s.losal AND s.hisal
;

-- emp���̺��� salgrade ���̺�� ���Ϻ��ؼ�
-- ������ �� �ִ� ���� ����. ���� EQUI-JOIN �Ұ���

-- JOIN ~ ON ���� ����

SELECT e.empno
     , e.ename
     , e.sal
     , s.grade
  FROM emp e JOIN salgrade s ON (e.sal BETWEEN s.losal AND s.hisal)
;

-- OUTER JOIN ���� ����� ���� �μ���ȣ�� NULL�� ������ ����
/*
INSERT INTO "SCOTT"."EMP" (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL) VALUES ('7777', 'JJ', 'CLERK', '7902', TO_DATE('2019-06-27 13:09:05', 'YYYY-MM-DD HH24:MI:SS'), '900')
INSERT INTO "SCOTT"."EMP" (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM) VALUES ('8888', 'J_JAMES', 'SALESMAN', '7698', TO_DATE('2019-06-07 13:10:38', 'YYYY-MM-DD HH24:MI:SS'), '1250', '200')

COMMIT;
*/

-- 6) OUTER JOIN : ���� ��� ���̺��� ���� �÷��� NULL ���� �����Ͷ�
--                 ����� ���� �� ����ϴ� ���� ���

--     ������ : (+), LEFT OUTER JOIN, RIGHT OUTER JOIN

---- 1. (+) : ����Ŭ������ ����ϴ� OUTER JOIN ������
--            EQUI-JOIN ���ǿ��� NULL �� ����� ���ϴ� �ʿ� �ٿ��� ���

-- ������ ������ �μ���� �Բ� ��ȸ

SELECT e.empno
     , e.ename
     , d.dname
  FROM emp e
     , dept d
 WHERE e.deptno = d.deptno
;

-- JJ, J_JAMES�� e.deptno�� NULL�̹Ƿ� dept ���̺� ��ġ�ϴ� ���� �����Ƿ� ���� ����� �� ������ ��ȸ���� �ʴ´�.

-- �μ� ��ġ�� ���� ���� ������ ��� ����� �ϰ� �ʹ�.
-- �׷����� dept ���̺����� �����Ͱ� NULL�̾ �߰� ����� �ʿ�
-- �߰� ����� ���ϴ� �ʿ� (+) �����ڸ� ���δ�.

/*
EMPNO,  ENAME,    DNAME
--------------------------------
7839	KING	ACCOUNTING
7782	CLARK	ACCOUNTING
7934	MILLER	ACCOUNTING
7902	FORD	RESEARCH
7369	SMITH	RESEARCH
7566	JONES	RESEARCH
7900	JAMES	SALES
7844	TURNER	SALES
7654	MARTIN	SALES
7521	WARD	SALES
7499	ALLEN	SALES
7698	BLAKE	SALES
*/

-- (+) �����ڴ� �����ʿ� ����. �̴� NULL ���·� ��µ� ���̺��� �������´�.
-- ��ü ������ ���ػ�� ���̺��� �����̱� ������ LEFT OUTER JOIN�� �߻���.

----- 2. LEFT OUTER JOIN ~ ON

SELECT e.empno
     , e.ename
     , e.dname
  FROM emp e LEFT OUTER JOIN dept d ON (e.deptno = d.deptno)
;

-- ON ���� ���� ���� ������ EQUI-JOIN�� ����������
-- LEFT OUTER JOIN �����ڿ� ����
-- �� ������ ���ʿ� ��ġ�� ���̺��� ��� �����ʹ� ����� ����޴´�.
-- ����� (+) �����ڸ� �����ʿ� ���� ����� ����

---- 3. RIGHT OUTER JOIN

-- ����) ������ ���� �ƹ��� ��ġ���� ���� �μ��� �־ ��� �μ��� ��µǱ� �ٶ�� (+) �����ڷ� �ذ�
-- '=' ������ �����ʿ� ����

SELECT e.empno
     , e.ename
     , d.dname
  FROM emp e
     , dept d
 WHERE e.deptno(+) = d.deptno
;

/*
EMPNO,  ENAME,    DNAME
------------------------------
7839	KING	ACCOUNTING
7782	CLARK	ACCOUNTING
7934	MILLER	ACCOUNTING
7902	FORD	RESEARCH
7369	SMITH	RESEARCH
7566	JONES	RESEARCH
7900	JAMES	SALES
7844	TURNER	SALES
7654	MARTIN	SALES
7521	WARD	SALES
7499	ALLEN	SALES
7698	BLAKE	SALES
		        OPERATIONS
*/

-- RIGHT OUTER JOIN ~ ON

SELECT e.empno
     , e.ename
     , d.dname
  FROM emp e RIGHT OUTER JOIN dept d ON (e.deptno = d.deptno)
;

-- ON ������ EQUI-JOIN�� ������ ���� ������ ���� RIGHT OUTER JOIN �����ڿ� ���� 
-- ������ ���̺��� dept ���̺��� �����ʹ� ��� ����� ����޴´�.

----- 4. FULL OUTER JOIN :

-- ����) �μ� ��ġ�� �ȵ� ������ ��ȸ�ϰ� �Ͱ� ������ �ƹ��� ���� �μ��� ��ȸ�ϰ� ���� ��,
--       ��, ���� ��� ���� ���̺� �����ϴ� NULL ������ ��� �� ���� ��ȸ�Ϸ���?

-- (+) �����ڷδ� �Ұ���

SELECT e.empno
     , e.ename
     , d.dname
  FROM emp e
     , dept d
 WHERE e.deptno(+) = d.deptno (+)
;

/*
ORA-01468: outer-join�� ���̺��� 1���� ������ �� �ֽ��ϴ�
01468. 00000 -  "a predicate may reference only one outer-joined table"
*/

-- FULL OUTER JOIN ~ ON �����ڷ� ����

SELECT e.empno
     , e.ename
     , d.dname
  FROM emp e FULL OUTER JOIN dept d ON e.deptno = d.deptno
;

/*
EMPNO,  ENAME,  DNAME
------------------------------
7777	JJ	
8888	J_JAMES	
7369	SMITH	RESEARCH
7499	ALLEN	SALES
7521	WARD	SALES
7566	JONES	RESEARCH
7654	MARTIN	SALES
7698	BLAKE	SALES
7782	CLARK	ACCOUNTING
7839	KING	ACCOUNTING
7844	TURNER	SALES
7900	JAMES	SALES
7902	FORD	RESEARCH
7934	MILLER	ACCOUNTING
                OPERATIONS
*/

-- ����) ������ �ƹ��� ���� �μ��� ��� ��ȸ�ϰ� �ʹ�.
--       dept ���̺��� ���ʿ� ��ġ�ؼ� ������ �Ŵ� ���
--       LEF OUTER JOIN���� �ذ��ϸ� �ȴ�.

SELECT d.dname
     , e.ename
  FROM dept d
     , emp e
 WHERE d.deptno = e.deptno(+)
 ;
 
 ----- 5. SELF JOIN
 --      : �� ���̺� ������ �ڱ� �ڽ��� �÷����� �����Ͽ� ������ �� ���� ����� ���
 
-- ���� ) enp ���̺� ���� ������ ��ȸ�� ��, �� ������ ���(�Ŵ���) �̸��� ���� ��ȸ�ϰ� �ʹ�.

SELECT e.empno "���"
     , e.ename "�̸�"
     , e.mgr " ��� ���"
     , e1.ename "��� �̸�"
  FROM emp e,
       emp e1
 WHERE e.mgr = e1.mgr
;

-- ���� ����� SELF-JOIN�̸鼭 EQUI=JOIN�̱� ������ -- ��簡 ���� ������ ��ȸ���� �ʴ´�.
-- KING�� ��ȸ���� ����

-- ��簡 ���� ������ ��ȸ�ϰ� ������
-- a) e���̺� �������� ��� �����Ͱ� ��ȸ�Ǿ�� ��
-- b) (+) ��ȣ�� �����ʿ� ���̰ų�
-- c) LEFT OUTER JOIN ~ ON �� ���

SELECT e.empno "���"
     , e.ename "�̸�"
     , e.mgr " ��� ���"
     , e1.ename "��� �̸�"
  FROM emp e LEFT OUTER JOIN emp e1 ON e.mgr = e1.empno 
;

/*
���, �̸�,  ��� ���, ��� �̸�
----------------------------------
7902	FORD	7566	JONES
8888	J_JAMES	7698	BLAKE
7499	ALLEN	7698	BLAKE
7521	WARD	7698	BLAKE
7654	MARTIN	7698	BLAKE
7844	TURNER	7698	BLAKE
7900	JAMES	7698	BLAKE
7934	MILLER	7782	CLARK
7566	JONES	7839	KING
7698	BLAKE	7839	KING
7782	CLARK	7839	KING
7777	JJ	    7902	FORD
7369	SMITH	7902	FORD
7839	KING		
*/

-- ���� ������ ���� ������ ��ȸ

SELECT e.empno "���"
     , e.ename "�̸�"
     , e.mgr "��� ���"
     , e1.ename "��� �̸�"
  FROM emp e
     , emp e1
  WHERE e.mgr(+) = e1.empno
 ORDER BY "���" DESC
;

/*
���,    �̸�,   ��� ���, ��� �̸�
------------------------------------
        MARTIN
        TURNER
        MILLER
        SMITH
        J_JAMES
        ALLEN
        WARD
        JJ
        JAMES
8888	J_JAMES	    7698	BLAKE
7934	MILLER	    7782	CLARK
7902	FORD	    7566	JONES
7900	JAMES	    7698	BLAKE
7844	TURNER	    7698	BLAKE
7782	CLARK	    7839	KING
7777	JJ	        7902	FORD
7698	BLAKE	    7839	KING
7654	MARTIN	    7698	BLAKE
7566	JONES	    7839	KING
7521	WARD	    7698	BLAKE
7499	ALLEN	    7698	BLAKE
7369	SMITH	    7902	FORD
*/

-- RIGHT OUTER JOIN ~ ON ���� ����

SELECT e.empno "���"
     , e.ename "�̸�"
     , e.mgr " ��� ���"
     , e1.ename "��� �̸�"
  FROM emp e RIGHT OUTER JOIN emp e1 ON (e.mgr = e1.empno)
 ORDER BY "���" DESC
;

-- ���� �� �ǽ� ����)
-- 1. ���, �̸�, ����, ����̸�, �μ���, �μ���ġ�� ��ȸ�Ͻÿ�.
--    emp e, emp e1, dept d

SELECT e.empno "���"
    , e.ename "�̸�"
    , e.job "����"
    , e1.ename "����̸�"
    , d.dname "�μ���"
    , d.loc "�μ���ġ"
  FROM emp e
     , emp e1
     , dept d
 WHERE e.mgr = e1.empno
   AND e.deptno = d.deptno
 ORDER BY d.deptno
;

-- ���� ������ JOIN ~ ON���� ����

SELECT e.empno "���"
    , e.ename "�̸�"
    , e.job "����"
    , e1.ename "����̸�"
    , d.dname "�μ���"
    , d.loc "�μ���ġ"
  FROM emp e JOIN emp e1 ON (e.mgr = e1.empno)
             JOIN dept d ON (e.deptno = d.deptno) 
 ORDER BY d.deptno
;


/*
���,   �̸�,    ����,  ����̸�,  �μ���,    �μ���ġ
--------------------------------------------------------
7782	CLARK	MANAGER	 KING	 ACCOUNTING	  NEW YORK
7934	MILLER	CLERK	 CLARK	 ACCOUNTING	  NEW YORK
7902	FORD	ANALYST	 JONES	 RESEARCH	  DALLAS
7566	JONES	MANAGER	 KING	 RESEARCH	  DALLAS
7369	SMITH	CLERK	 FORD	 RESEARCH	  DALLAS
7698	BLAKE	MANAGER	 KING	 SALES	      CHICAGO
7521	WARD	SALESMAN BLAKE	 SALES	      CHICAGO
7654	MARTIN	SALESMAN BLAKE	 SALES	      CHICAGO
7844	TURNER	SALESMAN BLAKE	 SALES	      CHICAGO
7900	JAMES	CLERK	 BLAKE	 SALES	      CHICAGO
7499	ALLEN	SALESMAN BLAKE	 SALES	      CHICAGO
*/

-- ��簡 ���ų�, �μ��� �������� ���� ������ ��� ����Ͻÿ�.
-- (+) �����ڷ� �ذ�

SELECT e.empno "���"
    , e.ename "�̸�"
    , e.job "����"
    , e1.ename "����̸�"
    , d.dname "�μ���"
    , d.loc "�μ���ġ"
  FROM emp e
     , emp e1
     , dept d
 WHERE e.mgr = e1.empno(+)
   AND e.deptno = d.deptno(+)
 ORDER BY d.deptno
;

-- LEFT OUTER JOIN ~ ON ���� �ذ�
-- ��簡 ���ų�, �μ��� �������� ���� ������ ��� ����Ͽ� ��簡 ���� ��, ����̸� ��� '-' �� ��µǵ��� �Ͻÿ�.

SELECT e.empno "���"
    , e.ename "�̸�"
    , e.job "����"
    , NVL(e1.ename, '-') "����̸�"
    , NVL(d.dname, '-') "�μ���"
    , NVL(d.loc, '-') "�μ���ġ"
  FROM emp e LEFT OUTER JOIN emp e1 ON (e.mgr = e1.empno)
             LEFT OUTER JOIN dept d ON (e.deptno = d.deptno) 
 ORDER BY d.deptno
;

/*
���,   �̸�,    ����,  ����̸�,  �μ���,      �μ���ġ
----------------------------------------------------------
7782	CLARK	MANAGER	 KING	  ACCOUNTING	NEW YORK
7934	MILLER	CLERK	 CLARK	  ACCOUNTING	NEW YORK
7839	KING	PRESIDENT -	      ACCOUNTING	NEW YORK
7902	FORD	ANALYST	 JONES	  RESEARCH	    DALLAS
7566	JONES	MANAGER	 KING	  RESEARCH	    DALLAS
7369	SMITH	CLERK	 FORD	  RESEARCH	    DALLAS
7698	BLAKE	MANAGER	 KING	  SALES	        CHICAGO
7844	TURNER	SALESMAN BLAKE	  SALES	        CHICAGO
7654	MARTIN	SALESMAN BLAKE	  SALES	        CHICAGO
7521	WARD	SALESMAN BLAKE	  SALES	        CHICAGO
7499	ALLEN	SALESMAN BLAKE	  SALES	        CHICAGO
7900	JAMES	CLERK	 BLAKE	  SALES	        CHICAGO
7777	JJ	    CLERK	 FORD	    -	          -
8888	J_JAMES	SALESMAN BLAKE	    -	          -
*/
       
-- 2. ���, �̸�, �޿�, �޿����, �μ���, �μ���ġ�� ��ȸ�Ͻÿ�.
--    emp e, dept d, salgrade s

SELECT e.empno "���"
     , e.ename "�̸�"
     , e.sal "�޿�"
     , s.grade "�޿����"
     , d.dname "�μ���"
     , d.loc "�μ���ġ"
  FROM emp e
     , dept d
     , salgrade s
 WHERE e.sal BETWEEN s.losal AND s.hisal
   AND e.deptno = d.deptno
;

-- ���� ������ JOIN ~ ON���� ����

SELECT e.empno "���"
     , e.ename "�̸�"
     , e.sal "�޿�"
     , s.grade "�޿����"
     , d.dname "�μ���"
     , d.loc "�μ���ġ"
  FROM emp e JOIN salgrade s ON (e.sal BETWEEN s.losal AND s.hisal)
             JOIN dept d ON (e.deptno = d.deptno)
;

/*
���,   �̸�,   �޿�, �޿����,   �μ���,   �μ���ġ
-----------------------------------------------------
7839	KING	5000	5	    ACCOUNTING	NEW YORK
7902	FORD	3000	4	    RESEARCH	DALLAS
7566	JONES	2975	4	    RESEARCH	DALLAS
7698	BLAKE	2850	4	    SALES	    CHICAGO
7782	CLARK	2450	4	    ACCOUNTING	NEW YORK
7499	ALLEN	1600	3	    SALES	    CHICAGO
7844	TURNER	1500	3	    SALES	    CHICAGO
7934	MILLER	1300	2	    ACCOUNTING	NEW YORK
7654	MARTIN	1250	2	    SALES	    CHICAGO
7521	WARD	1250	2	    SALES	    CHICAGO
7900	JAMES	950	    1	    SALES	    CHICAGO
7369	SMITH	800	    1	    RESEARCH	DALLAS
*/

-- �μ��� �������� ���� ������ ��� ����Ͻÿ�.
-- (+) �����ڷ� �ذ�

SELECT e.empno "���"
     , e.ename "�̸�"
     , e.sal "�޿�"
     , s.grade "�޿����"
     , d.dname "�μ���"
     , d.loc "�μ���ġ"
  FROM emp e
     , dept d
     , salgrade s
 WHERE e.sal BETWEEN s.losal AND s.hisal
   AND e.deptno = d.deptno(+)
;

-- LEFT OUTER JOIN ~ ON ���� �ذ�
-- �μ��� �������� ���� ������ �μ���, �μ���ġ ��� '-'�� ��µǵ��� �Ͻÿ�. (null)�� �ȳ����� �ϱ�

SELECT e.empno "���"
     , e.ename "�̸�"
     , e.sal "�޿�"
     , s.grade "�޿����"
     , NVL(d.dname, '-') "�μ���"
     , NVL(d.loc, '-') "�μ���ġ"
  FROM emp e LEFT OUTER JOIN salgrade s ON (e.sal BETWEEN s.losal AND s.hisal)
             LEFT OUTER JOIN dept d ON (e.deptno = d.deptno)
;

/*
���,   �̸�,   �޿�, �޿����, �μ���, �μ���ġ
---------------------------------------------------
7839	KING	5000	5	ACCOUNTING	NEW YORK
7902	FORD	3000	4	RESEARCH	DALLAS
7566	JONES	2975	4	RESEARCH	DALLAS
7698	BLAKE	2850	4	SALES	    CHICAGO
7782	CLARK	2450	4	ACCOUNTING	NEW YORK
7499	ALLEN	1600	3	SALES	    CHICAGO
7844	TURNER	1500	3	SALES	    CHICAGO
7934	MILLER	1300	2	ACCOUNTING	NEW YORK
8888	J_JAMES	1250	2	-	        -
7521	WARD	1250	2	SALES	    CHICAGO
7654	MARTIN	1250	2	SALES	    CHICAGO
7900	JAMES	950	    1	SALES	    CHICAGO
7777	JJ	    900	    1	-	        -
7369	SMITH	800	    1	RESEARCH	DALLAS
*/

-- �μ��� �Ҽ� �ο��� ����Ͻÿ�.
-- �� ��, �μ������� ����Ͻÿ�.

SELECT d.dname "�μ���"
     , COUNT(*) "�Ҽ��ο�" 
  FROM dept d
     , emp e
 WHERE d.deptno = e.deptno
GROUP BY d.dname
;

/*
�μ���,   �Ҽ��ο�
-------------------
RESEARCH	3
SALES	    6
ACCOUNTING	3
*/

-- �μ��� �̹����� �ο����� ����Ͻÿ�.
-- �� ��, �μ��� ���� ������ '�μ� �̹���'���� ����Ͻÿ�.

/* ������ ������ ���� ���ɴϴ�.
�μ���      �ο�(��)
--------------------------
ACCOUNTING   3
OPERATIONS   0
RESEARCH     3
SALES        6
�μ� �̹���  2
*/

SELECT d.dname  "�μ���"
     , COUNT(*) "�Ҽ��ο�"
     , CASE WHEN (e.deptno IS NULL) THEN d.dname END AS "�μ� �̹���"
  FROM dept d
     , emp e
 WHERE d.deptno = e.deptno(+)
 GROUP BY d.dname
 ORDER BY d.dname
;
