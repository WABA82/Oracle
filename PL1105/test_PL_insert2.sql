--�����ȣ, �̸�, ������ �Է¹ް�
--������ 5000�̻��̸� cp_emp3���̺��� �߰�
--������ 5000���϶�� cp_emp2���̺��� �߰��ϴ� pl/sql �ۼ�
--cp_emp3���̺��� �߰��Ǵ� ����� �μ���ȣ�� 10���̴�.

set verify off
set serveroutput on

accept empno prompt '�����ȣ : '
accept ename prompt '�̸��Է� : '
accept sal prompt '�����Է� : '

declare
	empno cp_emp2.empno%type := &empno;
	ename cp_emp2.ename%type := '&ename';
	sal cp_emp2.sal%type := &sal;	
begin
	
	if sal >= 5000 then
		insert into cp_emp3(empno, ename, deptno, sal)
		values(empno,ename,10,sal);
		dbms_output.put_line('������ 5000�̻��̹Ƿ� CP_EMP3 ���̺� �߰�');
	else
		insert into cp_emp2(empno, ename, hiredate, sal)
		values(empno,ename,sysdate,sal);
		dbms_output.put_line('������ 5000�����̹Ƿ� CP_EMP2 ���̺� �߰�');
	end if;
	
	commit;
	
end;
/