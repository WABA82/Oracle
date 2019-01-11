--숙제 
--1. 아래의 Dictionary테이블을 사용하여 
--user_constraints, user_tab_cols, user_tab_columns
--입력된 테이블에 대한 제약사항명, 컬럼명, 데이터형 
--을 조회하는 쿼리문을 작성 .

create or replace procedure work_select_dic
(i_table varchar2, 
cur_con out sys_refcursor, cur_col out sys_refcursor)
is
	type rec_tab is 

begin
	
	select uc.constraint_name, uc.column_name, utc.table_name, utc.data_type  
	from user_tab_cols utc, user_constraints uc
	where (utc.table_name = uc.table_name) and utc.table_name = 'emp';
	
end;
/
