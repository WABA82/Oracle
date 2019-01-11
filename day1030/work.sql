--1. ��ⷮ�� 1500~3000 ������ ������ ������,������,�𵨸�,���,����,
--    �̹���,�Է���,��ⷮ, �ɼ��� ��ȸ
--
----------��. ����� ��ⷮ�� �������� ���������� 3~6��° ���ڵ常 ��ȸ�ϰ�,
--
--     �ɼ��� ó�� ',' ������ ��� �Ұ�. ���ݰ� ������ 3�ڸ����� ,�� �־����,
--     �Է����� ��-��-�� �� �������� ��� �Ұ�.

select * from CAR_COUNTRY;
select * from CAR_MAKER;
select * from CAR_MODEL;

select R,COUNTRY, MAKER, MODEL, to_char(CAR_YEAR,'9,999'), to_char(PRICE,'99,999'), CAR_IMG, to_char(HIREDATE,'mm"��" dd"��" yyyy"��"'), CC, substr(CAR_OPTION,1,instr(CAR_OPTION,',')-1)
from (select rownum as R, COUNTRY, MAKER, MODEL, CAR_YEAR, PRICE, CAR_IMG,HIREDATE, CC, CAR_OPTION
	    from (select CON.COUNTRY, CON.MAKER, CMA.MODEL,CAR_YEAR, CMO.PRICE, CMO.CAR_IMG,CMO.HIREDATE, CMO.CC, CAR_OPTION
				from car_country con, car_maker cma, car_model cmo
				where (cma.maker(+) = con.maker and cmo.model(+) = cma.model) and cmo.cc between 1500 and 3000
	    		order by cmo.cc desc))
where R between 3 and 6;

select rownum, to_char(CMO.CAR_YEAR,'9,999'), to_char(CMO.PRICE,'99,999'), CMO.CAR_IMG, to_char(CMO.HIREDATE,'mm"��" dd"��" yyyy"��"'), CMO.CC, substr(CAR_OPTION,1,instr(CAR_OPTION,',')-1)
from car_model cmo
order by cmo.cc desc;

--2. �μ���ȣ�� 10�� 30,40���� ��� �μ��� �����ȣ,�����,�Ի���,
--   ����,��������,�μ���,�μ���ȣ,��ġ, �����ȣ,�õ�, ����,��,���� �� ��ȸ.

----  ��,����� �����ȣ�� ������������ �������� �� 2~5��° ���ڵ常 ���,

--   �����ȣ�� '-' �ں��� ������ ���, ������ ���ٸ� '��������'���� ��ü
--  �Ͽ� ��� ,�Ի����� ��-��-�� ���ϱ��� ���

select * from DEPT;
select * from EMP;
select * from ZIPCODE;

select R, EMPNO, ENAME, HIREDATE, SAL,rank() over(order by SAL desc) as RANK, DEPTNO, LOC, substr(zipcode,instr(ZIPCODE,'-')+1), SIDO, GUGUN, DONG, nvl(BUNJI,'��������')
from(select rownum as R, EMPNO, ENAME, HIREDATE, SAL, DEPTNO, LOC, ZIPCODE, SIDO, GUGUN, DONG, BUNJI
		from(select E.EMPNO, E.ENAME, E.HIREDATE, E.SAL, DT.DEPTNO, dt.LOC, zip.zipcode,SIDO, GUGUN, DONG, BUNJI
				from dept dt, emp e, zipcode zip
				where (e.deptno = dt.deptno and  zip.seq=e.empno) and dt.deptno in (10,30,40)
				order by e.empno asc))
where R between 2 and 5;

--3. ������ �����簡 '����','���','�Ｚ','BMW','AUDI'�̰� �ɼǿ� 'ABS','TCS'��
-- �ִ� ������  ������, ������,�𵨸�, ����,����, �ɼ�, �̹���, ��ⷮ ��ȸ

--  --��, ������ �������� �����ϰ�, ������ ���ٸ� ������ ������������ ����

--   �Ͽ� ���, �̹����� �̹������ Ȯ���ڸ� �����Ͽ� ����Ұ�,
--   ��������� ������ Bmw, Audi �� �������� ��� .


select COUNTRY, initcap(MAKER), MODEL, CAR_YEAR, PRICE, CAR_OPTION, substr(car_img,1,instr(CAR_IMG,'.')-1),substr(car_img,instr(CAR_IMG,'.')+1), CC
from(select CC.COUNTRY, CC.MAKER, CMA.MODEL, CAR_YEAR, PRICE, CAR_OPTION, CAR_IMG, CC
		from CAR_COUNTRY CC, CAR_MAKER CMA, CAR_MODEL CMO
		where (cma.maker(+) = cc.maker and cmo.model(+) = cma.model) and cc.maker in ('����','���','�Ｚ','BMW','AUDI'))
