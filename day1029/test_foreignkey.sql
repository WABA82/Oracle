--�ܷ�Ű : �θ����̺��� �����θ� ���� �߰� �ؾ� �� ��.
--null, �ߺ����� ���

--CLC : �÷� ���� ������׿����� foreign key�� �������� �ʴ´�.
--table_primary ���̺��� id���� �����ؼ� ������ �߰��ϱ�
--�ڽ����̺��� �÷����� ���� �ʿ�� ����.
--��������, ũ��� ���� �ؾ��Ѵ�.
select * from column_primary;

select * from TABLE_PRIMARY;

select * from user_constraints;
create table column_foreign(
	f_id varchar2(20) constraint fk_f_id
		references TABLE_PRIMARY(id),
	tel varchar2(13), address varchar2(400)
);


--�߰�����
--�θ����̺� �����ϴ� �� �߰�
select * from COLUMN_FOREIGN;
insert into  column_foreign(f_id, tel, address)
values('kim','010-6784-9713','SM');

insert into  column_foreign(f_id, tel, address)
values('test','010-6784-9713','����� ������ �ѵ�����');

--���� ���̵�� ���� �߰��� �� �ִ�.(�ߺ����)
insert into  column_foreign(f_id, tel, address)
values('kim','010-6784-9713','SM');

--null ���
insert into  column_foreign(tel, address)
values('010-6784-9713','�̽�ƽ');

--�θ����̺��� ���� ���� �߰��ϸ� ����
insert into  column_foreign(f_id, tel, address)
values('kim1','010-6784-9713','SM');

--�θ����̺��� �����ϴ� �ڽķ��ڵ尡 ���� �Ѵٸ�
--�������� �ʴ´�
insert into TABLE_PRIMARY(name,id,passwd)
values('��ȣ��','kang','1234');
commit;

--kang�� �����ϴ� ���ڵ尡 ���� ������ ���� ����
delete from table_primary where id = 'kang';
--kim, test�� column_foreign���̺��� �����ϰ� �ֱ� ������ ���� �Ұ�
delete from table_primary where id = 'kim';

--on delete cascade�� �������� �ʾ��� ������ �ڽķ��ڵ��� �������� ������ ��

delete from column_foreign where f_id='kim';
delete from table_primary where id='kim';
commit;

--TCL : ���̺� ���� �������
create table table_foreign(
	id varchar2(20),
	java_score number(3),
	oracle_score number(3),
	constraint fk_table_foreign_id foreign key(id)
		references table_primary(id)
);

--�θ����̺� �����ϴ� ������ �߰�
insert into table_foreign(id,java_score,oracle_score)
values('kim',97,78);
commit;

--�����ϴ� �ڽ� ���ڵ尡 �����Ѵٸ� �θ����̺��� �ٷ� ������ ���� �ʴ´�
delete from table_primary
where id='kim';

insert into table_primary(name,id,passwd)
values('���߱�',',song','1234');
insert into table_primary(name,id,passwd)
values('����',',gong','1234');
commit;

--on delete cascade : �θ��ڵ带 �����ϸ� �����ϴ� ��� ���ڵ带 ���ÿ� �����ϴ� �ɼ�
create table test_cascade(
	id varchar2(20),
	address varchar(100),
	constraint fk_test_id foreign key(id)
	references table_primary(id)
	on delete cascade
);

insert into test_cascade(id,address)
values(',song','������ ���ﵿ');
insert into test_cascade(id,address)
values(',gong','������ ���ﵿ');
commit;
--on delete cascade�� �����Ǹ� �θ��ڵ尡 �����Ǹ� �ڽ� ���ڵ嵵 ���� �ȴ�.
delete from table_primary where id=',song';
delete from table_primary where id=',gong';

select * from TEST_CASCADE;
select * from TABLE_FOREIGN;
select * from user_constraints;
select * from COLUMN_FOREIGN;
select * from TABLE_PRIMARY;

