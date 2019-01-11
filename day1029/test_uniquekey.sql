--����ũ�� ���
--���� ���� ���� ������, �ִٸ� ������ ���� ������ �� ��.
--�̸�, �̸���, �ּҸ� �����ϴ� ���̺��� ����

create table column_unique(
	name varchar2(30),
	email varchar2(50) constraint uk_email unique,
	addr varchar2(100)
);

select * from user_constraints;

--�߰�����
--�����Է�
insert into column_unique(name,email,addr)
values('������','lee@test','��⵵ ������ ���뱸');
commit;
--null���
insert into column_unique(name,addr)
values('������','��⵵ ������ ���뱸');
commit;

insert into column_unique(name,email,addr)
values('������1','','��⵵ ������ ���뱸');
commit;


select * from column_unique;

--����
--���� �̸����� �ԷµǾ��� ��
insert into column_unique(name,email,addr)
values('�ڿ���','lee@test','�λ��');
commit;

--TCL
--��ȣ, �̸�, ��ȭ��ȣ, ī���ȣ�� �������̺� ����
--��ȭ��ȣ�� ī���ȣ�� �������� ������ �ִٸ� ������ ��
create table table_unique(
	num number(5),
	name varchar2(30),
	tel varchar2(13),
	card_num char(4),
	constraint uk_tel unique(tel),
	constraint uk_card_num unique(card_num)
);

--�߰�����
--�����Է�
insert into table_unique(num,name,tel,card_num)
values(1,'������','010-8769-6112','1234');
--��
insert into table_unique(num,name,tel,card_num)
values(2,'������','010-1111-2222','1235');

insert into table_unique(num,name,tel,card_num)
values(2,'��������','','');

insert into table_unique(num,name)
values(2,'������');

insert into table_unique(num,name)
values(3,'������');


--����
--������ ���� ���� ���
insert into table_unique(num,name,tel,card_num)
values(4,'���ü�','010-1111-2222','1235');

insert into table_unique(num,name,tel,card_num)
values(4,'���ü�','010-1111-2222','9999');



select * from table_unique;
select * from user_constraints;
select * from user_indexes;

