--alter

--���� ��ױ� : �����ڸ� ����
alter user scott account lock;
--���� : system, ��� : managerum

--��������
alter user scott account unlock;

--��� ����
alter user scott identified by tiger;

--���̺� ����
create table test_atler(
num number,
numver varchar2 (30),
addr number
);

--���̺�� ����
alter table test_atler rename to test_alter;

--�÷��� ����:
alter table test_alter rename column neam to name;

--�÷��� �������� ���� : ���ڵ尡 ���� ������ ������������ ���氡��
--addr�� number���������� varchar2(100)
alter table test_alter modify addr varchar2(100) not null;

insert into test_alter(num, numver, addr)
values(1,'�׽�Ʈ','����� ������');
commit;
--���������� ���� �� ������ ���ڵ尡 ����־�� �����ϴ�
alter table test_alter modify addr number;
--���ڵ尡 �����Ҷ����� ���� ���������� ũ�⸸ ���氡��
alter table test_alter modify addr varchar2(200);

--�÷��߰� : �߰��Ǵ� �÷��� ���� �������� �߰��ȴ�.
--���ڵ尡 �������� ������ ��� ��������� �ο��� �� �ִ�.
alter table test_alter add id varchar2(16);

--�÷�����
alter table test_alter drop column addr;

--������� �߰� : ���ڵ��� ���� ��������� ������ �����ϴ��� �Ǵ��ؾ� �Ѵ�.
update test_alter
set id='test'
where num=1;

alter table test_alter add constraint pk_test_alter
	primary key(id);

select * from TEST_ALTER;
select * from user_constraints
where table_name = 'TEST_ALTER';

--������� ��Ȱ��ȭ : disable
alter table test_alter disable constraint pk_test_alter;

insert into test_alter(num,numver,id) values(2,'������','test');

--������� Ȱ��ȭ : enable ���ڵ��� ������ �Ǵ��ؾ� �Ѵ�.
delete from test_alter where num=2;
alter table test_alter enable constraint pk_test_alter;

--������� ����
alter table test_alter drop constraint pk_test_alter;
