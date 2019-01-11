--���� 
--1. �Ʒ��� Dictionary���̺��� ����Ͽ� 
--user_constraints, user_tab_cols, user_tab_columns
--�Էµ� ���̺� ���� ������׸�, �÷���, �������� 
--�� ��ȸ�ϴ� �������� �ۼ� .

create or replace procedure work_select_dic
(i_table varchar2, 
cur_con out sys_refcursor, cur_col out sys_refcursor)
is
	type rec_tab is 

begin
	
	select uc.constraint_name, uc.column_name, utc.table_name, utc.data_type  
	from user_tab_cols utc, user_constraints uc
	where (utc.table_name = uc.table_name) and utc.table_name = 'emp';
	
end;
/
