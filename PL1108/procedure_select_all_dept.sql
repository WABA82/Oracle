--procedure�ȿ��� �������� ��ȸ�� ��  
--dept���̺��� ��� �μ������� ��ȸ�ϰ� �����ϰ�
--out parameter�� �����ϴ� ���ν���

create or replace procedure select_all_dept
(cur_dept out sys_refcursor)
is
	dept_data dept%rowtype;
	    

begin
	
	open cur_dept for  
		select deptno, dname, loc
		from dept;  

		
		-- SYS_REFCURSOR�� ����� ������ �ܺο��� ����� �� �ֵ���
	    --Ŀ���� ������ ���ν��� ������ ������� �ʴ´�.
--	loop 
--		fetch cur_dept into dept_data;
--		exit when cur_dept%notfound;	
--	end loop;
--
--	close cur_dept;
	
end; 
/

--1. ���� ���� : var ������ refcursor
--2. 	   ���� :exec ���ν�����(:������)
--3.        ��� : print ������