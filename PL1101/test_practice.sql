--이름 나이를 입력받아 ref_tab테이블을 참조하여 생성한
--변수(레코드변수)에 값을 입력한 후 아래와 같이 출력하는
--PL/SQL을 생성하세요.
--출력) 이름 : xxx님 나이 : xx살 (작년나이 xx살, 내년나이 : xx살)

set verify off
set serveroutput on

accept name prompt '이름입력 : ';
accept age prompt '나이입력 : ';

declare
	row_type ref_tab%rowtype;
begin
	row_type.name := '&name';
	row_type.age := &age;

	insert into REF_TAB(name,age) values(row_type.name, row_type.age);

	dbms_output.put_line('이름 : ' || row_type.name || ' 나이 : ' || row_type.age );
	dbms_output.put_line('작년나이 ' || (row_type.age-1) || ' 내년나이 : ' || (row_type.age+1) );
end;
/
