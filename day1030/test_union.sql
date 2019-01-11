select * from CP_EMP3;
insert into cp_emp3(empno, ename, deptno, job, sal)
values(1112,'������',10,'�븮',3500);
insert into cp_emp3(empno, ename, deptno, job, sal)
values(1113,'������',20,'����',7500);
insert into cp_emp3(empno, ename, deptno, job, sal)
values(1114,'���ü�',20,'�˹�',1500);
commit;

--emp : �̱�����, cp_emp3 : �ѱ�����
--�̱������ �ѱ������� ������ 2000������ ����޿���
--�÷��ְ� �;� 2000������ ����� �����ȣ, �����, ����, ������ ��ȸ.
--union : �ߺ������͸� disticnt
--union all : ��絥���͸� ��ȸ�Ѵ�.
select empno, ename, sal, job
from emp
where sal <= 2000
union
select empno, ename, sal, job
from cp_emp3
where sal <= 2000;

select * from EMP;
select * from CP_EMP3;
--cp_emp3�� emp���̺��� 30�� �μ� ��������� ��� �߰�
insert into cp_emp3(empno, ename, deptno, job, sal)
(select empno, ename, deptno, job, sal from emp where deptno=30);
commit;


--�÷��� ������ �����ʰų� ���������� ��ġ���� ������ ���� �߻�

--�÷��� ������ ���� ������
select empno, ename, sal
from emp
where sal <= 2000
union
select empno, ename, sal, job
from cp_emp3
where sal <= 2000;

--���������� ��ġ ���� ��
select empno, ename, sal, job
from emp
where sal <= 2000
union
select sal,job,ename,empno
from cp_emp3
where sal <= 2000;

--INTERSECT : ���� �ٸ� ���̺��� �ߺ��� ���� ��ȸ
--�̱������� ��������� �ѱ������� ��������� ��ġ�ϴ� ������ ��ȸ
select empno, ename, sal, job
from emp
where sal <= 2000
intersect
select empno, ename, sal, job
from cp_emp3
where sal <= 2000;

--MINUS : ���� SELECT�� ��ȸ�� ������� ���� SELECT�� ����� ���� ��ȸ �Ѵ�.
select empno, ename, sal, job
from emp
minus
select empno, ename, sal, job
from cp_emp3
where sal <= 2000
order by sal desc;