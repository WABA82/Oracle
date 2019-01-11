--�����Լ� - �÷��� ���� �ϳ��� ����� ��ȯ

--count() : null�� �ƴ� �÷��� ������ �� ��
--������̺��� ���ڵ� �� (�����), ���ʽ��� �����ϴ� �����
--���ʽ��� �������� �ʴ� �����
--�Ŵ����� �ִ� �����
select count(empno), count(comm), count(empno) - count(comm), count(mgr)
from emp;

--�������� ��ȸ�Ǵ� �÷��� ���� ���Ǹ� ���� �߻�
--error : ���� �׷��� �׷� �Լ��� �ƴմϴ�
select count(empno), ename
from emp;

select * from EMP;
--��� ������ ��, ���ʽ� ��, �ΰǺ� ����
select sum(sal), sum(comm), sum(sal)+sum(comm)
from emp;

--������ ���, ���ʽ� ���
select trunc(avg(sal),0), avg(comm),
from emp;

--�ְ� ������, ���� ������, �ְ����װ� ������ �������� ����
select max(sal), min(sal), max(sal)-min(sal)
from emp;

--**where�������� �����Լ��� ����� �� ����.**
--������̺��� ��տ������� ���� �����ϴ� ����� �����ȣ, �����, ����, �Ի��� ��ȸ
select EMPNO, ENAME, SAL, HIREDATE
from emp
where sal > avg(sal);

select * from EMP;

--group by���� �����Լ���  �Բ� ����Ͽ� �׷캰 ���踦 ��ȸ�� �� �ִ�.
--�μ���, �μ����ο���, �μ��� ���� ��, �������, �ְ� ������
select deptno, count(empno), sum(sal), trunc(avg(sal),2), max(sal), min(sal)
from emp
group by deptno
order by deptno asc;

--������̺��� �Ŵ����� �����ο���, �ְ����� ��������, ������ ����
select mgr,count(mgr), max(sal), min(sal), max(sal)-min(sal)
from emp
where mgr is not null
group by mgr
order by mgr;

select * from EMP;

--��¥ �Լ�
--��¥ + ���� = �ϼ��� ����Ѵ�
select sysdate+5
from dual;

select add_months(sysdate,7)
from dual;

select months_between('2018-11-25', sysdate), months_between('2018-12-25', sysdate), months_between('2019-1-25', sysdate)
from dual;
