--변수
set serveroutput on
declare
-- 1.변수의 선언 : 변수명 데이터형(크기);
	name varchar2(60);

begin
--2. 값할당 : 변수명:=값;
	name := '홍길동';
	name := '이재찬';
--3. 사용 : 출력, 연산참여, 재할당
	dbms_output.put_line('이름 : ' || name);
end;
/

--테이블의 데이터형을 참조하는 변수
set serveroutput on
declare
-- 1.변수의 선언 : 테이블의 컬럼테이터형을 참조하여 변수 선언
	e_name emp.ename%type;
begin
--2.값 할당
	e_name :='이재현';
--3. 사용 : 출력, 연산참여, 재할당
	dbms_output.put_line('참조변수 사용 : ' || e_name);
end;
/

--테이블의 모든 컬럼의 데이터형을 참조하는 변수
set serveroutput on
declare
-- 1.변수의 선언 : 테이블의 모든 컬럼테이터형을 참조하여 변수 선언
	row_type cp_emp%rowtype;
begin
--2.값 할당
	row_type.empno := 1111;
	row_type.ename :='정택성';
	row_type.hiredate := sysdate;
	row_type.sal :=2800;
--3. 사용 : 출력, 연산참여, 재할당
	dbms_output.put_line('사원번호 : ' || row_type.empno || ', 사원명 : ' || row_type.ename || ', 입사일 : ' || row_type.hiredate || ', 연봉 : ' || row_type.sal);
end;
/