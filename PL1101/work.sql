--1. �������� �Է¹޾� �������� Ư¡�� ��� �ϴ� PL/SQL�ۼ�.
--   -�������� ��ҹ��� ��� �� ���� �ؾ��Ѵ�.
--   -'A' : �������̴�. ���ɽ�����, �����ϴ�
--   -'B' : �ڱ��߽����̴�. �����̳� ��Ģ, �ӹ��� ���� �Ⱦ��Ѵ�.
--   -'AB' : �ո����̴�. �ո����� �ݵ����� ��ȣ�ϰԵȴ�. 
--   -'O' :  �Ѱᰰ�� ��°� �������� �ִ�. �����ǽ��� ���ϴ�   

set serveroutput on;
set verify off;

accept boold_type prompt '������ �Է� : '
declare
	boold_type char(2) := '&boold_type';
begin
	if boold_type in ('A','a') then
		dbms_output.put_line('�������̴�. ���ɽ�����, �����ϴ�.');		
	elsif boold_type in ('B','b') then
		dbms_output.put_line('�ڱ��߽����̴�. �����̳� ��Ģ, �ӹ��� ���� �Ⱦ��Ѵ�.');
	elsif boold_type in ('AB','ab') then
		dbms_output.put_line('�ո����̴�. �ո����� �ݵ����� ��ȣ�ϰԵȴ�.');
	elsif boold_type in ('O','o') then
		dbms_output.put_line('�Ѱᰰ�� ��°� �������� �ִ�. �����ǽ��� ���ϴ�.');
	else
	dbms_output.put_line('�������� [ A / B / AB / O ]���� �ϳ��� �Է��� �� �ֽ��ϴ�.');	
	end if;
	dbms_output.put_line('boold_type');
end;
/ 
