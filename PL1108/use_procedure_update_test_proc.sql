select * from user_procedures;

--insert_test_proc ���ν����� �����ϱ� ���� �ܺκ��� ����
var result varchar2(300);
var cnt number;

 exec update_test_proc(1112,'����',3000,:cnt, :result);


-- ������Ʈ ���ν��� ���� :
exec update_test_proc(1112,'����',3000,:row_cnt, :result_msg);

print result:
print row_cnt:


select * from TEST_PROC;

--�������1:���� ������ �Է��� ���
exec update_test_proc(1112,'����',3100,:row_cnt, :result_msg);

print result_msg:
print row_cnt:


select * from TEST_PROC;

--������ ���� ���
exec update_test_proc(1114,'����',2490,:row_cnt, :result_msg);

print result_msg:
print row_cnt:


select * from TEST_PROC;
