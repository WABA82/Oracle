/*
	test_proc 테이블의 모든 사원 정보를 조회하여 out param에 설정하는 procedure
*/
create or replace procedure select_all_test_proc( date_pattern in varchar2, cur_emp out sys_refcursor )

is

begin
	open cur_emp for
	select empno, ename, to_char(hiredate, date_pattern) hiredate, sal, job
	from test_proc;
end;
/
