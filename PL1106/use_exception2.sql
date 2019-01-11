-- select�� �������� ��ȸ�ϰų�, �� ���� ��ȸ�� �� ����ó��
-- �����ȣ�� �Է¹޾Ƽ� CP_emp3���̺��� �ش����� �����ȣ �̸� �μ���ȣ ���� ������ ��ȸ

set verify off
set serveroutput on	
	accept empno prompt '�����ȣ : ';
declare
	i_empno number := &empno;	
	
	type rec_emp is record (
		ename cp_emp3.ename%type,
		deptno cp_emp3.deptno%type,
		job cp_emp3.job%type,
		sal cp_emp3.sal%type
	);

	emp_data rec_emp;
begin

	select		ename, deptno, job, sal	
	into		emp_data
	from		cp_emp3
	where		empno = i_empno;

	dbms_output.put_line( emp_data.ename || '	' ||
								emp_data.deptno || '	' ||
								emp_data.job || '	' ||
								emp_data.sal );
	
	exception 
--	when too_many_rows then
--		dbms_output.put_line(i_empno ||
--									'�� ����� �Ѱ� �̻� �����մϴ�.');
--	when no_data_found then
--		dbms_output.put_line(i_empno ||
--									'�� ����� �������� �ʽ��ϴ�.');
	when others then
		--��� ���ܸ� �� ó���� �� �ִ�.
		--�ֻ��� �����̱� ������ ���� �������� ���� �ؾ��Ѵ�.
		--���� ���� ���� �ϰ� �Ǹ� ���� ����ó�� ��ü�� ���ܸ� ó���ϱ� ���� ���� ���� �ȴ�.
--		dbms_output.put_line('�ν����� ���� ����' || sqlerrm );
--		dbms_output.put_line('�ν����� ���� ����' || sqlcode );
		if sqlcode = 100 then
			dbms_output.put_line('��������� ��ȸ ���� �ʽ��ϴ�.');
		end if;
		if sqlcode = -1422 then
			dbms_output.put_line('�����ȣ�� �������� ����� ��ȸ �˴ϴ�.');
		end if;
		
end;
/