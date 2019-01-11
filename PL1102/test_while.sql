--while 반복문

--최소 0번 수행, 최대 조건까지 반복수행하는 while

set serveroutput on
declare
	i number;
begin
	--1에서 부터 10까지 1씩 증가하는 반복문 출력하는 while
	i :=1;
	while i <= 10 loop
		dbms_output.put_line(i);	
	i := i +1;
	end loop;                   
	
dbms_output.put_line('-------------------------------------------------');	
	
	--1~100 사이의 홀수만 출력하는 while
	i :=1;
	while i <= 100 loop
		dbms_output.put_line(i);	
		
		i := i+2;
	end loop;	
		
end;
/