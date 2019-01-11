--1. 입사년도를 입력받아 근속년수가 10년 이상이면 '장기근속'
--  그렇지 않으면 '단기근속'이라는 메세지를 반환하는 함수 작성.

create or replace function Check_workingyear(hiredate date)
return varchar2
is
	result_msg varchar2(12) := '무효';
	con_work number := 0;
begin
	con_work := to_char(sysdate,'yyyy')-to_char(hiredate,'yyyy');
	
	if con_work >= 10 then
		result_msg := '장기근속';	
	else
		result_msg := '단기근속';	
	end if;                                    
	
	return result_msg;
end;
/