where (car_option like '%ABS%' or car_option like '%TCS%')
order by CAR_YEAR desc, PRICE desc;

select rpad(PRICE,7,0)
from CAR_MODEL;

--4. �𵨸��� 'K5','�ƹ���', '�ҷ���','A8','SM3' �� ������ �𵨸�, ������,
--  ������,����,������ �Ʒ��� ���� ������ �������� ���.

--  ��, ��� ������ ���������� �������� �� 2~7 ������ ���ڵ常 ���,

--   [�𵨸�] ������ ������ [ xxxx ]�̰�, �������� [����|����]�̸�,
--   [XX]�簡 �������Դϴ�. ������ [0,000,000]�� �Դϴ�.

select R, '['||MODEL||']' ||' ������ ������'|| '['||CAR_YEAR||']' || '�̰�, �������� ' || '['||COUNTRY||']' || '�̸�,' || '['||MAKER||']' || '�簡 �������Դϴ�. ������ ' || '['||to_char(rpad(PRICE,7,0),'0,000,000')||']'
from	(select rownum as R, MODEL, CAR_YEAR, COUNTRY, MAKER, PRICE
		from(select cma.MODEL, CAR_YEAR, cc.COUNTRY, cc.MAKER, cmo.PRICE
				from CAR_COUNTRY CC, CAR_MAKER CMA, CAR_MODEL CMO
				where (cma.maker(+) = cc.maker and cmo.model(+) = cma.model) and cmo.model in ('K5','�ƹ���','�ҷ���','A8','SM3')
				order by cmo.PRICE asc))
where R between 2 and 7;

--5. �����簡 '����'�� ������ ���, �𵨸�, ���ĺ� �Ѱ����� ��ȸ .
--
--select e1.empno, e1.ename, e1. hiredate, e1.sal
--from emp e1, emp e2
--where (e1.sal < e2.sal) and e2.ename='SCOTT';

select cmo.CAR_YEAR,cmo.MODEL, sum(PRICE)
from car_maker cma, car_model cmo
where (cmo.model = cma.model)
	and cma.maker = '����'
group by rollup(cmo.model, cmo.car_year);

--6. ������� 'S'�� �����ų� �̸�5���̸鼭 ����° ���ڰ� 'A'�� -
		where ename like '%S' or ename like '__A__'
--   �����  �����ȣ, �����, �Ի���,����,����, �Ǽ��ɾ�, �����λ��, �μ���ȣ,�μ���,��ġ,�����ȣ,�õ�, ����,��,���� �� ��ȸ
		select EMPNO, ENAME, HIREDATE, SAL, SAL*0.033 as tax, to_char(SAL+(SAL/12)+nvl(COMM,0)-(SAL*0.033),9999.99) as realget, DEPTNO, DNAME, LOC, ZIPCODE, SIDO, GUGUN, DONG, BUNJI, SEQ
--   ��,�Ǽ��ɾ��� ����+������+���ʽ�-����(���� 3.3) �� ���

--     �����λ���� �μ���ȣ�� ���� ���� �λ�
		to_char(decode(deptno,10,SAL*0.07,20,SAL*0.04,30,SAL*1.0,SAL*0.03),'0,000')
--     10- ��� 7%, 20- ��� 4%, 30- ���+���ʽ� 10%, �׿� 3%��
--     ����Ͽ� 3�ڸ����� ,�� �־� ���.
--     ��� ����� �ҹ��ڷ� ���.
-- ename

select * from DEPT;
select * from EMP;
select * from ZIPCODE;

select e.empno, e.ename, e.hiredate, e.sal, SAL*0.033 as tax, to_char(SAL+(SAL/12)+nvl(COMM,0)-(SAL*0.033),9999.99) as r_sal,
		d.deptno, dname, z.zipcode, z.sido, z.gugun, z.dong, z.bunji
from emp e, dept d, zipcode z
where (e.empno = z.seq and e.deptno = d.deptno)


case deptno when 10 then 0.07
				when 20 then 0.04
			    when 30 then 0.1+comm*0.1
			else 0.03      
			
--select empno, ename, deptno, sal,
--case deptno when 10 then sal * 0.2 + sal + nvl(comm,0)
--				when 20 then sal * 0.5 + sal + nvl(comm,0)
--				when 30 then sal * 0.3 + sal + nvl(comm,0)
--				else sal * 0.1 + sal + nvl(comm,0)
--				end incen
--from emp;	