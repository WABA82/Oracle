--�÷��� �ٿ� ���ڿ��� ��ȸ: ||
--EMP���̺��� �����ȣ, �����, ������ ��ȸ
--��������� : �����(�����ȣ)�� XXX�����Դϴ�.
--alias�� ""�� ��� �ο��ϸ� ��ҹ��ڰ� ������ �÷��� ���´�.
select		ename ||' ('|| empno ||')���� '|| job || '���� �Դϴ�.' as ouput
from		emp;

--alias�� �ٷ� �Ʒ� where ������ ����� �� ����.
select		empno, ename, sal as s
from		emp
where		sal < 3000;

--��� ������ : +, -, *, /
--��� ���̺��� �����ȣ, �����, ����, ������ ��ȸ
--��, ������ ������ 3.3%.�� ����ؼ� ���
--�����ȣ�� ���� ��ȣ�� 10�� ���� ������ ���
select     empno, empno+10 as new_empno, ename, sal, sal* 0.033 as tax
from		emp;

--�÷����� ����
select		empno - mgr
from		emp;

--null�� ����Ǹ� ����� null�� ���´�.
--������̺��� �����ȣ, ����, ���ʽ�, �Ѽ��ɾ��� ��ȸ
--��, �� ���ɾ��� ������ ���ʽ��� �ջ��� �ݾ����� ��ȸ
--null�� �÷��� ������ �ϱ� ���ؼ� nvl()�Լ��� ���.
select		empno, sal, comm, sal+nvl(comm,0) as total
from		emp;

--���� �������� ���ϴ� �Լ� : mod(�÷���, ������) �Լ� ���
--dual ���̺� : ��� �������� ����� �� �ִ� ���� ���̺�
--					�Է��Ǵ� ������ �÷��� �����Ͽ� ��ȸó��
select		'������' as name, mod(11,2), mod(1993,12)
from		dual;
-- 11 : ���, 10 : ��, 9 : ��, 8 : ��, 7 : �䳢, 6 : ȣ����, 5 : ��, 4 : ��, 3 : ����, 2 : ��, 1 : ��, 0 : ������

--��ȸ�ϴ� �÷��� ���迬���ڸ� ����ϸ� Error
select sal > 300
from emp;

--���迬���� : where������, having�� ���
--> , <, >=, <=, =, !=

--������̺��� ������ 3000���� ����� �����ȣ,
--�����, �Ŵ�����ȣ, ����, �Ի���, �μ���ȣ ��ȸ
select  empno, ename, mgr, sal, hiredate, deptno
from EMP
where sal <= 3000;

--������̺��� ������ 3000�� �ʰ��� ����� �����ȣ,
--�����, �Ŵ�����ȣ, ����, �Ի���, �μ���ȣ ��ȸ
select empno, ename, mgr, sal, hiredate, deptno
from emp
where sal >= 3000;

--������̺��� �μ���ȣ�� '30'���� �������
--�����ȣ, �����, ����, �Ի��� ��ȸ
select empno, ename, job, hiredate
from emp
where deptno=30;

--������̺��� �μ���ȣ�� 20���� �ƴ� �������
--�����ȣ, �μ���ȣ, �����, ���� ��ȸ
select empno, deptno, ename, job
from emp
where deptno !=20;
--where deptno<> 20;

--������̺��� ���ʽ��� ���� �����
--�����ȣ,�����,����,���ʽ��� ��ȸ
--null�� ���迬���ڷ� ���Ҽ� ����. ��� is null, is not null�� ��ȸ
select empno, ename, sal, comm
from emp
where comm is null;

--�������� : and(���� true�� ���), or(�ϳ��� �̶� true�� ���), not()


--������̺��� �����ȣ�� 7369�̸鼭 ������ clerk��
--����� �����ȣ, �����, ����, �Ի���, ���� ��ȸ
select empno, ename, job, hiredate, sal
from emp
where empno=7369 and job='CLERK';

--������̺��� ������ 1500�̻� �̸鼭 3000������ ������� �����ȣ, �����, ����, �Ի���, ���� ��ȸ
--������ �˻��������� ����� ������ between �� ����� �� �ִ�.
--����> �÷��� between ������ and ū��
select empno, ename, job, hiredate, sal
from emp
where sal between 1500 and 3000;
--where sal >= 1500 and sal <=3000;

--������̺��� 7902, 7839 �Ŵ����� ������ �޴� �����
--�����ȣ, �����, �Ŵ�����ȣ, ����, �Ի����� ��ȸ
--or�� in���� ��ü �� �� �ִ�.
--����> �÷��� in (��,,,)
--in�� �����ϴ�, not in�� �������� �ʴ�
select empno, ename, mgr, sal, hiredate
from emp
where mgr in (7902, 7839, 7566);
--where mgr=7902 or mgr=7839 or mgr=7566;
