--패키지헤더 : 패키지에 들어가 함수와 프로시저들을 정의하는 부분

create or replace package test_pack
as

	function func_get_name(name varchar2) return varchar2;
	
	procedure proc_get_age(birth_year in number, age out number);
	procedure proc_work12( tname in varchar2, tab_info out sys_refcursor);
end;
/
