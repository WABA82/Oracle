--sys_refcursor의 사용

var cur_dept refcursor;
var;
--sys_refcursor를 저장
exec select_all_dept(:cur_dept);
print cur_dept;

