--�̸� ���̸� �Է¹޾� ref_tab���̺��� �����Ͽ� ������
--����(���ڵ庯��)�� ���� �Է��� �� �Ʒ��� ���� ����ϴ�
--PL/SQL�� �����ϼ���.
--���) �̸� : xxx�� ���� : xx�� (�۳⳪�� xx��, ���⳪�� : xx��)

set verify off
set serveroutput on

accept name prompt '�̸��Է� : ';
accept age prompt '�����Է� : ';

declare
	row_type ref_tab%rowtype;
begin
	row_type.name := '&name';
	row_type.age := &age;

	insert into REF_TAB(name,age) values(row_type.name, row_type.age);

	dbms_output.put_line('�̸� : ' || row_type.name || ' ���� : ' || row_type.age );
	dbms_output.put_line('�۳⳪�� ' || (row_type.age-1) || ' ���⳪�� : ' || (row_type.age+1) );
end;
/
