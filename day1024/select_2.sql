--���ڿ� ������ like���� ����� ���̺�
create table test_like(
	num number,
	name varchar2(30),
	loc varchar2(300),
	highschool varchar2(60)
);

insert into test_like(num, name, loc, highschool)
--values(1,'a','b','c');
values(1,'������','����� ������ ���ﵿ','������');

insert into test_like(num, name, loc, highschool)
--values(1,'a','b','c');
values(2,'������','����� ���α� ������','������');

insert into test_like(num, name, loc, highschool)
--values(1,'a','b','c');
values(3,'�ڿ���','��⵵ ������ ���뱸','������');

insert into test_like(num, name, loc, highschool)
--values(1,'a','b','c');
values(4,'����ö','����� ���ʱ� ���ʵ�','�԰�');

insert into test_like(num, name, loc, highschool)
--values(1,'a','b','c');
values(5,'��������','���� ��絿','�ð�');

insert into test_like(num, name, loc, highschool)
--values(1,'a','b','c');
values(6,'������','��⵵ ������ ������','������');

commit;
select * from TEST_LIKE;

--LIKE �����ڴ� %, _ ��ȣ�� ���� ���
--%�� ��� ���ڿ�, _ �Ѱ��� ����

--test_like���̺��� '�����'�� ��� ����� ��ȣ, �̸�, ��Ű���б��� ��ȸ
select num, name, loc, highschool,
from test_like
where loc like '�����%';

--�̸��� '��'���� ������ �л��� ��ȣ, �̸�, �ּҸ� ��ȸ
select num, name, loc
from test_like
where name like '%��';

--�̸��� '��'�� ���ԵǾ� �ִ� �л��� ��ȣ,�̸�,�ּ�,����б��� ��ȸ
select num,name,loc,highschool
from test_like
where name like '%��%';

--�̸��� 3�����̸� ��� ���ڰ� �� �� ����� ��ȣ,�̸�
select num,name
from test_like
where name like '_��_';

--�̸��� 4������ ����� ��ȣ, �̸�, �ּ�, ����б�
select num, name, loc, highschool
from test_like
where name like '____';

select * from TEST_LIKE;

--�����ּҸ� �����ϴ� ���̺�
create table zipcode(
	zipcode char(7),
	sido varchar2(6),
	gugun varchar2(25),
	dong varchar2(100),
	bunji varchar2(25),
	seq number(5)
);

--zipcode���̺��� dong�÷� ������ũ�� ����
alter table zipcode modify dong varchar2(100);

--������ zipcode���̺��� ������ �ߺ��� ���� �Ѱ��� zipcode���̺� ����
truncate table zipcode;

--���̺��� ������ ����
select count(*)
from zipcode;

select *
from zipcode;

--�츮 ������ ���� �ּҸ� ��ȸ
--���̸�)
select zipcode,sido,gugun,dong,bunji,seq
from zipcode
where dong like '�󵵵�%';

--������̺��� ����� A�� �ΰ� ��� �ִ� ����� �����ȣ, �����, �Ի��� ��ȸ
select empno, ename, hiredate
from emp
where ename like '%A%A%';

select * from EMP;

--�ߺ�����
--distinct �ϳ��� �÷������� ����ϴ� �� ����
--������̺��� �μ���ȣ ��ȸ
--������ �߻����� �ʰ� ��ȸ����� ������ �� ���� ���� �����ϴ��� �Ǵ��ؼ� �ߺ��� ���� �����Ѵ�.
--�ٸ� �÷��� ���� ��ȸ�ϸ� ��� �÷��� ���� ���� ��츸 �ߺ����� ������� �ʴ´�.
--������̺��� �Ŵ�����ȣ�� ��ȸ, ��, �ߺ��Ǵ� �Ŵ�����ȣ�� ������� �ʴ´�
select distinct mgr /*ename*/
from emp;

--group by : �׷����� �������� ���� �÷��� ���� ���Ǹ� error
select mgr /*ename*/
from emp
group by mgr;
