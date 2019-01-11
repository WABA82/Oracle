--부서번호를 입력받아 emp테이블에서 부서별 사원 정보를 조회하여 out parameter에 저장하는 procedure
--조회 : 사원번호, 사원명, 연봉, 부서번호, 부서명, 위치
--10~19번은 10번 
--20~29번은 20번
--그외는 30번으로 조회 


create or replace SELECT  select_emp
(i_deptno number, cur_join out sys_refcursor)
is
	temp_deptno number := i_deptno;	
begin
    --입력되는 부서번호르 10또는 20으로 생성

	temp_deptno := trunc(temp_deptno/10,0)*10;
	
	if	temp_deptno not in(10,20) then
		temp_deptno := 30;
	end if;	

	open cur_join for
		select e.empno, e.ename, e.sal, d.deptno, d.dname, d.loc
		from dept d, emp e
		where (e.deptno = d.deptno ) 
			and (d.deptno = temp_deptno);
  	
end;
/
