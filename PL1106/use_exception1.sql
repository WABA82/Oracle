--���̵�, �̸�, ��й�ȣ�� �Է¹޾� table_primary
--���̺� ���ڵ� �߰��ϴ� PL/SQL�� �ۼ�
set verify off
set serveroutput on
	accept name prompt '�̸� : ';
	accept id prompt '���̵� : ';
	accept passwd prompt '��й�ȣ ; ';
declare
	name varchar2(30);
	id varchar2(30) := '&id';
	passwd varchar2(30) := '&passwd';
begin
    --�Է¹��� ���ڿ��� ���̰� ������ �� �ִ� ũ�Ⱑ �ƴ϶�� "���ܷδ� ó���� �� ���� �ڵ�� ó���ؾ��Ѵ�."
	if length('&name') > 10 then
		dbms_output.put_line('�Է°����� ���ڼ��� �ʰ��Ͽ����ϴ�.'); 
	else
		name := '&name';
		insert into table_primary(name, id, passwd)
		values(name, id, passwd);

		dbms_output.put_line(id || '���� ������ �߰� �߽��ϴ�.');
		commit;
	end if;

	exception
	when dup_val_on_index then
		dbms_output.put_line('�Է��Ͻ�' || id || '�� �̹� ������Դϴ�');
		--����ó�� ��ü�� �����ϴ� �޼��� : sqlerrm
		dbms_output.put_line( sqlerrm );
		--����ó�� ��ü�� �����ϴ� �����ڵ� : sqlcode
		dbms_output.put_line( sqlcode );

end;
/
