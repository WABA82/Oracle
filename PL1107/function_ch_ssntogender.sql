--2.  �ֹι�ȣ�� �Է¹޾� ����(���� -M, ����-F)�� ��ȯ�ϴ� �Լ� �ۼ�.
--   ������ 880101-x111111 ����-Ȧ��, ���� - ¦��

create or replace function ch_ssntogender(ssn char)
return char
is
	result_msg char(1)
	
	--�ֹι�ȣ ���ڸ��� ù��° ����
	last_ssn char(1) := substr(ssn,instr(ssn,'-')+1,1)
begin

	
	return result_msg;
end;
/
