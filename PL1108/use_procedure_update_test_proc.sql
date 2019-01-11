select * from user_procedures;

--insert_test_proc 프로시저를 실행하기 위한 외부변수 선언
var result varchar2(300);
var cnt number;

 exec update_test_proc(1112,'주임',3000,:cnt, :result);


-- 업데이트 프로시져 실행 :
exec update_test_proc(1112,'주임',3000,:row_cnt, :result_msg);

print result:
print row_cnt:


select * from TEST_PROC;

--제약사항1:없는 직급을 입력한 경우
exec update_test_proc(1112,'선인',3100,:row_cnt, :result_msg);

print result_msg:
print row_cnt:


select * from TEST_PROC;

--연봉이 적은 경우
exec update_test_proc(1114,'선인',2490,:row_cnt, :result_msg);

print result_msg:
print row_cnt:


select * from TEST_PROC;
