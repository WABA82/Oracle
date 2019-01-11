/*����
1. ��� ���̺��� '10' �μ��� �ƴϸ鼭 ������ 1000�̻� 3000������
��� �������  �����ȣ,�����, �Ի���,�μ���ȣ, ������ ��ȸ�ϼ���.
*/
select * from EMP;

select empno, ename, hiredate, deptno, sal
from emp
where deptno != 10 and sal between 1000 and 3000;
/*
2. ��� ���̺��� ���ʽ��� �����ϴ� �������  �����ȣ,�����,
    ����,���ʽ�, �Ѽ��ɾ�, ������ ��ȸ �ϼ���.
    - ������ ������ 12������ ���� ����� ��.
*/

select empno, ename, sal, comm, sal+nvl(comm,0) as bonus, sal/12 as pay
from emp;

/*
3.  ��� ���̺��� �μ���ȣ�� 10,30��  ������� �����, �����ȣ
    �Ի���, ������ ��ȸ �ϼ���.
    -��, �����  xxxx�� xxxx����� xxxx�⿡ �Ի��Ͽ��� ������ xxx$�Դϴ�.
        �� �������� �ϰ�, �÷����� output ���� �����Ұ�.
*/

select empno || '�� ' || ename || '����� ' || hiredate || '�⿡ �Ի��Ͽ��� ' || '������ ' || sal || '$�Դϴ�.' as output
from emp
where deptno in (10, 30);

/*
4. ��� ���̺��� ������ 3000 �̸��� ������� �����ȣ, �����,
   �Ի���, ����,����, �μ���ȣ�� ��ȸ �ϼ���.
   ��, ������ ������������ �����ϵ� ������ ���ٸ� ������� ������������
   �����Ұ�.
*/
select empno, ename, hiredate, sal, job, deptno
from emp
where sal<3000
order by sal asc, ename desc;

/*
5. test_like ���̺� �Ʒ��� ���� �����͸� �߰��Ұ�.
    7, ����������,����� ���۱� �󵵵�,'�����'
    8, ���븸,����� ���빮�� ���빮1��,'��Ÿ��'
    9, ���¼�,����� ���빮�� ���빮2��,'�����'
*/
insert into test_like(NUM, NAME, LOC, HIGHSCHOOL)
values(7,'����������','����� ���۱� �󵵵�','�����');

insert into test_like(NUM, NAME, LOC, HIGHSCHOOL)
values(8, '���븸','����� ���빮�� ���빮1��','��Ÿ��');

insert into test_like(NUM, NAME, LOC, HIGHSCHOOL)
values(9, '���¼�','����� ���빮�� ���빮2��','�����');

commit;
/*
6. test_like ���̺��� '�����'�� �����ϴ� �л���  ��ȣ,�л���,
    �ּ�, �б������� �Ʒ���  ���� �������� ����ϰ�
     �÷����� ��ҹ��� �����Ͽ� Output����  �Ұ�.
    ������� :  ��ȣ : x, �̸� : xx, �ּ� : xx, �б� : xx
*/
  select '��ȣ : ' || num || ', ' || '�̸� : ' || name || ', ' || '�ּ� : ' || LOC || ', ' || '�б� : ' || HIGHSCHOOL  as "Output"
  from TEST_LIKE
  where LOC like '�����%';
/*
7. ������̺��� ������� 4�����̰ų� ������ 3000�̻��� �����
   �����ȣ, �����, ����, �Ի���, �μ���ȣ, ������ ��ȸ�Ұ�.
   ��, ��� �����ʹ� ������ ������������ �����ϰ�, ������ ���ٸ�
   ������� ���� �������� �����Ұ�.
*/

select empno, ename, sal, hiredate, deptno, job
from emp
where ename like '____' or sal >= 3000
order by sal asc, ename asc;

--8.  test_like ���̺��� ����б����� ����ϰ� �б����� ����
--    �������� �����Ͽ� ����� ��.
--    ��, ����б� ���� ���ٸ� �ϳ��� ����ϼ���.(2������ �� ��.)

select distinct HIGHSCHOOL
from TEST_LIKE
order by HIGHSCHOOL asc;

select * from TEST_LIKE;


--9. ��� ���̺��� �����ȣ, �����, �Ի���, ����, ���⿬����
--    ��ȸ �ϼ���.
--    ���� ������ ���� �������� 7% ���� �ݾ����� ����Ͽ� ����Ұ�.
select EMPNO, ENAME, HIREDATE, SAL , SAL + (SAL * 0.07) as nextyear_sal
from emp;

--10. ��� ���̺��� ������� 5�����̸鼭 ����° ���ڿ� 'A'�� ���
--    �� ����� �����, �����ȣ, �Ի���, ������ ��ȸ�ϼ���.
--    ��, ������ ������������ ����Ұ�.
select EMPNO, ENAME, HIREDATE, SAL
from emp
where ENAME like '__A__'
order by sal asc;

--11. ��� ���̺��� ������� 'A'�� �����ϸ鼭 ������ 1600�̻���
--     ����� �����,����,����, �Ŵ�����ȣ, �Ի����� ��ȸ �Ұ�.
select ENAME, SAL, JOB, MGR, HIREDATE
from emp
where ename like 'A%' and sal>=1600;
