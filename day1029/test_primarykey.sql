-- ��������� Ȯ�� : user_constraints
select * from user_constraints;

-- ��ȣ, �̸�, ��ȭ��ȣ, �ֹι�ȣ, �̸��� �����ϴ� ���̺� ����
-- �ֹι�ȣ�� null�� ������� �����鼭 �����ؾ��Ѵ�.
create		table		column_primary(
	num number,
	name varchar2(30),
	tel	varchar2(13),
	ssn char(14) constraint pk_column_primary primary key,
	email varchar2(50)
);

drop table COLUMN_PRIMARY;
purge recyclebin;

select * from column_primary;

--------------------------------�÷��ϳ���  PK�� �����Ǵ� ���
--�߰�����
--���� ���ڵ� ����
insert into column_primary(num,name,tel,ssn,email)
values(1,'������','010-1234-5678','880101_1234567','lee@test.com');
commit;
select * from column_primary;
--�ֹι�ȣ�� �ٸ����
insert into column_primary(num,name,tel,ssn,email)
values(2,'������','010-2222-2789','890101_1234567','lee@test.com');
commit;

--�߰�����
--���� �ֹι�ȣ�� �ԷµǴ� ���
insert into column_primary(num,name,tel,ssn,email)
values(3,'���ü�','010-1846-4678','880101_1234567','jung@test.com');
commit;
--null�� �Է��Ǵ� ���
--����, ��¥�� �÷��� �����Ǹ� null�� �Էµǰ�
--���ڿ�(��������, ��������)�� �÷��� �����Ǵ� ���� ''�� �����Ͱ� �߰��Ǵ� ��쿡 null �Էµȴ�.
--�÷��� �����Ǿ� insert ���
insert into column_primary(num,name,tel,email)
values(3,'���ü�','010-1846-4679','jung@test.com');
--�÷��� ���� �Ǿ� ������''�� �ԷµǴ� ���
insert into column_primary(num,name,tel,,ssn,email)
values(3,'���ü�','010-1846-6789','','jung@test.com');

select * from column_primary;

--���̺� ���� �������
--�̸�, ���̵�, ��й�ȣ ���� ���̺� ����
--���̵�� null�� ������� �����鼭 ���� �����ؾ��Ѵ�.

create table table_primary(
 name varchar2(30),
 id varchar2(20),
 passwd varchar2(30),
 constraint pk_table_primary primary key(id)
);

-- �߰�����
insert into table_primary(name,id,passwd)
values ('����ö','kim','1234');
select * from TABLE_PRIMARY;
commit;
insert into table_primary(name,id,passwd)
values ('����ö','test','1234');
select * from TABLE_PRIMARY;
commit;

--�߰�����
insert into table_primary(name,passwd)
values ('����ö','1234555');

insert into table_primary(name,id,passwd)
values ('����ö','','1234');


--�������� �÷��� PK�� ������ ���
--table ���� ����������θ� �������� ��!!!

--���� ������ �����ȣ ���� 1 ������ ������
--emp_00007899�� ������ ���� ���� ���
select * from EMP;

select max(empno)
from emp;

select concat('EMP_',lpad(max(empno)+1,8,0))
from emp;

--������ �̸�, ��ȣ, ����
--������ ��ȣ ���������� �����ϰ�, ITEM_0001�� �����̴�.
--������ ��ȣ��, �����۸��� ���� �� ����.
create table table_multiprimary (
	ITEM_NUM char(9),
	ITEM varchar2(60),
	item_info varchar2(4000),
	constraint pk_table_multi_primary primary key(item_num,item)
);
select * from user_constraints;

select concat('ITEM_',lpad(nvl(max(item),0)+1,4,0))
from table_multiprimary;

--�������� �÷��� �ϳ��� PK�� �����Ǵ� ���
--���� �����͸� �Է�
insert into table_multiprimary(item_num,item,item_info)
values ((select concat('ITEM_',lpad(nvl(max(item),0)+1,4,0))
from table_multiprimary),'���ĸ�','�ٷ� �� ���̴����� ���� ���̴��� ��� ���� �ִ�.');
commit;

--nvl�Լ��� ��ȸ�� ���ڵ尡 null�϶��� ���� ����(��ȸ�� ���ڵ尡 ������ �����������ʴ´�.)
select concat('ITEM_',lpad(nvl(max(item),0)+1,4,0))
from table_multiprimary
--���÷��� ���� ��� �ٸ���� : ����
insert into table_multiprimary(item_num,item,item_info)
values ((select concat('ITEM_',lpad(max(substr(item_num,instr(item_num,'_')+1))+1,4,0))
from table_multiprimary),'����ź','�����Ÿ��� �� ���̴����� ���� ���̴��� ��� ���� �ִ�.');
commit;

--�� �÷��� �ϳ��� �÷��� �޶� : ����
insert into table_multiprimary(item_num,item,item_info)
values ('ITEM_0002','���ĸ�','�����Ÿ��� �� ���̴����� ���� ���̴��� ��� ���� �ִ�.');
commit;

select * from TABLE_MULTIPRIMARY;
/*
drop table table_multiprimary;
purge recyclebin;
*/

--������ �߻��ϴ� ���
--���÷��� ��� ���� ���� ������
insert into table_multiprimary(item_num,item,item_info)
values ('ITEM_0002','���ĸ�','���ϸ� ¥����');
commit;

--���� �ϳ��� null�� �߰��ɶ�
insert into table_multiprimary(item_num,item,item_info)
values ('','���ĸ�','���ϸ� ¥����');

delete from TABLE_MULTIPRIMARY where item_num = 'ITEM_2';
commit;

insert into table_multiprimary(item_num,item,item_info)
values ('ITEM_0003','�ռ� Ư�� ���̴��� �����Ͽ� �̻��� �߻�');

select * from EMP;
