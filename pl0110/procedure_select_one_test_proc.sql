/*
	�����ȣ�� �Է¹޾� �����, ����, ����, �Ի����� ��ȸ�ϴ� Procedure
*/
create or replace procedure select_one_test_proc(
	i_empno in number, emp_cur out sys_refcursor, errmsg out varchar2)
	
	is
	
	begin             
		errmsg := '����';
		open emp_cur for
		select ename, sal, job, to_char(hiredate, 'mm-dd-yy day') hiredate
		from test_proc
		where empno = i_empno;
		
		exception 
			when others then
			errmsg := '�����߻� : ' || sqlerrm; 			
	end;
	
