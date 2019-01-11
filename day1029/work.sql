----1. �Ʒ��� ���ǿ� �´� ���̺��� �����ϰ� ������ ��������� �ο����� ��� �������ǿ� �����ϴ� ���� ������ ��쿡 ���� �����ϴ� ��� �������� �ۼ��ϼ���.
--�μ���ȣ, �����, ����, �̸���, ��ȭ��ȣ, �ּ�, ����,�Ի���, �����ȣ�� �����ϴ� ���̺��� ����.
--�μ���ȣ�� ���� 2�ڸ� �̸� dept���̺��� deptno�� �Է��� �� �ִ�.
--������� ���������� �̰� �ѱ۰� 10���� ���� �Է°����ϴ� �ݵ�� �Է��ؾ� �Ѵ�.
--������ �����̰� ������� �Է��� �����ϴ�. �Է°��� ������ 2400~8000�Է��� �� �ִ�.
--�̸���, ��ȭ��ȣ�� �������� ������ �ִٸ� �����ϴ�.
--������ ���� / ���ڸ� �Է°����ϴ�.
--�ּҴ� ���� ���� �ִ�.
--�Ի����� ��¥�����̸� �Ի����� null�̸� ���糯¥�� �Է�
--�����ȣ�� ����4�̸� null�� ������� �ʰ� �ߺ������͸� ������ �� ����.
--��� �������װ� ������Ȳ�� ���� �������� �ۼ��� ��
--foreign key �ش��ϴ� ��������� ��Ȱ��ȭ ��Ų�� ������ �Ͻÿ�.

select * from DEPT;
select * from user_constraints
where table_name = 'DEPT';

create table testwork(
	deptno number(2) constraint fk_testwork_deptno references DEPT(DEPTNO),
	ename varchar2(30) constraint C_testwork_ename not null,
	sal number(9) constraint C_testwork_SAL check(sal between 2400 and 8000),
	email varchar2(60) constraint uk_testwork_email unique,
	tel varchar2(60) constraint uk_testwork_tel unique,
	gender varchar2(6) constraint C_testwork_gender check(gender='����' or gender='����'),
	addr varchar2(100) null,
	hiredate date default sysdate,
	empno number(4) constraint pk_testwork_empno primary key
);

