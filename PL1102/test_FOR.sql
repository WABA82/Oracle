--FOR 반복문

--set serveroutput on
--
--declare
--
--begin 
--
--	for i in 1 .. 10 loop
--		dbms_output.put_line('i = ' || i);
--	end loop;
--end;
--/   

---- 1~9까지 1씩 증가하는 for
--
--set serveroutput on
--
--declare
--	num number(1)
--begin 
--	num := 2;
--	for i in 1 .. 9 loop
--		dbms_output.put_line(num || ' * ' || i || ' = ' || num*i);
--	end loop;
--end;
--/   

--1~100까지 합구하여 출력 : 5050

--set serveroutput on
--
--declare
--	num number;
--begin 
--	num := 0;
--	for i in 1 .. 100 loop
--		num := num+i;	
--	end loop;
--	dbms_output.put_line(num);
--end;
--/                                           


--구구단
set serveroutput on

declare
	msg varchar2(30);
begin                   
--	for i in 2 .. 9 loop
--		dbms_output.put_line( i || '단 시작');
--		for j in 1 .. 9 loop
--			dbms_output.put_line(i*j);
--		end loop;
--		dbms_output.put_line( i || '단 끝');
--	end loop;	
	
	msg := '오늘은 금요일 입니다.';
--	for를 사용하여 글자 한자씩 잘라서 출력
	for i in 1 .. length(msg) loop
		dbms_output.put_line(substr(msg,i,1));
	end loop;
	
--	for를 사용하여 글자 한자씩 잘라서 순서를 거꾸로 출력
	for i in reverse 1 .. length(msg) loop
		dbms_output.put_line(substr(msg,i,1));
	end loop;
	
end;
/