-- �����ȣ, �����, ������ �Է¹޾� �����ȣ�� ��ġ�ϴ� ����� ������ ������� cp_emp2���̺��� ���� (Ŀ���ؾ���)
-- ��, ������ 3000������ �� 1000�� ���� �������� �����մϴ�.

set verify off
set serveroutput on

accept empno prompt '�����ȣ : '
accept ename prompt '����� : '
accept sal prompt '���� : '

declare
	cnt number;
	i_empno cp_emp2.empno%type := &empno;
	i_ename cp_emp2.ename%type := '&ename';
	i_sal cp_emp2.sal%type := &sal;
begin

	if i_sal <= 3000 then
		i_sal := i_sal+1000;
	end if;
--update�� set�� where���� ������� �÷����� ���е� �� �ֵ��� �̸��� �ٸ��� �Ͽ� �ۼ��ؾ� �Ѵ�.	
	update cp_emp2
	set		sal=i_sal, ename=i_ename
	where empno=i_empno;
	
	cnt := sql%rowcount;
	
	if cnt = 1 then	
		dbms_output.put_line(cnt||'�� ����');
		commit;
	else 
		dbms_output.put_line(cnt||'���� ����1���� �ƴϹǷ� �����۾��� ��ȣ');
		rollback;		
    end if;
end;
/