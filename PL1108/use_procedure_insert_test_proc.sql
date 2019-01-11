create table test_proc as
(select empno, ename, hiredate, sal, job from emp
	where 1=0);

alter table test_proc add constraint pk_test_proc primary key(empno);

select*from user_constraints
where constraint_type = 'P';


--insert_test_proc ���ν����� �����ϱ� ����
var msg varchar2(300);
var cnt number;

--���� ����
exec insert_test_proc(1111,'�׽�Ʈ',3000,'����', :msg, :cnt);


print msg;
print cnt;

--1.������� : �����ȣ `1~9999�� ����
exec insert_test_proc(10000,'�׽�Ʈ',3000,'����', :msg, :cnt);
exec insert_test_proc(0,'�׽�Ʈ',3000,'����', :msg, :cnt);

print msg;
print cnt;

select * from test_proc;

--2.������� : ������ 2500���� 8000���̸� �Է��� �� �ֽ��ϴ�.
-- ������ 2500���� ��� 2500����  8000�̻��̸� 8000���� ���

exec insert_test_proc(1112,'�׽�Ʈ',2400,'���', :msg, :cnt);
exec insert_test_proc(1113,'�׽�Ʈ',8500,'���', :msg, :cnt);

print msg;
print cnt;

select * from test_proc;

--3. ������� : '���', '����', '�븮', '����', '����', '����', '�̻�'�� ���޸� �Է��� �� �ִ�.

exec insert_test_proc(1114,'�׽�Ʈ',1400,'�˹�', :msg, :cnt);

print msg;
print cnt;

select * from test_proc;

--4 ������� : ������� �����ΰ��  ù�ڸ� �빮�ڷ� �����Ͽ� �߰�
exec insert_test_proc(1114,'kim',2500,'���', :msg, :cnt);

print msg;
print cnt;

select * from test_proc;

--5������� : ������� �ʹ� �� ���
execute insert_test_proc(1115,'������',5000,'����', :msg, :cnt);

print msg;
print cnt;

select * from test_proc;