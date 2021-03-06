-- record : 사용하고 싶은 데이터형을 묶어 하나의 데이터형으로 사용하는 것.

set serveroutput on

declare
	--1. record 선언 : 레코드에 포함될 변수 설정
	type score_record is record(num number(4), name varchar2(30), oracle_score number(3), java_score number(3));
	
	--사원번호, 사원명, 입사일을 저장할 수 있는 record설정
	type emp_record is record(empno emp.empno%type, ename emp.ename%type, input_date emp.hiredate%type,sal emp.sal%type);
	
	--2.record로 변수 만들기
	jaehyun_score score_record;
	
	--변수 만들기
	emp1 emp_record;
	emp2 emp_record;
	
	
	
	
begin
	--3.값 할당
	jaehyun_score.num:=1;
	jaehyun_score.name:='이재현';
	jaehyun_score.oracle_score:=97;
	jaehyun_score.java_score:=90;
	
	--emp_record 변수 값 할당
	emp1.empno := 1111;
	emp1.ename := '김정운';
	emp1.sal := 2700;
	emp1.input_date := sysdate;
	
	emp2.empno := 2111;
	emp2.ename := '김희철';
	emp2.sal := 3500;
	emp2.input_date := '2018-12-02';
	
	--4.값 사용
	dbms_output.put_line('번호 : ' || jaehyun_score.num || ', 이름 : ' || jaehyun_score.name || ', 오라클점수 : ' || jaehyun_score.oracle_score || ', 자바점수 : ' || jaehyun_score.java_score || ', 총점 : ' ||
	 (jaehyun_score.oracle_score+jaehyun_score.java_score));
  
dbms_output.put_line('-----------------------------------------------------------------------');
	 
	--emp_record 사용
	
	dbms_output.put_line('사번 : ' || emp1.empno || ', 사원명 : ' || emp1.ename || ', 연봉 : ' || emp1.sal || ', 입사일 : ' || to_char(emp1.input_date,'yyyy-mm-dd'));
	dbms_output.put_line('사번 : ' || emp2.empno || ', 사원명 : ' || emp2.ename || ', 연봉 : ' || emp2.sal || ', 입사일 : ' || to_char(emp2.input_date,'yyyy-mm-dd'));
	dbms_output.put_line('연봉차 : ' || abs(emp1.sal - emp2.sal));
	dbms_output.put_line('입사한 개월 차 : ' || months_between(emp2.input_date,emp1.input_date));	
	
end;
/