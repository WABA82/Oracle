--work                        
--xx��� ���� xxx��ǰ�� ������ xx�� �Դϴ�.
--��ǰ���� xx�� ���ΰ� xx�� �Դϴ�.

accept product prompt '��ǰ�� : ';
accept grade prompt '����� : ';
accept price prompt '���� : ';

declare
	product varchar2(9);
	grade varchar(6);
	price number(2);
begin
	product = '&product';
	grade = '&grade';
	price = &price;

	if score='Ư��' then
	dbms_output.put_line('grade' || '��� ����' || product || '��ǰ�� ������' || price ||'�� �Դϴ�.')
	end if;
	dbms_output.put_line('grade' || '��� ����' || product || '��ǰ�� ������' || price ||'�� �Դϴ�.')
end;
/                  