set serveroutput on
set verify off;

accept grade prompt '����� : ';
accept item_name prompt '��ǰ�� : ';
accept price prompt '��ǰ���� : ';
declare
	grade varchar2(30) :='&grade';
	item_name varchar2(60) :='&item_name';
	price number :=&price;
	sale number;
begin
	if grade in ('Ư��','�Ϲ�') then
		if grade = 'Ư��' then
			sale :=0.5;
		else
			sale :=0.3;		
		end if;
		dbms_output.put_line(grade || '���� �����Ͻ� ��ǰ' ||
								 item_name || '�̰� ���� ' ||
								  price || '�� �̸� ���ΰ�' || (price-price*sale));	
	end if;

end;
/