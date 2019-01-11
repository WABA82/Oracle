--사원번호, 사원명, 연봉, 직급(job)를 입력 받아 test_proc 테이블에 추가하는 프로시져 생성
--사원번호는 1~9999 사이의 값만 입력 되어야 한다.
--연봉은 2500~8000 사이만 입력 되어야 한다.
--2500 이하라면 2500으로 8000이상이라면 8000으로 설정하여 추가한다.
--직급은 사원, 주임, 대리, 과장, 차장, 부장, 이사 중 하나만 입력되었을 때만 추가한다.
--사원명은 영어인경우 첫자를 대문자로 변경하여 추가
--중복된 사원번호가 입력되면 예외로 처리한다.


create or replace procedure insert_test_proc1 (
	empno in number,
	ename in varchar2,
	sal in number,
	job in varchar2,
	msg out varchar2,
	row_cnt out number)
is
	temp_sal number := sal;

begin
	row_cnt := 0;
	--연봉 조건
	if empno not between 1 and 9999 then
		if temp_sal < 2500 then
			temp_sal :=;			
		end if;
		
		if temp_sal > 8000 then
			temp_sal := 8000;
		end if;
		
		--직급조건
		if job in ('사원', '주임', '대리', '과장', '차장', '부장', '이사') then
			insert into test_proc(empno, ename, hiredate, sal, job)
			values(empno, initcap(ename), sysdate, temp_sal, job);		
		row_cnt := sql%rowcount;
		
		commit;
		
		msg := empno || '번 사원 정보가 추가되었습니다.';
					
		else
			msg :=	job || '입력가능한 직급이 아닙니다.';
		end if;
	else
		msg := empno || '사원번호는 1~9999 사이가 아닙니다.';
	end if;

	exception
	when dup_val_on_index then
		msg := empn||'번 사원번호는 이미 존재합니다.';
	when others then
		msg := '예외발생 : ' || sqlerrm || '/' || sqlcode;

end;
/
