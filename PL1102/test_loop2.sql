-- 1~100까지 출력 loop

set serveroutput on

declare
	cnt number(3);
begin
	cnt := 1;
	loop  
		cnt := cnt + 1;
			dbms_output.put(cnt || ' ');	
		cnt := cnt + 1;
		exit when (cnt > 100);		
	end loop;
	dbms_output.put_line(' ');	
end;
/

/*
set serveroutput on

declare
	cnt number(3);
begin
	cnt := 1;
	loop  
		cnt := cnt + 1;
		if mod(cnt,2) = 0 then
			dbms_output.put(cnt || ' ');	
		end if;
		exit when (cnt > 100);		
	end loop;
	dbms_output.put_line(' ');	
end;
/