--���̸����� �����ȣ �˻�
var msg varchar2(100);
var cnt number;

execute search_zipcode('��𵵵�', :msg, :cnt);

print msg;
print cnt;

