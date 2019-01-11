--부서번호를 입력받아 해당 부서의 근무하는 사원번호 사원명 연봉 입사일을 조회 한후 총 사원수와, 연봉 합을 구하시오.

set verify off
set serveroutput on

accept deptno prompt '부서번호 : '; 

declare
	--1. 커서선언
	cursor cur_emp is 
		select empno, ename, sal, to_char(hiredate, 'yyyy-mm-dd') hiredate
		from 	emp
		where	 deptno = &deptno;
	
	--레코드 변수 선언
	type rec_emp is record(
			empno emp.empno%type, 
			ename emp.ename%type, 
			sal emp.sal%type, 
			hiredate varchar2(10)
		);
		
	--테이블 생성 : 데이터를 처리하는 부분과 출력하는 부분을 분리하기 위해서
	type tab_emp is table of rec_emp index by binary_integer;
	
	arr_emp tab_emp;
	
	
	emp_data rec_emp;
		
	--연봉의 합을 담기 위한 변수
		total_sal number := 0;
		
		i number := 0;	
begin
	--2.커서 열기
	if cur_emp%isopen then
		close cur_emp;
	end if;
	
	open cur_emp;
	
	--3. 인출	
	loop
		fetch cur_emp into emp_data;
		exit when cur_emp%notfound;
		--데이터 처리
		i := i+1;
		arr_emp(i) := emp_data;
	end loop;
	
	if i != 0 then
			dbms_output.put_line('사원번호 사원명 연봉 입사일');
	for idx in 1.. arr_emp.count loop
			dbms_output.put_line(arr_emp(idx).empno || ' ' || arr_emp(idx).ename || ' ' || arr_emp(idx).sal || ' ' || arr_emp(idx).hiredate);		
			total_sal := total_sal + arr_emp(idx).sal;
	end loop;
			dbms_output.put_line(&deptno || '번 부서의 사원수는 ' || cur_emp%rowcount || '명');	
			dbms_output.put_line('연봉 합 : ' || total_sal);
	else
			dbms_output.put_line(&deptno || '번 부서는 사원이 없습니다. ');
	end if;
			dbms_output.put_line('사용해 주셔서 감사합니다.');		
	
	--커서 닫기
	close cur_emp;	
end;
/