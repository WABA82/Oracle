--insert��������

--�ܼ���
--cp_emp3�� ���ڵ� �߰�
--�����ȣ 1111, ����� ����ö, �μ���ȣ 10 , ���� ���, ���� emp���̺��� �����ȣ�� 7566���� ������ ������ �������� å��

insert into CP_EMP3(empno,ename,deptno, job, sal)
values (1111,'����ö',10,'���',(
select sal
from emp
where empno = 7566
));

--������ ���������� �����ϴ� ������ �������� ���Ǹ� ������ �߻��Ѵ�.
--�������� ������ ��� ����
insert into CP_EMP3(empno,ename,deptno, job, sal)
values (1111,'����ö',10,'���',(
select sal
from emp
));
--�÷��ϳ��� ���� �־�� �ϴ� ���� �÷� �������� ��ȸ�Ǹ�
--�߰��ϴ� ���� ������ ���� �����Ƿ� ����
insert into CP_EMP3(empno,ename,deptno, job, sal)
values (1111,'����ö',10,'���',(
select sal, deptno
from emp
where empno = 7566
));


--�������Է�
--emp���̺��� 30�� �μ��� �����ȣ ����� �μ���ȣ ���� ���� ��ȸ�Ͽ� CP_EMP3�� �߰�
insert into cp_emp3(empno, ename, deptno, job, sal)
(select empno, ename, deptno, job, sal
from emp
where deptno = 30);

select * from CP_EMP3;

--������̺��� 1981-02�� �Ի��� ����� ����, ����, �Ի��-��, �Է����� test���̺� �߰�

create table test(job varchar2(9), sal number(7,2), hiredate date);
alter table test add input_date date;
alter table test modify hiredate varchar2(7);

insert into test (job, sal, hiredate, input_date)
(select job, sum(sal), to_char(hiredate, 'yyyy-mm'), sysdate
from emp
where to_char(hiredate,'yyyy-mm') = '1981-02'
group by job, hiredate);

select * from TEST;
