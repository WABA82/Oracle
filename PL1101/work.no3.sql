--3. �̸��� �Է¹޾� ���� �̸��� ����ϴ�  PL/SQL�� �ϼ���.
--    �̸��� ���ڼ��� 3�� ���϶�� '�ܼ�'���� �Ǵ��ϰ� 4�� �̻��̶�� 
--    '����' �̶�� �Ǵ��Ѵ�.
--    �ܼ�- ���� �ϳ��� �� (��: ��,��,��,��),  
--    ���� - ���� �ΰ��μ� (�� : ������, �簥���� ��)
--    �����  ��: ��  �̸� : ��ö 

set verify off;
set serveroutput on;

accept name prompt '�̸��Է� : '
declare
	name varchar2(30):='&name';
begin
	if length(name) <=3  then
		dbms_output.put_line('��: ' || substr(name,1,1) || ' �̸�: ' || substr(name,2));
	elsif length(name) >= 4 then
		dbms_output.put_line('��: ' || substr(name,1,2) || ' �̸�: ' || substr(name,3));
	end if;
end;
/
