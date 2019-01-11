--반복문

--loop = 
set serveroutput on
set verify off

declare
	i number;
begin
	i := 0;
	loop        
		dbms_output.put_line('오늘은 금요일인 부분' || i );
		
		i := i+1;
		
		exit when (i=10);
		
--		if (i=10) then
--			exit;
--		end if;

	end loop;
		 dbms_output.put_line('내일은 퇼');		
end;
/