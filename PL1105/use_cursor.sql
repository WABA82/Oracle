-- 여러행을 조회할 때 사용하는 커서
-- dept 테이블의 모든 레코드를 조회하는 커서
select * from dept;

set serveroutput on

declare
	--1.선언 : cursor 커서명 is select ....;
	cursor cur_dept is
		select deptno, dname, loc 
		from dept;
	
	--조회결과를 저장할 변수 선언
	deptno dept.deptno%type;
	dname dept.dname%type;
	loc dept.loc%type;
	
	dept_data dept%rowtype;	
	
	
begin
	open cur_dept;      
	if cur_dept%isopen then
	    --커서가 열려 있다면 열린커서를닫고
	    dbms_output.put_line('커서가 열려있음');
		close cur_dept;
	else
	    dbms_output.put_line('커서가 닫혀있음');
	end if;
    --2.열기
	open cur_dept;
	
	--3. 인출 : 반복
	loop
		--into절에 개별 변수를 사용하여 처리.	
		--fetch cur_dept into deptno, dname, loc;
		
		--into절에 개별 변수를 사용하여 처리.		
		fetch cur_dept into dept_data;
		exit when cur_dept%notfound;
		
--		if cur_dept%notfound then
--			dbms_output.put_line('레코드 없음');
--			exit;
--		else
--			dbms_output.put_line('레코드 있음');	
--		end if;
			dbms_output.put_line(dept_data.deptno || ' ' || dept_data.dname || ' ' || dept_data.loc);
	end loop;      
	
		dbms_output.put_line('조회된 레코드 수 : ' || cur_dept%rowcount);
			
		
	--4. 커서 닫기
	close cur_dept;
end;
/