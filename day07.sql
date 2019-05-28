-- day07
-- (4) ������ Ÿ�� ��ȯ �Լ�

/*
 ���� �⺻���� Ÿ��
 1. ���� : �ݵ�� ''(���� ����ǥ)�� ���μ� ���
 2. ���� : ��� ������ �Ǵ� ��
 3. ��¥ : ����, �⵵, ��, ��, ��, ��, �ʱ��� ���� �ִ� Ÿ��
--------
TO_CHAR() : �ٸ� Ÿ�Կ��� ���� Ÿ������ ��ȯ���ִ� �Լ�
            ����, ��¥ => ����
TO_DATE() : �ٸ� Ÿ�Կ��� ��¥ Ÿ������ ��ȯ���ִ� �Լ�
            ��¥ ������ ���� (��¥ ���Ͽ� �´� ����) => ��¥            
TO_NUMBER() : �ٸ� Ÿ�Կ��� ���� Ÿ������ ��ȯ ���ִ� �Լ�
              ���ڷθ� ������ ���ڵ����� => ����
*/

-- 1. to_char() : ���� ���� ����

SELECT to_char(12345, '9999')
  FROM dual
;

SELECT to_char(12345, '99999')
  FROM dual
;

SELECT 12345
  FROM dual
;

-- ���ڰ� ����ȭ�Ǿ� ��µǸ� ���� ���ķ� �ٲ��.

SELECT to_char(e.sal) "�޿�(����ȭ)"
     , e. sal "�޿�(����)"
  FROM emp e
;

-- ����ȭ �� �޿��� �������� ���ĵǾ� �ְ� ���� ��ü�� �޿��� ���������� ���ĵǾ� ������ Ȯ���Ѵ�.

-- ���ڸ� ����ȭ �ϵ� �� 8ĭ�� ä�쵵�� �Ѵ�.

SELECT to_char(12345, '99999')
  FROM dual
;

-- �տ� �� ������ 0���� ä���
SELECT to_char(12345, '099999999.99') as ������
  FROM dual
;

-- ���� ���Ͽ��� 3�ڸ��� ���� �б� + �Ҽ��� ǥ��

SELECT to_char(12345, '9,999,999,99') as ������
  FROM dual
;

-- 2. t_date() : ��¥ ���Ͽ� �´� ���� ���� ��¥ ������ ������ ��¥ Ÿ������ ����
SELECT to_date("2019-05-28", 'yyyy-MM-DD') tooday
     , '2019-05-28' "today(����)"
 
  FROM dual
;

-- today + 10��
-- 19/06/07

-- ��¥ó�� ���� ���ڿʹ� ��¥ ������ �ȵ����� Ȯ���غ���.

SELECT '2019-5��-28' + 10 "today + 10��"
  FROM dual
;

/*
ORA-01722: ��ġ�� �������մϴ�
01722. 00000 -  "invalid number"
*/

-- 3. to_number() : ����Ŭ�� �ڵ� ����ȯ�� ���ֹǷ� ���� ������ ����.

SELECT '1000' + 10 ����� 
 FROM  dual
;

SELECT to_number('1000') + 10 �����
  FROM dual
;

-- (5) DECODE(expr, search, result [, search, result] ... [, default])

/*
 ���� default�� �����Ǿ� ���� �ʰ� expr�� ��ġ�ϴ� search�� ���� ���
 DECODE���� ����� NULL�� �ȴ�.
*/

--            expr   srch1   result1
SELECT DECODE('YES', 'YES', '�Է°��� YES�Դϴ�.'
                   , 'NO', '�Է°��� NO�Դϴ�.') AS �Է°��
--                   srch2  result2
  FROM dual
;

/*
�Է°��
-------------
�Է°��� YES�Դϴ�.
*/

--            expr   srch1   result1
SELECT DECODE('NO', 'YES', '�Է°��� YES�Դϴ�.'
                   , 'NO', '�Է°��� NO�Դϴ�.') AS �Է°��
--                   srch2  result2
  FROM dual
;

/*
�Է°��
-------------
�Է°��� NO�Դϴ�.
*/

--            expr   srch1   result1
SELECT DECODE('��', 'YES', '�Է°��� YES�Դϴ�.'
                   , 'NO', '�Է°��� NO�Դϴ�.') AS �Է°��
--                   srch2  result2
  FROM dual
;

/*
�Է°��
-------------
(null)
*/

--            expr   srch1   result1
SELECT DECODE('��', 'YES', '�Է°��� YES�Դϴ�.'
                  , 'NO', '�Է°��� NO�Դϴ�.'
--                   srch2  result2
                  , '�Է°��� YES/NO �� ��� �͵� �ƴմϴ�.') AS �Է°��
--                   default 
  FROM dual
;

/*
�Է°��
--------------------------------------
�Է°��� YES/NO �� ��� �͵� �ƴմϴ�.
*/

-- emp ���̺����� job(����)���� ������� �޿���� ���� ������ �����ϱ�� �ߴ�.
-- ���޺����� ������ ���ٰ� �� ��, �� �������� ������� �������� ���غ���.
-- ���, �̸�, ������ �Բ� ���غ���.

/*
 CLERK : 5%
 SALESMAN : 4%
 MANAGER : 3.7%
 ANALYST : 3%
 PRESIDENT : 1.5%
*/

SELECT e.empno
     , e.ename
     , e.job
     , DECODE(e.job, 'CLERK', e.sal * 0.05 
                   , 'SALESMAN', e.sal * 0.04
                   , 'MANAGER', e.sal * 0.037
                   , 'ANALYST', e.sal * 0.03
                   , 'PRESIDENT', e.sal * 0.015) "������ ������"
  FROM emp e
;

/*
EMPNO,  ENAME,  JOB,   ������ ������
----------------------------------
9999	J_JAMES	CLERK	
8888	J%JAMES	CLERK	
7369	SMITH	CLERK	    40
7499	ALLEN	SALESMAN	64
7521	WARD	SALESMAN	50
7566	JONES	MANAGER	    110.075
7654	MARTIN	SALESMAN	50
7698	BLAKE	MANAGER	    105.45
7782	CLARK	MANAGER 	90.65
7839	KING	PRESIDENT	75
7844	TURNER	SALESMAN	60
7900	JAMES	CLERK	    47.5
7902	FORD	ANALYST	    90
7934	MILLER	CLERK	    65
*/

-- ������ ������ ����� ���� ����($999.99) ������
SELECT e.empno
     , e.ename
     , e.job
     , to_char(DECODE(e.job, 'CLERK', e.sal * 0.05 
                           , 'SALESMAN', e.sal * 0.04
                           , 'MANAGER', e.sal * 0.037
                           , 'ANALYST', e.sal * 0.03
                           , 'PRESIDENT', e.sal * 0.015), '$999.99') "������ ������"
  FROM emp e
;

/*
EMPNO,  ENAME,  JOB,     ������ ������
------------------------------------------
9999	J_JAMES	CLERK	
8888	J%JAMES	CLERK	
7369	SMITH	CLERK	      $40.00
7499	ALLEN	SALESMAN	  $64.00
7521	WARD	SALESMAN	  $50.00
7566	JONES	MANAGER	     $110.08
7654	MARTIN	SALESMAN	  $50.00
7698	BLAKE	MANAGER	     $105.45
7782	CLARK	MANAGER	      $90.65
7839	KING	PRESIDENT	  $75.00
7844	TURNER	SALESMAN	  $60.00
7900	JAMES	CLERK	      $47.50
7902	FORD	ANALYST	      $90.00
7934	MILLER	CLERK	      $65.00
*/