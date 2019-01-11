--주민번호의 유효성 검증
--각 자리에 234567892345를 곱한값을 더해서
--11로 나눈 나머지를 구하고 11에서 뺀 값을 10으로 나눈 나머지를 구해 그 값이 주민번호의 마지막 숫자와 같다면
-- 유효 | 무효

create or replace function valid_ssn(ssn char)
return varchar2
is
	result_msg varchar2(6) := '무효';
	
	--연산한 값을 담을 변수
	temp_val number := 0;	
	--맨 끝자리를 담을 변수
	flag_num char(1);
	--인덱스 2~9까지
	idx number := 2;	
	--하이픈을 제거한 주민번호 12자리
	temp_ssn char(12);
begin
	
	--주민번호의 형식이  'success'일 때만 검증함수를 처리한다.
	if check_ssn(ssn) = 'success' then
	--temp_ssn = 880101123456 
	temp_ssn := substr(ssn,1,6) || substr(ssn,8,6);
	--temp_ssn = 880101123456                               
	flag_num := substr(temp_ssn,14,1);
	
	for i in 1 .. length(temp_ssn) loop
		temp_val := temp_val+substr(temp_ssn,i,1)*idx;
		idx := idx+1;
		if idx = 10 then
			idx := 2;
		end if;
	end loop;
		temp_val := mod(11-mod(temp_val,11),10);
		if temp_val = flag_num then
			result_msg := '유효';
		end if;
	end if;
	return result_msg;
end;
/
