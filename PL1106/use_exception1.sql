--아이디, 이름, 비밀번호를 입력받아 table_primary
--테이블에 레코드 추가하는 PL/SQL을 작성
set verify off
set serveroutput on
	accept name prompt '이름 : ';
	accept id prompt '아이디 : ';
	accept passwd prompt '비밀번호 ; ';
declare
	name varchar2(30);
	id varchar2(30) := '&id';
	passwd varchar2(30) := '&passwd';
begin
    --입력받은 문자열의 길이가 저장할 수 있는 크기가 아니라면 "예외로는 처리할 수 없고 코드로 처리해야한다."
	if length('&name') > 10 then
		dbms_output.put_line('입력가능한 글자수를 초과하였습니다.'); 
	else
		name := '&name';
		insert into table_primary(name, id, passwd)
		values(name, id, passwd);

		dbms_output.put_line(id || '님의 정보를 추가 했습니다.');
		commit;
	end if;

	exception
	when dup_val_on_index then
		dbms_output.put_line('입력하신' || id || '는 이미 사용중입니다');
		--예외처리 객체가 제공하는 메세지 : sqlerrm
		dbms_output.put_line( sqlerrm );
		--예외처리 객체가 제공하는 에러코드 : sqlcode
		dbms_output.put_line( sqlcode );

end;
/
