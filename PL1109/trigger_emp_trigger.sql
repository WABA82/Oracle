--cp_emp���̺� ���ڵ尡 �߰��Ǹ� cp_emp3���̺� �����ȣ,�����, �μ���ȣ, ��� ������ �߰��ϰ�
--�μ���ȣ�� emp���̺��� �����ȣ�� 7788�� ����� ������ ��ȣ 
--cp_emp���̺� �Է��� ������ 2000���ϰ� �߰��Ǹ� ep_emp3���̺��� ���� 500�� ���߰��ؼ� ��� 

create or replace trigger emp_trigger
after insert on cp_emp
declare
	r_deptno number;    
	trigger_sal number;
begin
	
	select deptno
	into r_deptno
	from    emp
	where empno = 7788;	
    
    if(:new.sal) <= 2000 then
		trigger_sal := :new.sal+500;
	end if;        
	
	insert into cp_emp3(empno,ename,deptno,sal)
	values(:new.empno, :new.ename, r_deptno, trigger_sal);
		
	end if;
end;
/
