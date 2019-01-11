--1. 혈액형을 입력받아 혈액형별 특징을 출력 하는 PL/SQL작성.
--   -혈액형은 대소문자 모두 비교 가능 해야한다.
--   -'A' : 내향적이다. 조심스럽고, 세심하다
--   -'B' : 자기중심적이다. 규율이나 규칙, 속박을 극히 싫어한다.
--   -'AB' : 합리적이다. 합리적인 반듯함을 선호하게된다. 
--   -'O' :  한결같은 노력과 추진력이 있다. 동료의식이 강하다   

set serveroutput on;
set verify off;

accept boold_type prompt '혈액형 입력 : '
declare
	boold_type char(2) := '&boold_type';
begin
	if boold_type in ('A','a') then
		dbms_output.put_line('내향적이다. 조심스럽고, 세심하다.');		
	elsif boold_type in ('B','b') then
		dbms_output.put_line('자기중심적이다. 규율이나 규칙, 속박을 극히 싫어한다.');
	elsif boold_type in ('AB','ab') then
		dbms_output.put_line('합리적이다. 합리적인 반듯함을 선호하게된다.');
	elsif boold_type in ('O','o') then
		dbms_output.put_line('한결같은 노력과 추진력이 있다. 동료의식이 강하다.');
	else
	dbms_output.put_line('혈액형은 [ A / B / AB / O ]에서 하나만 입력할 수 있습니다.');	
	end if;
	dbms_output.put_line('boold_type');
end;
/ 
