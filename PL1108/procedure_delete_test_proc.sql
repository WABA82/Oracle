--�����ȣ�� �Է� �޾� �����ȣ�� ���� �� �� test_proc���̺��� �����ϴ� procedure
create or replace procedure delete_test_proc(
	i_empno in number,
	msg out varchar2,
	cnt out number)
is

begin

	delete from test_proc
		where empno = i_empno;
	cnt := sql%rowcount;

	commit;

	if cnt =1 then
		msg := i_empno || '�� ��� ���. �ູ�ϼ���.';
	else
		msg := i_empno || '�� ����� �������� �ʽ��ϴ�.';
	end if;

    --���� ó��
	exception
	when others then
	msg := ' �����߻� '||sqlerrm;
end;
/
