--1. ������̺��� �����ȣ, �����,����, �Ŵ�����ȣ,����,
--   �Ի����� ��ȸ�ϼ���.
-- ��, ������ ������������ �����ϵ�, ������ ���ٸ� �����ȣ��
--    ������������ �����ϼ���.
--    �Ի����� ��-��-���� �������� ����ϼ���.
--    ������ 3�ڸ����� ,�� �־� ����ϼ���.

select EMPNO, ENAME, JOB, MGR, to_char(SAL,'9,999,999'), to_char(HIREDATE,'mm-dd-yyyy')
from emp
order by sal asc, empno desc;

--2. ������̺��� 3,4�б⿡ �Ի��� �������  �μ��� ������,
--    �������, �ְ���, ��������, ������� ��ȸ�Ͽ� �Ʒ��� ���� ����ϼ���.
--    ��¿� )  10���μ� ������� [x]��, ������� : [xx],
--	   �ְ��� [xx], ��������[xx]

select
from
where to_char(hiredate,'q'=) 

--3. TEST_ORDERBY���̺��� ��ȣ�� ����ϼ���.
--   ��, ��µǴ� ��ȣ��  S_0000000001 ��������
--   10�ڸ��� ���ڰ� �Ǿ���ϸ�, 10�ڸ��� ���� �ʴ� ���ڴ�
--  �տ� 0�� �ٿ� 10�ڸ��� ����� 'S_' �� �ٿ� ����Ѵ�.

select concat('S_',lpad(num,10,0))
from TEST_ORDERBY;

select * from TEST_ORDERBY;

--4. ������̺��� �μ���ȣ, �μ���, ����,���ʽ�,�Ѽ��ɾ�,
-- �Ի����� ��ȸ�ϼ���.
--   ��. �Ѽ��ɾ��� '����+����+���ʽ�'�� �ջ��� �ݾ�����
--   ��ȸ�ϼ���.  ������ ������ 12�� ���� ���� ������ �����Ͽ�
--   ����ϼ���.

select DEPTNO, decode(DEPTNO,10,'�μ�1',20,'�μ�2',30,'�μ�3') as deptname, SAL, COMM, sal+trunc(sal/12,-1)+comm as total, HIREDATE
from EMP;

--5. ��� ���̺��� �μ���ȣ,�μ���,����, ���ʽ�, �μ�Ƽ�긦
--   ��ȸ�ϼ���.
--   �μ�Ƽ���  �Ʒ�ǥ�� ���� �μ����� ���� �����մϴ�.
--   10- ���޿� 100%, 20- ���޿� 150%, 30 - ���޿� 300%
--   �׿� ���޿� 50%

select DEPTNO, decode(DEPTNO,10,'�μ�1',20,'�μ�2',30,'�μ�3') as deptname, SAL, COMM,
case deptno when 10 then sal*1
when 10 then sal*1.5
when 10 then sal*3
else sal*0.5
end incen
from EMP;

--6. class4_info ���̺� �Ʒ��� ���� �����͸� �߰��մϴ�.
--   ��ȣ - 10, �̸� - Ȳ�缺, �ֹι�ȣ - 030101-3234567
--   ��ȣ - 12, �̸� - �ż���, �ֹι�ȣ - 011201-4234567
--   ��ȣ - 13, �̸� - �ڳ���, �ֹι�ȣ - 880101-2234567
--   ��ȣ - 14, �̸� - ��ſ�, �ֹι�ȣ - 880101-2234567

select * from CLASS4_INFO;

insert into class4_info(num, name, ssn)
values(10,'Ȳ�缺','030101-3234567');

insert into class4_info(num, name, ssn)
values(12,'�ż���','011201-4234567');

insert into class4_info(num, name, ssn)
values(13,'�ڳ���','880101-2234567');

insert into class4_info(num, name, ssn)
values(14,'��ſ�','880101-2234567');

commit;

--7. class4_info ���̺��� ��ȣ, �̸� , �ֹι�ȣ,
--   ������ ��ȸ �ϼ���.
--   ������ �ֹι�ȣ��   8��° �ڸ��� ���Ѵ�.
--   8��° �ڸ��� 1,3�̸� ����, 2,4�� ���� �׷��� ������ "����"
--   ������Ѵ�.

select NUM, NAME, SSN,
decode ( substr(ssn,8,1) when 1 then '����'
						when 3 then '����'
						when 2 then '����'
						when 4 then '����'
						end as gender
from class4_info;

select * from CLASS4_INFO;

