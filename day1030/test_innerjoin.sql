--inner join : ���� �ٸ� ���̺� ���� ���� �ִ� ��쿡�� ��ȸ.
select * from emp;
select * from dept;
--�����ȣ, �����, �μ���ȣ, �μ���, ��ġ, ���� ��ȸ
--ANSI
select EMPNO, ENAME, e.deptno, dname, loc, sal
from emp e
inner join dept d
on e.deptno=d.deptno;
--ORACLE
select EMPNO, ENAME, e.deptno, dname, loc, sal
from emp e, dept d
where (e.deptno=d.deptno);

--

select * from CAR_COUNTRY;
select * from CAR_MAKER;
select * from CAR_MODEL;

--������� �߰�
--alter table test_alter add constraint pk_test_alter
--	primary key(id);

--alter TCL�� �����ϴ�
alter table car_country add constraint pk_car_country
	primary key(maker);
alter table car_maker add constraint fk_car_maker
	foreign key(maker) references car_country(maker);

alter table car_maker add constraint pk_car_maker_model
	primary key(model);
alter table car_model add constraint fk_car_model_model
	foreign key(model) references car_maker(model);

select * from user_constraints;

--�𵨸��� '�ƹ���', '�ҳ�Ÿ','A8'�� ������ ������,������,�𵨸�,����, ����, �̹����� ��ȸ
select cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.car_img
from car_country cc
inner join car_maker cma
on         cma.maker = cc.maker
inner join car_model cmo
on          cmo.model = cma.model
where cma.model in ('�ƹ���','�ҳ�Ÿ','A8');
--ORACLE
select cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.car_img
from car_country cc,car_maker cma,car_model cmo
where (cma.maker = cc.maker and cmo.model = cma.model) and cma.model in ('�ƹ���','�ҳ�Ÿ','A8');

--�����ȣ, �����, ����, �Ի���, �μ���ȣ,�μ���, ��ġ, �����ȣ, �õ� ,����, ��, ������ ��ȸ �ϼ���.
--������̺��� �����ȣ�� �����ȣ ���̺��� SEQ�� ������������ ����Ͻÿ�
--ansi
select EMPNO, ENAME, SAL, HIREDATE, dt.DEPTNO, DNAME, LOC, SIDO, GUGUN, DONG, BUNJI,zip.seq
from dept dt
inner join emp e
on e.deptno = dt.deptno
inner join zipcode zip
on zip.seq=e.empno;
--oracle
select EMPNO, ENAME, SAL, HIREDATE, dt.DEPTNO, DNAME, LOC, SIDO, GUGUN, DONG, BUNJI, zip.seq
from dept dt, emp e, zipcode zip
where (e.deptno = dt.deptno and  zip.seq=e.empno);

select empno,seq,dong
from emp,zipcode
where (empno=seq);








