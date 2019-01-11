--다중 if( elsif )
--점수를 입력 받아 점수에 대한 판정 내리기
--점수는 0~100 사이 이다.
--점수가 0보다 작으면 실패 '0보다 작아 실패'
--100보다 큰 경우 실패 '100보다 커서 실패' 그렇지 않으면 성공 출력 
set verify off
set serveroutput on

accept score prompt '점수입력 : '
declare
	score number := &score; 
begin
    
    dbms_output.put(score);
    
	if score < 0 then
		dbms_output.put_line('점은 0보다 작아 실패');
	elsif score > 100 then
		dbms_output.put_line('점은 100보다 커서 실패');
	else
		dbms_output.put_line('점은 입력 성공');
	end if;
end;
/