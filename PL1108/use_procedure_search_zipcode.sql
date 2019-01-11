--동이름으로 우편번호 검색
var msg varchar2(100);
var cnt number;

execute search_zipcode('상디도동', :msg, :cnt);

print msg;
print cnt;

