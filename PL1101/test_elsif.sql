--���� if( elsif )
--������ �Է� �޾� ������ ���� ���� ������
--������ 0~100 ���� �̴�.
--������ 0���� ������ ���� '0���� �۾� ����'
--100���� ū ��� ���� '100���� Ŀ�� ����' �׷��� ������ ���� ��� 
set verify off
set serveroutput on

accept score prompt '�����Է� : '
declare
	score number := &score; 
begin
    
    dbms_output.put(score);
    
	if score < 0 then
		dbms_output.put_line('���� 0���� �۾� ����');
	elsif score > 100 then
		dbms_output.put_line('���� 100���� Ŀ�� ����');
	else
		dbms_output.put_line('���� �Է� ����');
	end if;
end;
/