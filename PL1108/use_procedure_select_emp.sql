--프로시저 search_emp

var cur_emp refcursor;
var;

execute select_emp(10,:cur_emp);
execute select_emp(20,:cur_emp);
execute select_emp(30,:cur_emp);

execute select_emp(15,:cur_emp);
execute select_emp(27,:cur_emp);
execute select_emp(32,:cur_emp);

execute select_emp(1000,:cur_emp);

print cur_emp;