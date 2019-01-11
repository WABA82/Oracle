--숙제 2.
--  학생들의 정보를 처리하는 PL/SQL작성.
--  번호, 이름, 오라클점수,자바점수,총점,평균 을 저장할 수있는 record를
--  만들고 아래의 데이터를 입력한 후
--  반복문을 사용하여  총점,평균을 처리하는 PL/SQL 작성
--
--1, 김정운, 80,81
--2, 김희철, 94,80
--3, 이재찬, 97,96
--4, 박영민, 86,92
--5, 정택성, 76,99
--
--출력
--번호, 이름, 오라클점수, 자바점수, 총점, 평균
--자바최고점수 [XX] 오라클 최고점수 [XXX]

set verify on;
set serveroutput on;

declare
	type stu_record is record(num number(1), name varchar2(30), oracle_score number(2), java_score number(2));
	type stu_table is table of stu_record index by binary_integer;

	class4 stu_table;
	oracle_top number := 0;
	java_top number := 0;
begin
	class4(1).num := 1;
	class4(1).name := '김정운';
	class4(1).oracle_score := 80;
	class4(1).java_score := 81;
	
	class4(2).num := 2;
	class4(2).name := '김희철';
	class4(2).oracle_score := 94;
	class4(2).java_score := 80;
	
	class4(3).num := 3;
	class4(3).name := '이재찬';
	class4(3).oracle_score := 97;
	class4(3).java_score := 96;
	
	class4(4).num := 4;
	class4(4).name := '박영민';
	class4(4).oracle_score := 86;
	class4(4).java_score := 92;
	
	class4(5).num := 5;
	class4(5).name := '정택성';
	class4(5).oracle_score := 76;
	class4(5).java_score := 99;
	
	dbms_output.put_line('응시인원 : ' || class4.count);
	dbms_output.put_line('번호	이름	오라클점수	자바점수	총점	평균');
	
	for i in 1 .. class4.count loop
		dbms_output.put_line(class4(i).num || '---' || class4(i).name || '---' || class4(i).oracle_score || '---' || class4(i).java_score
									|| '---' || (class4(i).oracle_score+class4(i).java_score) || '---' || ((class4(i).oracle_score+class4(i).java_score)/2) );
		
		if class4(i).java_score > java_top then
			java_top := class4(i).java_score;
		end if;
		if class4(i).oracle_score > oracle_top then
			oracle_top := class4(i).oracle_score;
		end if;
	end loop; 
		
		dbms_output.put_line('java top : ' || java_top || ',  oracle top : ' || oracle_top );
end;
/