--update��������

--�ܼ���
--cp_emp3 ���̺��� �����ȣ�� '1111'�� ����� ������
--emp���̺��� �����ȣ�� 7788�� ����� �������� ����

update cp_emp3
set sal = (
select sal
from emp
where empno=7788
)
where empno = '1111';



--�ܼ��࿡ �������� �߻��ϸ� ����
update cp_emp3
set sal = (
select sal
from emp
)
where empno = '1111';
-- �÷��� ������
update cp_emp3
set sal = (
select sal, deptno
from emp
where empno=7788
)
where empno = '1111';

--������ where in
insert into cp_emp3 (empno, ename, deptno, job, sal)
values(2222,'�׽�Ʈ',30,'SALESMAN',2000);
commit;
-- cp_emp
update cp_emp3
set sal = (
select sal
from emp
where empno=7788
)
where empno = '1111';

select * from CP_EMP3;

--cp_emp3���� emp���̺��� �μ���ȣ�� 30���� ��������� �����ȣ�� ���� ����� ������ 1000���� ����
select empno
from emp
where deptno=30;

update cp_emp3
set sal = 1000
where empno in (select empno
from emp
where deptno=30
);

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--delete��������
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--�ٸ� ���̺� ���� ������ ���� ���̺��� ���ڵ带 ����

--�ܼ���
--cp_emp3���� ������� ����
-- ���� : emp���� ''BLAKE'�� �����ȣ�� ���� ����� cp_emp3 ����

update cp_emp3
set ename='���ī'
where empno = 7698;
commit;

delete
from CP_emp3
where empno = (
select empno
from emp
where ename = 'BLAKE');

--������ : �������� ����
--emp���� �μ���ȣ�� 30�� ������� �����ؼ� cp_emp3���� �μ���ȣ�� ���� ������� ��� ������
delete
from CP_emp3
where empno in (
select empno
from emp
where deptno = 30);

select * from CP_EMP3;
