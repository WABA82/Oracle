--

var msg varchar2(300);
var cnt number;

var
-- ����: �����ϴ� �����ȣ�� ����, �������� �ʴ� �����ȣ
exec delete_test_proc(1111, :msg, :cnt);

print msg;
print cnt;

select * from test_proc;
