select * from user_constraints;
select * from user_tab_cols;
select * from user_tab_columns;

--��Ű�� test_pack�� 1109������ ����Ǿ� ����

--��Ű�� : test_pack || ���ν���
var cur refcursor;
exec test_pack.proc_work12('other_constraints', :cur);
print cur;