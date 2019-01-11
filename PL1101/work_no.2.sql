--2. 점수를 입력받아서  
--    100~90 사이면 'A'학점 
--     89~80 사이면 'B'
--    79~70 사이면 'C'
--    69~60 사이면 'D'
--    그외 라면 '노력을 요함' 을 출력하는  PL/SQL을 작성하세요.

set verify off;
set serveroutput on;

accept score prompt '점수입력 : '
declare
	score number := &score;
begin
	if score between 0 and 100 then
		if score between 60 and 69 then
			dbms_output.put_line('D');
		elsif score between 70 and 79 then
			dbms_output.put_line('C');
		elsif score between 80 and 89 then
			dbms_output.put_line('B');
		elsif score between 90 and 100 then
			dbms_output.put_line('A');
		else
		dbms_output.put_line('노력을 요함');
		end if;			
	else
	dbms_output.put_line('점수는 0~100 사이만 입력할 수 있습니다.');
	end if;
end;
/
