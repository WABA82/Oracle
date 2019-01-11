--3. 이름을 입력받아 성과 이름을 출력하는  PL/SQL을 하세요.
--    이름의 글자수가 3자 이하라면 '단성'으로 판단하고 4자 이상이라면 
--    '복성' 이라고 판단한다.
--    단성- 성이 하나인 성 (예: 김,이,오,박),  
--    복성 - 성이 두개인성 (예 : 선우용녀, 재갈공명 등)
--    출력은  성: 김  이름 : 희철 

set verify off;
set serveroutput on;

accept name prompt '이름입력 : '
declare
	name varchar2(30):='&name';
begin
	if length(name) <=3  then
		dbms_output.put_line('성: ' || substr(name,1,1) || ' 이름: ' || substr(name,2));
	elsif length(name) >= 4 then
		dbms_output.put_line('성: ' || substr(name,1,2) || ' 이름: ' || substr(name,3));
	end if;
end;
/
