select * from user_constraints;
select * from user_tab_cols;
select * from user_tab_columns;

--패키지 test_pack은 1109폴더에 저장되어 있음

--패키지 : test_pack || 프로시저
var cur refcursor;
exec test_pack.proc_work12('other_constraints', :cur);
print cur;