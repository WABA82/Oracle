--2. ������ �Է¹޾Ƽ�  
--    100~90 ���̸� 'A'���� 
--     89~80 ���̸� 'B'
--    79~70 ���̸� 'C'
--    69~60 ���̸� 'D'
--    �׿� ��� '����� ����' �� ����ϴ�  PL/SQL�� �ۼ��ϼ���.

set verify off;
set serveroutput on;

accept score prompt '�����Է� : '
declare
	score number := &score;
begin
	if score between 0 and 100 then
		if score between 60 and 69 then
			dbms_output.put_line('D');
		elsif score between 70 and 79 then
			dbms_output.put_line('C');
		elsif score between 80 and 89 then
			dbms_output.put_line('B');
		elsif score between 90 and 100 then
			dbms_output.put_line('A');
		else
		dbms_output.put_line('����� ����');
		end if;			
	else
	dbms_output.put_line('������ 0~100 ���̸� �Է��� �� �ֽ��ϴ�.');
	end if;
end;
/