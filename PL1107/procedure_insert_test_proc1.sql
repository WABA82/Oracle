--�����ȣ, �����, ����, ����(job)�� �Է� �޾� test_proc ���̺� �߰��ϴ� ���ν��� ����
--�����ȣ�� 1~9999 ������ ���� �Է� �Ǿ�� �Ѵ�.
--������ 2500~8000 ���̸� �Է� �Ǿ�� �Ѵ�.
--2500 ���϶�� 2500���� 8000�̻��̶�� 8000���� �����Ͽ� �߰��Ѵ�.
--������ ���, ����, �븮, ����, ����, ����, �̻� �� �ϳ��� �ԷµǾ��� ���� �߰��Ѵ�.
--������� �����ΰ�� ù�ڸ� �빮�ڷ� �����Ͽ� �߰�
--�ߺ��� �����ȣ�� �ԷµǸ� ���ܷ� ó���Ѵ�.


create or replace procedure insert_test_proc1 (
	empno in number,
	ename in varchar2,
	sal in number,
	job in varchar2,
	msg out varchar2,
	row_cnt out number)
is
	temp_sal number := sal;

begin
	row_cnt := 0;
	--���� ����
	if empno not between 1 and 9999 then
		if temp_sal < 2500 then
			temp_sal :=;			
		end if;
		
		if temp_sal > 8000 then
			temp_sal := 8000;
		end if;
		
		--��������
		if job in ('���', '����', '�븮', '����', '����', '����', '�̻�') then
			insert into test_proc(empno, ename, hiredate, sal, job)
			values(empno, initcap(ename), sysdate, temp_sal, job);		
		row_cnt := sql%rowcount;
		
		commit;
		
		msg := empno || '�� ��� ������ �߰��Ǿ����ϴ�.';
					
		else
			msg :=	job || '�Է°����� ������ �ƴմϴ�.';
		end if;
	else
		msg := empno || '�����ȣ�� 1~9999 ���̰� �ƴմϴ�.';
	end if;

	exception
	when dup_val_on_index then
		msg := empn||'�� �����ȣ�� �̹� �����մϴ�.';
	when others then
		msg := '���ܹ߻� : ' || sqlerrm || '/' || sqlcode;

end;
/
