select * from user_procedures
where object_type like 'P%';

var num number;
exec proc_plus(11,11, :num);
print num

select * from CP_EMP2;
var insert_msg varchar2(30);
execute proc_insert_cpemp2(1111,'±Ë¡§¿±',3000, :num, :insert_msg);
print insert_msg;
print num;
