--triggering event ��
create or replace trigger event_compare
after insert or update or delete on trigger1
for each row
--trigger �ȿ��� ������ �ۼ��Ϸ��� declare�� ����ؾ��Ѵ�.
--declare
--	num number;
begin
	if inserting then
		--trigger2���̺� �̸�, ���� 1�� ���ϱ� �� �߰�
		--dbms_output.put_line('�߰� �۾� ����');
		insert into trigger2(name, age)
		values(:new.name, :new.age+1);
	end if;

	if updating then
		--trigger1 ���̺��� �����۾��� �߻��ϸ� trigger2 ���̺� �����̸��� ���̸� �߰��Ѵ�.
		insert into trigger2(name, age)
		values(:old.name, :old.age+1);
	end if;

	if deleting then
		--trigger1���̺��� �����۾� �߻��ϸ� trigger2���̺��� ���� �̸��� ��� ���ڵ带 ����
		delete from trigger2
			where name = :old.name;
	end if;

end;
/
