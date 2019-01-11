create table test_proc as
(select empno, ename, hiredate, sal, job from emp
	where 1=0);

alter table test_proc add constraint pk_test_proc primary key(empno);

select*from user_constraints
where constraint_type = 'P';


--insert_test_proc 프로시저를 실행하기 위한
var msg varchar2(300);
var cnt number;

--직접 실행
exec insert_test_proc(1111,'테스트',3000,'주임', :msg, :cnt);


print msg;
print cnt;

--1.제약사항 : 사원번호 `1~9999번 까지
exec insert_test_proc(10000,'테스트',3000,'주임', :msg, :cnt);
exec insert_test_proc(0,'테스트',3000,'주임', :msg, :cnt);

print msg;
print cnt;

select * from test_proc;

--2.제약사항 : 연봉은 2500에서 8000사이만 입력할 수 있습니다.
-- 연봉이 2500이하 라면 2500으로  8000이상이면 8000으로 출력

exec insert_test_proc(1112,'테스트',2400,'사원', :msg, :cnt);
exec insert_test_proc(1113,'테스트',8500,'사원', :msg, :cnt);

print msg;
print cnt;

select * from test_proc;

--3. 제약사항 : '사원', '주임', '대리', '과장', '차장', '부장', '이사'의 직급만 입력할 수 있다.

exec insert_test_proc(1114,'테스트',1400,'알바', :msg, :cnt);

print msg;
print cnt;

select * from test_proc;

--4 제약사항 : 사원명은 영어인경우  첫자를 대문자로 변경하여 추가
exec insert_test_proc(1114,'kim',2500,'사원', :msg, :cnt);

print msg;
print cnt;

select * from test_proc;

--5제약사항 : 사원명이 너무 길 경우
execute insert_test_proc(1115,'선우용녀',5000,'과장', :msg, :cnt);

print msg;
print cnt;

select * from test_proc;