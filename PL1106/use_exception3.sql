--�μ��� �Է¹޾� ���� ���� ����ϴ� PL/SQL

set serveroutput on
set verify off
	accept num1 prompt 'ù��° �� : ';
	accept num2 prompt '�ι�° �� : ';
declare
	result number;
begin
	result := &num1/&num2;
	dbms_output.put_line(&num1|| '/' || &num2 || '=' || result);
	
	exception 
--	when zero_divide then
--		dbms_output.put_line('0���� ������ �� �� �����ϴ�.');
	when others then
--		dbms_output.put_line('�����ڰ� �ν����� ���� ����' || sqlcode );

		--���ܰ� �߻����� �� Oracle���� �����ϴ� ������ ����
		--�޼����� ��� �ϰ� ���� �� ����� ���� ����ó���� �Ѵ�.
		--raise_applicaton_error(�����ڵ�, '�޼���')
		raise_application_error(-2000, '��������� ����');		 
end;
/