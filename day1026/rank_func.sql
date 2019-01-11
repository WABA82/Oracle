--rank�Լ�
--��ü ���� ���ϱ�
--rank() over(order by �÷���) - �ߺ� ������ �����ϴ�
--������̺��� �����ȣ, �����, ����, ��������
select empno, ename, sal, rank() over(order by sal asc)
from emp;

--������̺��� �����ȣ, �����, ����, ��������
--��, �ߺ������� �߻����� �ʵ��� ó���Ͽ� ��ȸ �� ��.
select empno, ename, sal, row_number() over(order by sal asc) as sal_ranking
from emp;

--��ȸ�� ���ڵ带 �׷캰 ���� : partition by
--������̺��� �μ��� �������� ��ȸ
select empno, ename, sal, deptno, row_number() over(partition by deptno order by sal) as sal_ranking
from emp;

------------------------------------------------------------------------------------------------------------------------------------------------------
-- GROUP BY rollup / cube
------------------------------------------------------------------------------------------------------------------------------------------------------
--rollup : �׷캰 �Ұ�� �Ѱ踦 ���� �� ����ϰ� ����� ���ڵ� ��� �Ŀ� �����ش�.
--������̺��� �μ���, ������ �� ��ȸ
--�Ѱ踦 ���
select deptno, sum(sal)
from emp
group by rollup(deptno);

--cube : �׷캰 �Ұ�� �Ѱ踦 ���� �� ����ϰ� ����� ���ڵ� ��� ���� �����ش�.
select deptno, sum(sal)
from emp
group by cube(deptno);

--���� �÷��� �׷����� �������� rollup�� �׷캰 �Ұ踸 ���
--��� ���̺��� �μ���, ������ ������ ��ȸ

select deptno, job, sum(sal)
from emp
group by rollup(deptno, job)
order by deptno, sum(sal);

-- �μ���, �μ��� ����, ������, ������ ����
select deptno, job, sum(sal)
from emp
group by cube(deptno, job);

select *
from user_constraints;

desc dept;