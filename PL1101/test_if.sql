--���� if : ���ǿ� �´� ��쿡�� �ڵ带 �����ؾ� �� ��.
--�̸��� �Է¹޾� �̸��� '������'�̶�� �̸� �������
--'��õ�� �ڶ�'�� ��� �� ��.

set severoutput on;
set verify off;
                                              s
accept name prompt '�̸��Է� : '
declare
	name varchar2(30);
--	name table_primary.name%types;
begin (+) INSERT VALUES TO_NUMBER NULL 
	name :='&name';
	if name = '������' then
		dbms_output.put_line('��õ���� �ڶ�');
	end if;

	dbms_output.put_line(name || '�� �ȳ��ϼ���?');
end;
/
