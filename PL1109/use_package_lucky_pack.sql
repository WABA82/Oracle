--lucky_pack ���--


-- �Լ� ȣ��
select  LUCKY_PACK.LUCKY_NUM
from dual;

--���ν��� ȣ��--
var name varchar2(30);
var;

exec LUCKY_PACK.LUCKY_NAME( :name );

print name;


var ssn char(14);
var;

exec LUCKY_PACK.CREATE_SSN('880101','����','������', :ssn);
print ssn;

select * from CLASS4_INFO;
