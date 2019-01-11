--점수를 입력 받아 0~100 사이일때 점수 계산, 0~100사이가 아니라면 입력 실패 출력.
--0~100 사이일때 0~40 사이라면 '과락' 41~60이면 다른과목 참조
--61~100 합격을 출력

set verify off
set serveroutput on

accept score prompt '점수입력 : '
declare
	score number := &score;
begin
	if score between 0 and 100 then
		dbms_output.put_line('입력성공');
		if score <= 40 then
			dbms_output.put_line('과락');
		elsif score <= 60 then
			dbms_output.put_line('참조');
		else
			dbms_output.put_line('합격');	
		end if;					
	else
		dbms_output.put_line('점수는 0~100사이만 입력해 주세요');
	end if;
end;
/