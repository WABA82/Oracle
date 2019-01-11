create or replace package body test_pack
is

	--�Լ� get_name ����---------------------
	function func_get_name(name varchar2) 
	return varchar2
	is
	
	begin

		return to_char(sysdate,'day')||'�� �Դϴ�.' || name || '�� �ȳ��ϼ���.';
	end func_get_name;
	--�Լ� get_name ����---------------------

   
   
   --���� get_age ����---------------------
	procedure proc_get_age(birth_year in number, age out number)
	is
	
	begin
		age := to_char(sysdate,'yyyy')-birth_year+1;
	end proc_get_age;
	--���� get_age ����--------------------- 
	
	
	
	----------proc_work12 ����----------------
	procedure proc_work12( tname in varchar2, tab_info out sys_refcursor)
	is
	
	begin
		open tab_info for
			select   utc.constraint_name,   utc. column_name,
           					(select distinct data_type from user_tab_columns
           					where user_tab_columns.column_name
           								=utc. column_name ) data_type
			from user_constraints uc, user_cons_columns utc
			where (uc.constraint_name=utc.constraint_name 	) and
    					utc.table_name =upper(tname);

	
	end proc_work12;
	----------proc_work12 ����----------------

end;
/
