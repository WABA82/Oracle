--select��������

--�ܼ��� :
-- scalar :select ��ȸ�ϴ� Ŀ���� ���������� �̿�
----emp���� �����ȣ, �̸� , �μ���ȣ, �μ���
--�μ����� dept���̺� ����
select empno, ename, deptno, (select dname from dept where dept.deptno = emp.deptno) as dname
from emp;

--cp_emp3���� ��ȣ,�̸�,�μ�
insert into cp_emp3(
select empno, ename, deptno, job, sal
from emp
where deptno in(10,30)
);
commit;

--������� ��ȣ�� 7698�� ����� �μ���ȣ�� ������ �μ��� cp_emp3���� ��ȸ
--��ȸ �÷��� �����ȣ, �����, �μ���ȣ , ����
select * from cp_emp3;

select empno, ename, deptno, job
from cp_emp3
where deptno = (select deptno from emp where empno = 7698);

--�÷����� ������ �������� where in, any, all, exsists
--������� ��ȣ�� 7698,7566�� ����� �μ���ȣ�� ������ �μ��� cp_emp3���� ��ȸ
--��ȸ �÷��� �����ȣ, �����, �μ���ȣ , ����

select empno, ename, deptno, job
from cp_emp3
where deptno in (select deptno from emp where empno in (7698,7782));

--�ܺΰ� �Է� �ޱ�
--�������� &������ - �Է�â ���� : �Է�â�� �Է��� ���� ������ ���Եȴ�.
--&�������� �������� �״�� ���Ե����� ���ڿ��� �Է��� ��� --
select * from EMP where deptno=&deptno;
select * from EMP where ename='&deptno';

--exists : ���������� ���� ������ ��� �������� ����
--������̺��� �ԷµǴ� �μ���ȣ�� ���� �Ѵٸ�,
--�����ȣ ����� �Ի��� �μ���ȣ ��ȸ�մϴ�.
select empno, ename, hiredate, deptno
from emp
where exists (select deptno from emp where deptno = &deptno);

--all : and - < �϶� ���������� ��ȸ�� �� �� ���� ���� ������ �� ����
-- 				> �϶� ���������� ��ȸ�� �� �� ���� ū ������ �� ����
--�Էµ� �μ����� ���� ������ ���� �������
--������ ���� ����� ��ȸ
select empno, ename, sal, deptno
from emp
where sal > all(select sal from emp where deptno = &d_no);

select * from emp;

--any : or
select empno, ename, sal, deptno
from emp
where sal < any(select sal from emp where deptno = &d_no);

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- rownum : ��ȸ�� ����� �������� ��ȣ�� ���̴� ���� �÷�
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ��ȣ , �����ȣ, �����, �Ի��� ��ȸ
-- ��, ��ȣ�� ��ȸ��� 1���� ���������� �ο��Ǿ�� �Ѵ�.

select rownum, empno, ename, hiredate
from emp
where deptno in (10, 20);
select * from EMP;

--rownum
--order by�� ���� ���Ǹ� ��ȣ�� ���̰� �ȴ�.
select rownum, empno, ename
from emp
order by ename asc;


--rownum�� where������ ����ϸ� 1�� ���ʹ� ��ȸ�� ������ �ƴѹ�ȣ�� ��ȸ ���� �ʴ´�
--��, ����� 1~5�������� ���
select rownum, empno, ename, hiredate, sal
from emp
where rownum between 1 and 5;

--��, ����� 2~5�������� ����� ���� �ʴ´�.
select rownum, empno, ename, hiredate, sal
from emp
where rownum between 2 and 5;

--������ ��������
--��ȸ���(inline view)�� ������ ����ȸ

/*
	select �÷���,,,,
	from (select....)
*/

select rownum, empno, ename, hi
from	(select rownum, empno, ename, sal, hiredate hi from emp order by sal asc);

--������� ���� ��������  �Ի��� ������� 5���� ��ȸ

select rownum, empno, ename, hiredate
from (select rownum, empno, ename, hiredate from emp order by hiredate desc)
where rownum between 1 and 5;

--���� 2��°�� �������� �Ի��� ������� 5�� ��ȸ
select rownum, r, empno, ename, to_char(hiredate)
from (select rownum as R, empno, ename, hiredate
		from (select rownum, empno, ename, hiredate
				from emp order by hiredate desc))
where r between 2 and 6 ;


select * from user_constraints;
