--1. �Ի�⵵�� �Է¹޾� �ټӳ���� 10�� �̻��̸� '���ټ�'
--  �׷��� ������ '�ܱ�ټ�'�̶�� �޼����� ��ȯ�ϴ� �Լ� �ۼ�.

set verify off
set serveroutput on
	accept i_hiredate prompt '�Ի�⵵ : '
declare

begin
	check_workingyear(&i_hiredate)
end;
/