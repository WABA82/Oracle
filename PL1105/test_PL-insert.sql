--PL/SQL DML insert 사용

set serveroutput on;

declare

begin
	insert into cp_emp3(empno, ename, deptno, job, sal)
		values(3333,'유재석',10,'부장님 쵝오',8000);
	
	--수행한 행의 수 얻기 : 암시적 커서 사용
	--sql(암시적 커서)
		--insert는 추가 성공 아니면 예외가 발생하게 되므로
			--암시적 커서를 사용하여 추가된 행의 수를 얻기 때문에 추가 수행을 할 필요가 없다.
	commit;
	dbms_output.put_line(sql%rowcount || '행 추가');
	
	exception
	when others then
		dbms_output.put_line('문제발생');	
	
end;
/