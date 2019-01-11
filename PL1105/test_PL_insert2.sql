--사원번호, 이름, 연봉을 입력받고
--연봉이 5000이상이면 cp_emp3테이블에 추가
--연봉이 5000이하라면 cp_emp2테이블에 추가하는 pl/sql 작성
--cp_emp3테이블에 추가되는 사원의 부서번호는 10번이다.

set verify off
set serveroutput on

accept empno prompt '사원번호 : '
accept ename prompt '이름입력 : '
accept sal prompt '연봉입력 : '

declare
	empno cp_emp2.empno%type := &empno;
	ename cp_emp2.ename%type := '&ename';
	sal cp_emp2.sal%type := &sal;	
begin
	
	if sal >= 5000 then
		insert into cp_emp3(empno, ename, deptno, sal)
		values(empno,ename,10,sal);
		dbms_output.put_line('연봉이 5000이상이므로 CP_EMP3 테이블 추가');
	else
		insert into cp_emp2(empno, ename, hiredate, sal)
		values(empno,ename,sysdate,sal);
		dbms_output.put_line('연봉이 5000이하이므로 CP_EMP2 테이블 추가');
	end if;
	
	commit;
	
end;
/