--lucky_pack 사용--


-- 함수 호출
select  LUCKY_PACK.LUCKY_NUM
from dual;

--프로시저 호출--
var name varchar2(30);
var;

exec LUCKY_PACK.LUCKY_NAME( :name );

print name;


var ssn char(14);
var;

exec LUCKY_PACK.CREATE_SSN('880101','남자','노진경', :ssn);
print ssn;

select * from CLASS4_INFO;
