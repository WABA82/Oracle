--������
set serveroutput on;
set verify off;
accept name prompt '�̸��Է� : ';
accept age prompt '�����Է� : ';
declare
--��������
	name varchar2(90);
	age number;
	birth number;
begin
--�Էµ� ���� ������ �Ҵ�
--�Է� ���� ���ڿ��� ��쿡�� '&name'���� ������ ����Ѵ�.
--�ּ����� ���Ǵ� �ּ����� ������� ����
	name := '&name';
	age := &age;
	birth := to_char(sysdate,'yyyy')-age+1;
	dbms_output.put_line('�̸� : ' || name || '���� ���̴� ' || age || '�� �Դϴ�.');
	--���� �¾�� ��� : XX�� �¾�� XXXX���
	dbms_output.put_line( age ||'�� �¾�� '|| birth ||'�� �Դϴ�.'); 
	--����(�� ����� �ڵ带 �����־���.)
	dbms_output.put_line( age ||'�� �¾�� '|| (to_char(sysdate,'yyyy')-age+1) ||'�� �Դϴ�.');
	
	--err ���ڿ��� ������ �ȵȴ�.
	--||�� �켱������ -���� ���� ������ '�� �¾�� 2018'-age+1�� ����� �ȴ�.
	dbms_output.put_line( age ||'�� �¾�� '|| to_char(sysdate,'yyyy')-age+1 ||'�� �Դϴ�.');
	
	--err ����Ŭ�� true / false�� ����� �� ����.
	dbms_output.put_line(age > 10);
	
end;
/