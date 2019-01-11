--1. 입사년도를 입력받아 근속년수가 10년 이상이면 '장기근속'
--  그렇지 않으면 '단기근속'이라는 메세지를 반환하는 함수 작성.

set verify off
set serveroutput on
	accept i_hiredate prompt '입사년도 : '
declare

begin
	check_workingyear(&i_hiredate)
end;
/