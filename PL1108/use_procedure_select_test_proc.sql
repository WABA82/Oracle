--직급에 대한 사원수, 연봉합 조회

var msg varchar2;
var emp_cnt number;
var sal number;
--정상작동
exec select_test_proc_cnt('주임',:msg, :emp_cnt, :sal);

print msg;
print emp_cnt;
print sal;
--정상작동
exec select_test_proc_cnt('사원',:msg, :emp_cnt, :sal);

print msg;
print emp_cnt;
print sal;

--제약사항 : 직무는 있지만 사원이 없는 경우
exec select_test_proc_cnt('대리',:msg, :emp_cnt, :sal);

print msg;
print emp_cnt;
print sal;

--제약사항 : 없는 직무를 입력했을 때
exec select_test_proc_cnt('알바',:msg, :emp_cnt, :sal);

print msg;
print emp_cnt;
print sal;
