--�ֹι�ȣ�� ��ȿ�� ����
--�� �ڸ��� 234567892345�� ���Ѱ��� ���ؼ�
--11�� ���� �������� ���ϰ� 11���� �� ���� 10���� ���� �������� ���� �� ���� �ֹι�ȣ�� ������ ���ڿ� ���ٸ�
-- ��ȿ | ��ȿ

create or replace function valid_ssn(ssn char)
return varchar2
is
	result_msg varchar2(6) := '��ȿ';
	
	--������ ���� ���� ����
	temp_val number := 0;	
	--�� ���ڸ��� ���� ����
	flag_num char(1);
	--�ε��� 2~9����
	idx number := 2;	
	--�������� ������ �ֹι�ȣ 12�ڸ�
	temp_ssn char(12);
begin
	
	--�ֹι�ȣ�� ������  'success'�� ���� �����Լ��� ó���Ѵ�.
	if check_ssn(ssn) = 'success' then
	--temp_ssn = 880101123456 
	temp_ssn := substr(ssn,1,6) || substr(ssn,8,6);
	--temp_ssn = 880101123456                               
	flag_num := substr(temp_ssn,14,1);
	
	for i in 1 .. length(temp_ssn) loop
		temp_val := temp_val+substr(temp_ssn,i,1)*idx;
		idx := idx+1;
		if idx = 10 then
			idx := 2;
		end if;
	end loop;
		temp_val := mod(11-mod(temp_val,11),10);
		if temp_val = flag_num then
			result_msg := '��ȿ';
		end if;
	end if;
	return result_msg;
end;
/
