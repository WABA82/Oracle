--2.  주민번호를 입력받아 성별(남자 -M, 여자-F)을 반환하는 함수 작성.
--   성별은 880101-x111111 남자-홀수, 여자 - 짝수

create or replace function ch_ssntogender(ssn char)
return char
is
	result_msg char(1)
	
	--주민번호 뒷자리의 첫번째 숫자
	last_ssn char(1) := substr(ssn,instr(ssn,'-')+1,1)
begin

	
	return result_msg;
end;
/
