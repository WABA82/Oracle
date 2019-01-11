--사원번호 사원명 부서번호 직무 연봉을 입력받아 cp_emp3테이블에 추가하는 PL/SQL 작성
-- 단, 부서번호가 10번 이라면 사원의 연봉은 부서번호에 따라 동일 연봉으로 추가한다.
--10번 부서 : emp테이블의 사원번호가 7566과 같은 연봉으로
--20번 부서 : emp테이블의 사원번호가 7698과 같은 연봉으로
--30번 부서 : emp테이블의 사원번호가 782와 같은 연봉으로
--그외 부서번호가 입력되면 7788 사원의 연봉으로 추가


set verify off
set serveroutput on

accept empno prompt '사원번호 : '
accept ename prompt '사원명 : '
accept deptno prompt '부서번호 : '
accept job prompt '직무 : '

declare
	empno cp_emp3.empno%type := &empno;
	ename cp_emp3.ename%type := '&ename';
	deptno cp_emp3.deptno%type := &deptno;
	job cp_emp3.job%type := '&job';

	sal cp_emp3.sal%type;
	select_empno cp_emp3.empno%type := 7788;
begin
	--입력되는 부서번호별로 참조할 연봉을 조회하기위한
	--사원번호 설정
	if deptno = 10 then
		select_empno := 7566;
	elsif deptno = 20 then
	    select_empno := 7698;
	elsif deptno = 30 then
		select_empno := 7782;
	end if;

	--설정된 사원번호별로 연봉을 조회합니다.
	select sal
	into  sal
	from emp
	where empno = select_empno;

	--조회된 연봉으로 추가
	insert into cp_emp3(empno, ename, deptno, job, sal)
	values(empno, ename, deptno, job, sal);

	dbms_output.put_line( empno || '번 사원 정보를 추가하였습니다.');

	commit;

end;
/

;
select * from CP_EMP3;

;
select * from emp;
