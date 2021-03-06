--이메일의 유효성 검증 6자 이상 이면서 '@'과 '.'이 들어있어야 한다.
--검증에 통과 : '유효' , 실패 : '무효'

create or replace function valid_email(email varchar2)
return char
is
	result_msg char(6) := '무효';
	
begin      
	
	if (length(email) >= 6) and (instr(email,'@') != 0) and (instr(email,'.') != 0) then
		result_msg := '유효';
	end if;

	return result_msg;
end;
/
