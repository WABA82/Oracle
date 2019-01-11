--조회 : 직무를 입력 받아 해당 직무의 사원수와 연봉합을
--직무는 사'사원','주임','대리','과장','차장','부장','이사','상무','전무', '대표이사'만 입력할 수있습니다.
--out parameter에 설정 하는 프로시저

create or replace procedure select_test_proc_cnt
(i_job in varchar2, mg out varchar2, emp_cnt out number, emp_sal out number)
is
	--연봉 초기화 변수
	temp_sal number := 0; 
	
	
begin 
    --변수 초기화
	emp_cnt := 0;
	emp_sal := 0;	

	if i_job in ('사원','주임','대리','과장','차장','부장','이사','상무','전무', '대표이사' ) then
		
		select    count(empno), sum(sal)
		into        emp_cnt, emp_sal
		from		test_proc
		where		job=i_job;
		
		
--		for rec_emp in 
--			(select sal from test_proc where job = i_job) 
--		loop                                 
--			--조회가 실행 될 때 마다 사원수 증가
--			emp_cnt := emp_cnt + 1;
--			emp_sal := emp_sal + rec_emp.sal;
--		end loop;
		if emp_cnt != 0 then
			mg := i_job || '으로 조회된 결과가 있습니다.';
		else
			mg := i_job || '직급의 사원은 존재하지 않습니다.';
			emp_sal := 0;
		end if;		
	else
		mg := i_job || '해당 직무는 없습니다.';
		emp_sal := 0;
	end if;
	
end;
/
