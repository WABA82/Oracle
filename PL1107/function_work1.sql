--1. �Ի�⵵�� �Է¹޾� �ټӳ���� 10�� �̻��̸� '���ټ�'
--  �׷��� ������ '�ܱ�ټ�'�̶�� �޼����� ��ȯ�ϴ� �Լ� �ۼ�.

create or replace function Check_workingyear(hiredate date)
return varchar2
is
	result_msg varchar2(12) := '��ȿ';
	con_work number := 0;
begin
	con_work := to_char(sysdate,'yyyy')-to_char(hiredate,'yyyy');
	
	if con_work >= 10 then
		result_msg := '���ټ�';	
	else
		result_msg := '�ܱ�ټ�';	
	end if;                                    
	
	return result_msg;
end;
/
