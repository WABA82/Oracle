-- �ֹι�ȣ ��ȿ�� ����

create or replace function c_ssn(ssn char)
return char(6)
is
	
	result_msg char(6) := '��ȿ';
	
	--�ֹι�ȣ ���ڸ��� ��� ����
	fr_ssn char(6):= substr(ssn,1,instr(ssn,'-')-1);
	--�ֹι�ȣ ���ڸ��� ��� ����
	bk_ssn char(6):= substr(ssn,instr(ssn,'-')+1);
	--'-'�� ���� �ֹι�ȣ 13�ڸ� ����
	n_ssn char(13) := concat(fr_ssn,bk_ssn);
	
	total number;
	cal_total number;
begin
	total := (substr(n_ssn,1,1) * 2) +	 (substr(n_ssn,2,1) * 3) +
	(substr(n_ssn,3,1) * 4) + (substr(n_ssn,4,1) * 5) + (substr(n_ssn,5,1) * 6) +
	(substr(n_ssn,6,1) * 7) + (substr(n_ssn,7,1) * 8) + (substr(n_ssn,8,1) * 9) +
	(substr(n_ssn,9,1) * 2) + (substr(n_ssn,10,1) * 3) +
	(substr(n_ssn,11,1) * 4) + (substr(n_ssn,12,1) * 5);
	
	cal_total := mod(11-mod(total,11),10); 
	
	if cal_total = substr(bk_ssn,7,1) then
	
	
end;
/ 