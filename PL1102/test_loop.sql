--�ݺ���

--loop = 
set serveroutput on
set verify off

declare
	i number;
begin
	i := 0;
	loop        
		dbms_output.put_line('������ �ݿ����� �κ�' || i );
		
		i := i+1;
		
		exit when (i=10);
		
--		if (i=10) then
--			exit;
--		end if;

	end loop;
		 dbms_output.put_line('������ �p');		
end;
/