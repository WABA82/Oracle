select * from CAR_COUNTRY;
select * from CAR_MAKER ;
select * from CAR_MODEL;

--1. ��� ���̺��� �����ȣ,�����, ����, ���ʽ��� ��ȸ
--   ��, ��� ��ȣ�� �������� ���� ���� �� 3~5������ ���ڵ常 ��� �ϰ�
--      ������ 7�ڸ��� ���� ����ϰ� ,�� �־� ����Ѵ�.
--      �ش� �ڸ��� ���� ������ 0�� ����Ѵ�.

--select rownum, r, empno, ename, to_char(hiredate)
--from (select rownum as R, empno, ename, hiredate
--		from (select rownum, empno, ename, hiredate
--				from emp order by hiredate desc))
--where r between 2 and 6 ;

select rownum, R, EMPNO, ENAME, SAL, COMM
from ( select rownum as R,EMPNO, ENAME, SAL, COMM from (select rownum, EMPNO, ENAME, SAL, COMM from emp order by empno desc))
where r between 3 and 5;

--2. class4_info ���̺��� ��ȣ, �̸� , ����, �¾ �ظ� ��ȸ �ϼ���.
--   �¾ �ش� ����⵵-����+1 �� ���մϴ�.
sysdate-age+1 as birth;

select age, to_char(sysdate,'yyyy')-age+1 as birth
from class4_info;

select num, name, age, to_char(sysdate,'yyyy')-age+1 as birth
from  class4_info;

--3. class4_info ���̺� ��ȣ, �̸� ����, �̸���, �̸����� ��ȿ�� ���θ�
--   ��ȸ.
--   ��, �̸����� ��ȿ���� '@' �� ������ '��ȿ', '@'�� �����ϸ� '��ȿ'�����
select substr(email,instr(email,'@'),1)
from class4_info;

select decode(substr(email,instr(email,'@'),1),'@','��ȿ','��ȿ')
from class4_info;

select num,name,age,email,decode(substr(email,instr(email,'@'),1),'@','��ȿ','��ȿ') as PO
from class4_info;

--4. car_model ���̺��� �ɼǿ� 'ABS'�� '�����'�� �ִ� ������
--    �𵨸�,���,����,�ɼ�, �̹���, �����縦 ��ȸ �ϼ���.
--    ��, ������ ������������ �����Ͽ� ����� ��.

select CAR_OPTION
from CAR_MODEL
where CAR_OPTION like '%ABS%' or CAR_OPTION like '%�����%';

select MODEL, CAR_YEAR, PRICE, CAR_OPTION, CAR_IMG, CC
from (select MODEL, CAR_YEAR, PRICE, CAR_OPTION, CAR_IMG, CC
from CAR_MODEL
where CAR_OPTION like '%ABS%' or CAR_OPTION like '%�����%')
order by price desc;

--5. car_model ���̺��� �𵨸��� '�ƹ���', '�ҷ���', 'A8'�� ������
--    �𵨸�,�𵨺� ���� ���հ� �Ѱ踦 ��ȸ �ϼ���.

--having�� �׷�ȭ ���� ����
--rollup :  �׷캰 �Ұ�� �Ѱ踦 ���� �� ����ϰ� ����� ���ڵ� ��� �Ŀ� �����ش�.
--cube : �׷캰 �Ұ�� �Ѱ踦 ���� �� ����ϰ� ����� ���ڵ� ��� ���� �����ش�.

select MODEL, PRICE, sum(price)
from car_model
where model like '�ƹ���' or model like '�ҷ���' or model like 'A8'
group by rollup(model,price);

select * from CAR_MODEL;
select * from CAR_MAKER;

--6. car_model ���̺��� ���� ������ 1500~3000 ������ ������
--   �𵨸�, ���, ����, �ɼ�, �Է���, ���ݺ� ������ ��ȸ�ϼ���.
--   ��, ���ݺ� ������ �ߺ����� �ʴ� ��ȣ�� ��µǾ���մϴ�.
--
--	* rank() over() : �ߺ� ������ �߻� �� �� ����
--	*
--row_number() over() : �ߺ� ������ �߻����� ����
--	*
--rank() over(order by ������ �÷� asc/desc) : �ܼ� ���� ���ϱ�
--	*
--rank() over(partition by) �׷� �÷��� order by �÷��� asc/desc : �׷캰 ���� ���ϱ�
--


select MODEL, CAR_YEAR, PRICE, CAR_OPTION, HIREDATE, row_number() over(order by price asc) as ranking
from car_model
where price between 1500 and 3000;

--7. ��� ���̺��� �Ի�⵵�� 1981�� �̻��̸鼭 �Ŵ����� �ִ�  �����
--   �����ȣ,�����,����,�Ŵ�����ȣ, ���� ������ ��ȸ �ϼ���.
--   ��, ���������� ������ ������ �� ������ ������ �����ݴϴ�.

select * from EMP
order by hiredate desc;

select EMPNO, ENAME, MGR, SAL, rank() over(order by sal asc) as ranking, hiredate
from (select empno, ename, sal, hiredate,mgr from emp where hiredate >= all(select hiredate from emp where to_char(hiredate,'yyyy')='1981') order by hiredate asc)
where mgr is not null;


select rownum, empno, ename, hiredate
from (select rownum, empno, ename, hiredate from emp order by hiredate desc)
where hiredate >= all(select hiredate from emp where to_char(hiredate,'yyyy')='1981');

