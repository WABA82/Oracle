set serveroutput on
declare
	--변수선언
begin
	--코드작성
	--put_line은 출력후 줄을 변경
	dbms_output.put_line('안녕하세요 PL/SQL');
	dbms_output.put_line('오늘은 목요일 입니다.');
	--put은 출력후 줄 변경을 하지 않는다. put_line이 다음에 필요하다.
	dbms_output.put('내일은 금요일 입니다.');
	--put으로만 출력이 되면 출력 내용이 출력 되지않는다.
	dbms_output.put_line('모레는 퇼');
end;
/