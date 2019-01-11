--view�� �����Ϸ��� �����ڱ����� ���� ������ view
--���� ������ �ο��ؾ� �Ѵ�.
--������ ������ ���� �ο�
grant create view to ������;

create view test_view as (select * from emp);

--�ܼ� view���� (���̺� �ϳ��� ������ view)
create view emp_view as (select * from cp_emp3);

select * from user_views;

select * from emp_view;
select * from cp_emp3;

--view DML

insert into emp_view(empno,ename,deptno,job,sal)
values(1234,'������',20,'����',4000);
commit;
update emp_view
set job='����', sal=4100
where empno=1234;
select * from cp_emp3;
select * from emp_view;

delete from emp_view
	where empno=1234;
commit;
select * from emp_view;

--view����
drop view emp_view;
select * from user_views;

--�ܼ� view (�ϳ��� ���̺��� ��� �÷��� view ����)
--cp_emp3���̺��� �����ȣ, �����, ����, �������� view ����
create view emp_view as
	(select empno, ename, job, sal from cp_emp3);

select * from user_views;

--view ���Ե��� �ʴ� �÷��� insert�� �����ϸ� null�� �Էµȴ�.
insert into emp_view(empno, ename, job, sal)
values(1234,'������','����',4100);

select * from emp_view;
select * from cp_emp3;

--����view  : ���̺� �������� ����Ͽ� ������ view
--				 ��ȸ�� �� �Լ��� ����Ͽ� ��ȸ�� ����� ������ view
--���� view�� DML�� ������� �ʴ´�.
--�������� ���̺��� ������ �ܼ� select�� ����� ��ȸ�� �� ���.

create view car_view as
(select cma.MAKER, cma.MODEL, cmo.car_year, cmo.price, cmo.cc, cmo.car_option
from car_maker cma, car_model cmo
where (cmo.model = cma.model));

select * from car_view;
select * from user_views;
--view�� ����ϸ� ���ε� ����� �ܼ� ������ ���� �� �ִ�.
select maker,model, car_year, price, cc, car_option
from car_view
where maker='����';

--����view�� insert,update,delete �� �� ����.
insert into car_view(maker,model, car_year, price, cc, car_option)
values('����','���ν���',2017,3000,1999,'��¦3��,ABS');


--�ܼ�view�� DML�� ���� : with read only
create view read_emp as
(select * from cp_emp2)
	with read only;

select * from user_views;

select * from read_emp;
--with read only �ɼ��� ����� view�� �߰�, ���� ������ �Ҽ�����.
insert into read_emp(empno,ename,hiredate,sal)
values(1234,'������',sysdate,5000);