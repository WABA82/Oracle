set serveroutput on
declare
	--��������
begin
	--�ڵ��ۼ�
	--put_line�� ����� ���� ����
	dbms_output.put_line('�ȳ��ϼ��� PL/SQL');
	dbms_output.put_line('������ ����� �Դϴ�.');
	--put�� ����� �� ������ ���� �ʴ´�. put_line�� ������ �ʿ��ϴ�.
	dbms_output.put('������ �ݿ��� �Դϴ�.');
	--put���θ� ����� �Ǹ� ��� ������ ��� �����ʴ´�.
	dbms_output.put_line('�𷹴� �p');
end;
/