--������ �Է� �޾� 0~100 �����϶� ���� ���, 0~100���̰� �ƴ϶�� �Է� ���� ���.
--0~100 �����϶� 0~40 ���̶�� '����' 41~60�̸� �ٸ����� ����
--61~100 �հ��� ���

set verify off
set serveroutput on

accept score prompt '�����Է� : '
declare
	score number := &score;
begin
	if score between 0 and 100 then
		dbms_output.put_line('�Է¼���');
		if score <= 40 then
			dbms_output.put_line('����');
		elsif score <= 60 then
			dbms_output.put_line('����');
		else
			dbms_output.put_line('�հ�');	
		end if;					
	else
		dbms_output.put_line('������ 0~100���̸� �Է��� �ּ���');
	end if;
end;
/