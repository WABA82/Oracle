--���̺��� :
--������̺��� �����ȣ, �����, �Ի���, ���� ��ȸ�ϰ�
--��ȸ�� ����� CP_EMP��� ���̺��� ������ ��.

select * from EMP;

create table CP_EMP as (
select empno, ename, hiredate, sal
from emp
);

select * from CP_EMP;

alter table cp_emp modify sal number(7,2) not null;
select * from user_constraints;

--not null ������ �ܵ����� �����Ǿ� ������ ���簡 �ȴ�.
--cp_emp���̺��� �����ȣ
--7500~7599 ���̿� ����
--����� �����ȣ, �����, �Ի���, ���� ��ȸ
--cp_emp2���̺��� ����

select * from cp_emp
where empno between 7500 and 7599;

create table CP_EMP2 as (
select empno, ename, hiredate, sal
from CP_EMP
where empno between 7500 and 7599
);

select * from CP_EMP2;

--������ ����
--����� �����ȣ, �����, �μ���ȣ,����, �μ���, ����
--�� ���ڵ尡 ��ȸ���� �ʵ��� ��ȸ�� ��.

select empno, ename, deptno, job, sal
from emp
where 1 = 0;

create table CP_EMP3 as (
select empno, ename, deptno, job, sal
from emp
where 1 = 0
);

select * from CP_EMP3;
