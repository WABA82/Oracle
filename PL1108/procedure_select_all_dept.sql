--procedure안에서 여러행이 조회될 때  
--dept테이블에서 모든 부서정보를 조회하고 생성하고
--out parameter에 설정하는 프로시저

create or replace procedure select_all_dept
(cur_dept out sys_refcursor)
is
	dept_data dept%rowtype;
	    

begin
	
	open cur_dept for  
		select deptno, dname, loc
		from dept;  

		
		-- SYS_REFCURSOR를 사용할 때에는 외부에서 사용할 수 있도록
	    --커서의 인출을 프로시저 내에서 사용하지 않는다.
--	loop 
--		fetch cur_dept into dept_data;
--		exit when cur_dept%notfound;	
--	end loop;
--
--	close cur_dept;
	
end; 
/

--1. 변수 선언 : var 변수명 refcursor
--2. 	   실행 :exec 프로시저명(:변수명)
--3.        출력 : print 변수명