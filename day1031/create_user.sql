--��������: ������ ������ ��������
--create user ������ identified by ���;

create user test_user identified by 1111;

--���ӱ���/ �ڿ�������/ ������ ����:
grant connect,resource,dba to test_user;

--���̺� ����(resource)
create table my_table(num number);
insert into my_table values(1);
commit;
select * from my_table;

--������ ���� �ο� �� �Ϲݰ����� �������� ������ ������ �� �ִ�.
--��������, ���� ���� �ο�
create view test_view as (select num from my_table);

select * from user_views;
drop view test_view;

--���� ȸ��
revoke ����,,,from ������;

--���� ���� : ������ ������ ���ӵǾ� �ִٸ� �������� �ʴ´�.

create user test1 identified by 2222;

select tname from tab;
--���� ��ȸ (all_users-������� ��������, dba_users-������ ���� ������)
select * from all_users;
select * from dba_users;
