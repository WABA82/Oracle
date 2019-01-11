/*
	사원번호를 입력받아 사원명, 연봉, 직무, 입사일을 조회하는 Procedure
*/
create or replace procedure select_one_test_proc(
	i_empno in number, emp_cur out sys_refcursor, errmsg out varchar2)
	
	is
	
	begin             
		errmsg := '성공';
		open emp_cur for
		select ename, sal, job, to_char(hiredate, 'mm-dd-yy day') hiredate
		from test_proc
		where empno = i_empno;
		
		exception 
			when others then
			errmsg := '문제발생 : ' || sqlerrm; 			
	end;
	
