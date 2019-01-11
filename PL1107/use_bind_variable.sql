--bind 변수의 사용
--1. bind 변수 선언
var name varchar2(30);
variable age number;

var

set serveroutput on
--2.bind변수 값 할당> :변수명
declare
	name varchar2(30);
begin
	name := '테스트'; 
	--3. 바인드변수에 값 할당
	:name := name || '님 안녕하세요';
	:age := 20;
	
	dbms_output.put_line(name || '	' || :name || '	' || :age);
	
end;
/


	-- 4 바인드변수 값 출력 
	print name age