--outer join :
--ANSI
--
--����>
--select ���̺��.�÷���, alias.�÷���
--from ���̺�� alias
--[(������ ���̺��� ���ϱ�)LEFT, RIGHT, FULL] outer join ������ ���̺�� alias
--on ��������
--.
--.
--.
--where �˻�����
--
--ORACLE : �������ǿ� Ư�� �����Ͱ� ���� ���̺� (+)�� �ٿ��ش�. ���ʿ� ��ȣ�� ����ϸ� �����߻�
--
--����> (+)
--select �÷���
--from ���̺�, ������ ���̺��,,,,,
--where (�÷��� = �÷���(+))      (�÷���(+) = �÷���)

--��� �μ��� �μ���ȣ, �μ���, �����ȣ, �����, �Ի��� ��ȸ
--ansi
--disticnt�� ���̺��� ���� ��
select d.deptno, d.dname, e.empno, e.ename, e.hiredate
from  dept d
left outer join   emp e
on e.deptno = d.deptno;

select d.deptno, e.deptno, d.dname, e.empno, e.ename, e.hiredate
from  dept d right outer join emp e
on e.deptno = d.deptno;

select d.deptno, e.deptno, d.dname, e.empno, e.ename, e.hiredate
from  dept d
full outer join emp e
on e.deptno = d.deptno;

--oracle ���� �� ���� �������ǿ� �ʿ�(+)
--full outer join�� ����Ŭ���������� �������� �ʴ´�
select d.deptno,e.deptno, d.dname, e.empno, e.ename, e.hiredate
from emp e, dept d
where (e.deptno(+) = d.deptno);
where (e.deptno = d.deptno(+));

--�����簡 '����', '���'�� ��� ������ ������,������,�𵨸�,����,����,�ɼ��� ��ȸ
select cc.COUNTRY, cc.MAKER, cma.MODEL, cmo.CAR_YEAR, cmo.PRICE, cmo.CAR_OPTION
from car_country cc, car_maker cma, car_model cmo
where (cma.maker(+) = cc.maker and cmo.model(+) = cma.model)
and cma.maker in ('����','���');

--�𵨸��� 'K5','K7','�ҳ�Ÿ','�ƹ���','Cclass', 'A6'�� ��������� ������,������,�𵨸�,����,������ ��ȸ
--�� ������ ������������ ����, ������ ������ ������ ������������ ������ ��
--ansi
select cc.COUNTRY, cc.MAKER, cma.MODEL, cmo.CAR_YEAR, cmo.PRICE
from car_country cc
left join car_maker cma
on cma.maker = cc.maker
left join car_model cmo
on cmo.model = cma.model
where cma.model in ('K5','K7','�ҳ�Ÿ','�ƹ���','Cclass', 'A6')
order by cmo.price desc, cmo.CAR_YEAR desc;

--oracle
select cc.COUNTRY, cc.MAKER, cma.MODEL, cmo.CAR_YEAR, cmo.PRICE
from car_country cc, car_maker cma, car_model cmo
where (cma.maker(+) = cc.maker and cmo.model(+) = cma.model)
and cma.model in ('K5','K7','�ҳ�Ÿ','�ƹ���','Cclass', 'A6')
order by cmo.price desc, cmo.CAR_YEAR desc;

select distinct model from CAR_MODEL;
select * from CAR_MAKER;

--������̺��� 'SCOTT'��� ���� ������ ���� �޴� ���
select empno,ename,hiredate,sal
from emp
where sal < (select sal from emp where ename = 'SCOTT');

select e1.empno, e1.ename, e1. hiredate, e1.sal
from emp e1, emp e2
where (e1.sal < e2.sal) and e2.ename='SCOTT';

select * from CAR_MODEL;

update car_model
set car_img = 'qm5_001.jpg'
where car_img='qm5_001.jpg,qm5_002.jpg';


update car_model
set car_img = 'qm5_003.jpg'
where car_img='qm5_003.jpg,qm5_004.jpg';

update car_model
set car_img = 'qm5_005.jpg'
where car_img='qm5_005.jpg,qm5_006.jpg';

commit;
