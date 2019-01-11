--1.  class4 강의장의 학생들의 교통요금을 구하는  PL/SQL을 제작
--   하고자한다.  대중교통수단 요금은 아래와 같으며 
--   [버스 : 1200원,  지하철 :1250원] , 10키로를 초과하면 매4키로마다
--  100원의 요금 더 부과된다.  
--  이 정보를 이용하여 아래 학생들의 데이터를 처리하세요
--  데이터. 
-- 1, 김정운, 서울시 강남구 역삼동, 5키로, 버스
--  2, 김희철, 인천시 남동구 구월동, 20키로, 지하철
--  3, 이재찬, 인천시 부평구 부평동, 16키로, 지하철
--  4, 박영민, 서울시 관악구 봉천동, 10키로, 지하철
--  5, 정택성, 서울시 동대문구 동대문동, 8키로, 버스
--
--   출력
--   번호, 이름,  주소, 거리, 교통수단, 기본요금, 총요금

set serveroutput on

declare
 type stu_record is record (num number(1), name varchar2(30), loc varchar2(60), dist number(2), trans varchar2(30), fee number(4), plus_fee number(4));
 type stu_table is table of stu_record index by binary_integer;
 
 class4 stu_table;
 add_fee number;
begin
	class4(1).num := 1;
	class4(1).name := '김정운';
	class4(1).loc := '서울시 강남구 역삼동';
	class4(1).dist := 5;
	class4(1).trans := '버스';
	
	class4(2).num := 2;
	class4(2).name := '김희철';
	class4(2).loc := '인천시 남동구 구월동';
	class4(2).dist := 20;
	class4(2).trans := '지하철';
	
	class4(3).num := 3;
	class4(3).name := '이재찬';
	class4(3).loc := '인천시 부평구 부평동';
	class4(3).dist := 16;
	class4(3).trans := '지하철';
	
	class4(4).num := 4;
	class4(4).name := '정택성';
	class4(4).loc := '서울시 관악구 봉천동';
	class4(4).dist := 10;
	class4(4).trans := '지하철';
	
	class4(5).num := 5;
	class4(5).name := '김정운';
	class4(5).loc := '서울시 동대문구 동대문동';
	class4(5).dist := 8;
	class4(5).trans := '버스';
	
	dbms_output.put_line('응시인원 : ' || class4.count);
	
	add_fee :=100;
	for i in 1 .. class4.count loop 
	
		if class4(i).trans = '지하철' then
			class4(i).fee := 1250;

		end if;
		
		if class4(i).trans = '버스'	then
			class4(i).fee := 1200;
		end if;
		
		if class4(i).loc > 10 then
			class4(i).plus_fee := class4(i).fee+add_fee*;
		end if;
		
		dbms_output.put_line(class4(i).num || '		' || class4(i).name || '		' || class4(i).loc || '		' || class4(i).dist || '		' || class4(i).trans || class4(i).fee || class4(i).plus_fee );	
	
	end loop;
	
end;
/

