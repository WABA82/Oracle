--�����ȣ, ����, ������ �Է¹޾� test_proc���̺���
--�����ϴ� ���ν���

--1. ������ ��� ���� �븮 ���� ���� ���� �̻�, ��, ����, ��ǥ�̻簡 �ԷµǾ��� ���� �����Ѵ�. 

-- 2. ������ ���� �������� �۴ٸ� ���翬���� 5%�λ� 

-- 3. ������ ���, ����, �븮, ����, ����, ����, �̻簡 �Է� �Ǿ��� 
-- ���� �߰��Ѵ�.  

-- 4. ������� �����ΰ��  ù�ڸ� �빮�ڷ� �����Ͽ� �߰� 
-- �ߺ��� ��� ��ȣ�� �ԷµǸ� ���ܷ� ó���Ѵ�. 

create or replace procedure update_test_proc(
	i_empno in number, i_job in varchar2, i_sal in number, row_cnt out number, result_msg out varchar2)
is
	 
	--������ ���̺� �ִ� �����ȣ�� ���� �����ͼ� temp_sal����
	temp_sal number;
begin 
	row_cnt := 0; --�⺻���� null���� ���� ������ �⺻ 0���� ���� �Ҵ��Ѵ�.
	
	--1.
	if i_job in ('�븮', '����', '����', '����', '�̻�', '��', '����', '��ǥ�̻�') then
		--2. ������ ���̺� �ִ� �����ȣ�� ���� �����ͼ� temp_sal������ ��Ƽ� ����ϱ�.
		select sal
		into    temp_sal
		from  	test_proc 
		where	empno=i_empno;
		
		if i_sal < temp_sal then
			temp_sal := trunc((temp_sal + temp_sal*0.05),0);
		else
			temp_sal := i_sal;
		end if;
		
		update	test_proc
		set			job = i_job, sal=temp_sal
		where 	empno=i_empno;

	row_cnt := sql%rowcount;
	commit;
	result_msg := i_empno || '�� ����� ������ ����Ǿ����ϴ�. ���ÿ��� : ' || i_sal || ', Ȯ������ : ' || temp_sal;

	else
	 	result_msg := i_job || '�� �系�� ������ �ƴմϴ�.';
	end if;
	
	exception
	when no_data_found then
		result_msg := i_empno || '�� ����� �������� �ʽ��ϴ�.';
	when others then
		result_msg := sqlerrm || sqlcode;
end;
/
