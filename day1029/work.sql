----1. 아래의 조건에 맞는 테이블을 생성하고 적절한 제약사항을 부여한후 모든 제약조건에 성공하는 경우와 각각의 경우에 따라 실패하는 모든 쿼리문을 작성하세요.
--부서번호, 사원명, 연봉, 이메일, 전화번호, 주소, 성별,입사일, 사원번호를 저장하는 테이블을 생성.
--부서번호는 숫자 2자리 이며 dept테이블의 deptno만 입력할 수 있다.
--사원명은 가변길이형 이고 한글고 10글자 까지 입력가능하다 반드시 입력해야 한다.
--연봉은 숫자이고 억단위의 입력이 가능하다. 입력가능 연봉은 2400~8000입력할 수 있다.
--이메일, 전화번호는 없을수도 있지만 있다면 유일하다.
--성별은 남자 / 여자만 입력가능하다.
--주소는 없을 수도 있다.
--입사일은 날짜형식이며 입사일이 null이면 현재날짜를 입력
--사원번호는 숫자4이며 null을 허용하지 않고 중복데이터를 저장할 수 없다.
--모든 에러사항과 성공상황에 대해 쿼리문을 작성한 후
--foreign key 해당하는 제약사항을 비활성화 시킨후 삭제를 하시오.

select * from DEPT;
select * from user_constraints
where table_name = 'DEPT';

create table testwork(
	deptno number(2) constraint fk_testwork_deptno references DEPT(DEPTNO),
	ename varchar2(30) constraint C_testwork_ename not null,
	sal number(9) constraint C_testwork_SAL check(sal between 2400 and 8000),
	email varchar2(60) constraint uk_testwork_email unique,
	tel varchar2(60) constraint uk_testwork_tel unique,
	gender varchar2(6) constraint C_testwork_gender check(gender='남자' or gender='여자'),
	addr varchar2(100) null,
	hiredate date default sysdate,
	empno number(4) constraint pk_testwork_empno primary key
);

