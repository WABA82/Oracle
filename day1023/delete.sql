-- ���̺��� ��� ���ڵ带 ���� / Ư�� ���ڵ带 ������ �� ����ϴ� ����

-- ��� ���ڵ带 ������ ��
-- delete from class4_info;

-- Ư�� ���ڵ常 ������ ��
-- �л��� ��ȣ�� 11���� �л��� ���ڵ� ����
/*
 delete from class4_info
 where num=11;
*/

-- truncate�� ���̺��� ���ڵ带 �����Ѵ�.
-- ������ �Ұ��ϴ�. �ѹ��� ���� �� �� ����.
/*
truncate table class4_info;
*/

-- �ʿ���� ���̺� ����
-- ������ ���̺��� ����Ŭ10g�̻� ���� ���� ���������� ����. 

drop table class4_info;

-- ������ ����:sqlplus��
-- show recyclebin
-- ������ ���� :sqlplus��
-- purge recyclebin
-- ������ ���̺� ���� :sqlplus�� 
-- flashback table �������̺�� to before drop