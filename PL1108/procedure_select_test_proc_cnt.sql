--��ȸ : ������ �Է� �޾� �ش� ������ ������� ��������
--������ ��'���','����','�븮','����','����','����','�̻�','��','����', '��ǥ�̻�'�� �Է��� ���ֽ��ϴ�.
--out parameter�� ���� �ϴ� ���ν���

create or replace procedure select_test_proc_cnt
(i_job in varchar2, mg out varchar2, emp_cnt out number, emp_sal out number)
is
	--���� �ʱ�ȭ ����
	temp_sal number := 0; 
	
	
begin 
    --���� �ʱ�ȭ
	emp_cnt := 0;
	emp_sal := 0;	

	if i_job in ('���','����','�븮','����','����','����','�̻�','��','����', '��ǥ�̻�' ) then
		
		select    count(empno), sum(sal)
		into        emp_cnt, emp_sal
		from		test_proc
		where		job=i_job;
		
		
--		for rec_emp in 
--			(select sal from test_proc where job = i_job) 
--		loop                                 
--			--��ȸ�� ���� �� �� ���� ����� ����
--			emp_cnt := emp_cnt + 1;
--			emp_sal := emp_sal + rec_emp.sal;
--		end loop;
		if emp_cnt != 0 then
			mg := i_job || '���� ��ȸ�� ����� �ֽ��ϴ�.';
		else
			mg := i_job || '������ ����� �������� �ʽ��ϴ�.';
			emp_sal := 0;
		end if;		
	else
		mg := i_job || '�ش� ������ �����ϴ�.';
		emp_sal := 0;
	end if;
	
end;
/
