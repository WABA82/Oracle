--cp_emp테이블에 레코드가 추가되면 cp_emp3테이블에 사원번호,사원명, 부서번호, 사원 연봉을 추가하고
--부서번호는 emp테이블의 사원번호가 7788인 사원과 동일한 번호 
--cp_emp테이블에 입력한 연봉이 2000이하가 추가되면 ep_emp3테이블에는 연봉 500을 더추가해서 출력 

create or replace trigger emp_trigger
after insert on cp_emp
declare
	r_deptno number;    
	trigger_sal number;
begin
	
	select deptno
	into r_deptno
	from    emp
	where empno = 7788;	
    
    if(:new.sal) <= 2000 then
		trigger_sal := :new.sal+500;
	end if;        
	
	insert into cp_emp3(empno,ename,deptno,sal)
	values(:new.empno, :new.ename, r_deptno, trigger_sal);
		
	end if;
end;
/
