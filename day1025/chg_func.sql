--��ȯ �Լ�
--���ڿ��� �ƴ� ��(����, ��¥)�� ���ڿ��� ��ȯ
--���� -> ������ �ڸ��� , �Ǵ� . ���

select to_char(20181025,'0,000,000,000'),
		to_char(20181025,'9,999,999,999')
from dual;

select to_char(2018.1025, '099,999.999' )
from dual;

--������̺��� �����ȣ, �����, �Ի���, ���� ��ȸ
--��, ������ �����Ͱ� �ִ� �� ������ ,�� �־� ���
select empno, ename, hiredate, to_char(sal,'9,999,999')
from emp;

--to_char�Լ��� ��ȯ�Ǵ� ����� ���ڿ��̹Ƿ� ������� �ʴ´�.
select to_char(sal,'9,999')+100
from emp;

select to_char(sal+100,'9,999')
from emp;

--��¥ -> ���ڿ���ȯ
select to_char(sysdate, 'yyyy-mm-dd am hh(hh24): mi : ss dy q "�б�"')
from dual;
--pattern�� Ư�����ڰ� �ƴ� ���ڿ��� ����� �� "___"
select to_char(sysdate, 'yyyy"��"mm"��"dd"��"am hh(hh24)"�� "mi"�� "ss"�� "day q"�б�"')
from dual;
--pattern�� �ʹ� ��� �ۼ��ϸ� ���ι��� ������ �߻��Ѵ�
select to_char(sysdate, 'yyyy"��"mm"��"dd"�� " am hh(hh24)"�� "mi"�� "ss"�� "day q"�б�"')
from dual;

--������̺��� �����ȣ, �����, �Ի����� ��ȸ�ϼ���
--��, �Ի����� ��-��-��- ������ �������� ��ȸ ����� ��
select empno, ename, to_char(hiredate, 'yyyy-mm-dd day hh24:mi:ss')
from emp;

--������̺��� �Ի�⵵�� 1981���� ������� �����ȣ, �����, �Ի���, ���� ��ȸ
select empno, ename, hiredate, sal
from emp
where to_char(hiredate, 'yyyy') = '1981'
order by to_char(hiredate, 'mm') asc, sal asc ;

--to_date()
--���糯¥�� �ƴ� ��¥�� �߰��� ��
-- ��¥ ������ ���ڿ� �߰��ϱ�

select * from CLASS4_INFO;

insert into class4_info(num,name,input_date)
values(8,'�缼��','2018-10-21');

insert into class4_info(num,name,input_date)
values(9,'�缼��',to_date('2018-10-22','yyyy-mm-dd'));
commit;

select to_char(input_date, 'yyyy-mm')
from class4_info;

--to_char�� ��¥�� ���ڸ� �Է¹޾ƾ� �մϴ�.(�Լ��� ��(����))�� ������Ÿ���� �����Ѵ�.)
select to_char(to_date('2018-10-25','yyyy-mm-dd'),'mm')
from dual;

--���ں�ȯ : to_number('���������� ���ڿ�)
select '25'-'10', to_number('25')-to_number('25')
from dual;

--------------------------------------------------------------------------------------------------------------------------------------------------
---- ���� �Լ� : decode(�÷���, �񱳰�, ��°�, �񱳰�, ��°�,,,�񱳰��� ������ ��°�)
--------------------------------------------------------------------------------------------------------------------------------------------------

--������̺��� �����ȣ, �����, ����, �μ��� ��ȸ
--��, �μ����� �Ʒ��� ǥ�� �ش��ϴ� �μ������� ���
--10-���ߺ�
--20-��������
--30-ǰ�������μ�
--40-Ź����

select empno,ename,sal,deptno,decode(deptno,10,'���ߺ�',20,'����������','Ź����') as dename
from emp;

--�����ȣ, �����, ����, �μ���ȣ, �μ�Ƽ��
-- ��, �μ��� �μ����� �Ʒ��� ǥ�� ���� ��������
-- 10 ������ 20%, 20 ������ 50%, 30 ������ 30% �׿� ���� 10%
select empno, ename, deptno, sal, decode(deptno,10,sal*0.2,20,sal*0.5,30,sal*0.3,sal*0.1) as incen
from emp;

--CASE ��
select empno, ename, deptno, sal,
		case deptno when 10 then '���ߺ�'
						when 20 then '��������'
        				when 30 then 'ǰ������'
        				else 'Ź����'
        end as dname
from emp;


-- �����ȣ, �����, ����, �μ���ȣ, �Ѽ��ɾ� ��ȸ
-- �Ѽ��ɾ��� ����+���ʽ�+�μ� �����ȴ�.
-- ��, �μ��� �μ����� �Ʒ��� ǥ�� ���� ��������
-- 10 ������ 20%, 20 ������ 50%, 30 ������ 30% �׿� ���� 10%
select empno, ename, deptno, sal,
case deptno when 10 then sal * 0.2 + sal + nvl(comm,0)
				when 20 then sal * 0.5 + sal + nvl(comm,0)
				when 30 then sal * 0.3 + sal + nvl(comm,0)
				else sal * 0.1 + sal + nvl(comm,0)
				end incen
from emp;


--������̺��� �����ȣ, �̸�, ������ ��ȸ
--��, ������ ù ���ڰ� C�� �ĸ����, S�� �� �����ִ� ��� M�� ������ A�� ���캸�� ��� P�� �θ�

select * from emp;

select empno, ename, job, decode(substr(job,1,1),'C','�Ҹ�ǰ','S','�� �����ִ� ���','M','������','A','���캸�� ���','P','�θ�') as SCRIPT
from emp;

select empno, ename, job,
		case substr(job,1,1) when 'C' then '�Ҹ�ǰ'
								when  'S' then '�� �����ִ� ���'
								when 'M' then '������'
								when 'A' then '���캸�� ���'
								when 'P' then '�θ�'
								end as SCRIPT
from emp;                
