--����
--������̺��� �����ȣ, �����, ����, �Ի����� ��ȸ
--��, ������ ������������ �����Ͽ� ����� ��.
--������ ���ٸ� �Ի����� ������������ ����.

select empno, ename, sal, hiredate
from emp
order by sal, hiredate desc, ename;

--������̺��� �Ŵ�����ȣ, �����ȣ, �����, ������ ��ȸ
--��, �Ŵ�����ȣ�� ������������ ���� �ϵ� �ߺ��� �߻��ϸ� ������� ������������ ����

select mgr, ename, empno, sal
from emp
order by mgr desc, ename asc;

select * from EMP;

create table test_orderby(
num varchar2(10)
);

insert into test_orderby(num) values('1000');
insert into test_orderby(num) values('1');
insert into test_orderby(num) values('204');
insert into test_orderby(num) values('21');
insert into test_orderby(num) values('191');
insert into test_orderby(num) values('300');
insert into test_orderby(num) values('20001');
insert into test_orderby(num) values('0001');
insert into test_orderby(num) values('00000002');
commit;

select * from TEST_ORDERBY;

--��ȣ�� ������������ ���� : ���ڿ��� ������ �ڸ����� ũ���� ����
select num
from TEST_ORDERBY
order by num asc;

