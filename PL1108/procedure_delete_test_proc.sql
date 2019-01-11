--사원번호를 입력 받아 사원번호가 존재 할 때 test_proc테이블에서 삭제하는 procedure
create or replace procedure delete_test_proc(
	i_empno in number,
	msg out varchar2,
	cnt out number)
is

begin

	delete from test_proc
		where empno = i_empno;
	cnt := sql%rowcount;

	commit;

	if cnt =1 then
		msg := i_empno || '번 사원 퇴사. 행복하세요.';
	else
		msg := i_empno || '번 사원이 존재하지 않습니다.';
	end if;

    --예외 처리
	exception
	when others then
	msg := ' 문제발생 '||sqlerrm;
end;
/
