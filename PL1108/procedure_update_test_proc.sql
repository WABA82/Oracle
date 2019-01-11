--사원번호, 직급, 연봉을 입력받아 test_proc테이블에서
--변경하는 프로시저

--1. 직급은 사원 주임 대리 과장 차장 부장 이사, 상무, 전무, 대표이사가 입력되었을 때만 변경한다. 

-- 2. 연봉이 현재 연봉보다 작다면 현재연봉의 5%인상 

-- 3. 직급은 사원, 주임, 대리, 과장, 차장, 부장, 이사가 입력 되었을 
-- 때만 추가한다.  

-- 4. 사원명은 영어인경우  첫자를 대문자로 변경하여 추가 
-- 중복된 사원 번호가 입력되면 예외로 처리한다. 

create or replace procedure update_test_proc(
	i_empno in number, i_job in varchar2, i_sal in number, row_cnt out number, result_msg out varchar2)
is
	 
	--기존의 테이블에 있는 사원번호의 연봉 가져와서 temp_sal변수
	temp_sal number;
begin 
	row_cnt := 0; --기본으로 null값이 들어가기 때문에 기본 0으로 값을 할당한다.
	
	--1.
	if i_job in ('대리', '과장', '차장', '부장', '이사', '상무', '전무', '대표이사') then
		--2. 기존의 테이블에 있는 사원번호의 연봉 가져와서 temp_sal변수에 담아서 사용하기.
		select sal
		into    temp_sal
		from  	test_proc 
		where	empno=i_empno;
		
		if i_sal < temp_sal then
			temp_sal := trunc((temp_sal + temp_sal*0.05),0);
		else
			temp_sal := i_sal;
		end if;
		
		update	test_proc
		set			job = i_job, sal=temp_sal
		where 	empno=i_empno;

	row_cnt := sql%rowcount;
	commit;
	result_msg := i_empno || '번 사원의 정보가 변경되었습니다. 제시연봉 : ' || i_sal || ', 확정연봉 : ' || temp_sal;

	else
	 	result_msg := i_job || '은 사내의 직무가 아닙니다.';
	end if;
	
	exception
	when no_data_found then
		result_msg := i_empno || '번 사원은 존재하지 않습니다.';
	when others then
		result_msg := sqlerrm || sqlcode;
end;
/
