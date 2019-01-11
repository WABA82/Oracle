--CHECK, not null, default
--check : �÷��� ���� ��ȿ�� ������ ������ �߰��Ҷ�
--not null : ���� �ݵ�� �Է¹޾ƾ� �� ��
--default : �÷��� �����Ǿ� null �Էµ� �� ��� �� �⺻ ��

--�̸�, ����, �ּ�, �Է����� �����ϴ� ���̺� ����
--��, �̸��� �ʼ��Է��̰�, ���̴� 20~30�� ���� �Է°��� �ϰ�
--�Է����� ���� �Ǹ� ���� ��¥�� �Էµǵ��� ����

CREATE table other_constraints(
	name varchar2(30 byte) constraint c_name not null,
	age number(2) constraint c_age check(age between 20  and 39),
	addr varchar2(20 byte) null,
	input_date date default sysdate

);
--user_constraints ������ �������(PK, FK, UK, check, not null)�� Ȯ�ΰ���
select * from user_constraints;

select * from user_tab_cols
where table_name='OTHER_CONSTRAINTS';


--�Է¼���
--���ʻ���
insert into other_constraints(name, age, addr, input_date)
values('������',27,'�����','2018-10-26');
--�ּ� & ��¥ �����ص� �Է°���
insert into other_constraints(name, age)
values('�ڿ���',27);

--�Է¿���
--�̸��� �����Ǵ� ���(not null���ǿ� ����)
insert into other_constraints(name, age, addr, input_date)
values('',27,'�����','2018-10-26');
--���̰� üũ���ǿ� �������� ���� ���
insert into other_constraints(name, age, addr, input_date)
values('������',15,'�����','2018-10-26');
insert into other_constraints(name, age, addr, input_date)
values('������',19,'�����','2018-10-26');
insert into other_constraints(name, age, addr, input_date)
values('������',40,'�����','2018-10-26');

select * from other_constraints;

--not null�� �÷������� ����
create table temp(
	name varchar2(10),
	constraint c_name1 null(name)
);
