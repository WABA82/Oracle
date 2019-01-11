--1. 사원테이블에서 사원번호, 사원명,직무, 매니저번호,연봉,
--   입사일을 조회하세요.
-- 단, 연봉의 오름차순으로 정렬하되, 연봉이 같다면 사원번호의
--    내림차순으로 정렬하세요.
--    입사일은 월-일-년의 형식으로 출력하세요.
--    연봉은 3자리마다 ,를 넣어 출력하세요.

select EMPNO, ENAME, JOB, MGR, to_char(SAL,'9,999,999'), to_char(HIREDATE,'mm-dd-yyyy')
from emp
order by sal asc, empno desc;

--2. 사원테이블에서 3,4분기에 입사한 사원들의  부서별 연봉합,
--    연봉평균, 최고연봉, 최저연봉, 사원수를 조회하여 아래와 같이 출력하세요.
--    출력예 )  10번부서 사원수는 [x]명, 연봉평균 : [xx],
--	   최고연봉 [xx], 최저연봉[xx]

select
from
where to_char(hiredate,'q'=) 

--3. TEST_ORDERBY테이블에서 번호를 출력하세요.
--   단, 출력되는 번호는  S_0000000001 형식으로
--   10자리의 숫자가 되어야하며, 10자리가 되지 않는 숫자는
--  앞에 0을 붙여 10자리로 만들고 'S_' 를 붙여 출력한다.

select concat('S_',lpad(num,10,0))
from TEST_ORDERBY;

select * from TEST_ORDERBY;

--4. 사원테이블에서 부서번호, 부서명, 연봉,보너스,총수령액,
-- 입사일을 조회하세요.
--   단. 총수령액은 '연봉+월급+보너스'를 합산한 금액으로
--   조회하세요.  월급은 연봉을 12로 나눈 값을 원단위 절삭하여
--   계산하세요.

select DEPTNO, decode(DEPTNO,10,'부서1',20,'부서2',30,'부서3') as deptname, SAL, COMM, sal+trunc(sal/12,-1)+comm as total, HIREDATE
from EMP;

--5. 사원 테이블에서 부서번호,부서명,연봉, 보너스, 인센티브를
--   조회하세요.
--   인센티브는  아래표와 같이 부서별로 차등 지급합니다.
--   10- 월급에 100%, 20- 월급에 150%, 30 - 월급에 300%
--   그외 월급에 50%

select DEPTNO, decode(DEPTNO,10,'부서1',20,'부서2',30,'부서3') as deptname, SAL, COMM,
case deptno when 10 then sal*1
when 10 then sal*1.5
when 10 then sal*3
else sal*0.5
end incen
from EMP;

--6. class4_info 테이블에 아래와 같은 데이터를 추가합니다.
--   번호 - 10, 이름 - 황재성, 주민번호 - 030101-3234567
--   번호 - 12, 이름 - 신세계, 주민번호 - 011201-4234567
--   번호 - 13, 이름 - 박나래, 주민번호 - 880101-2234567
--   번호 - 14, 이름 - 김신영, 주민번호 - 880101-2234567

select * from CLASS4_INFO;

insert into class4_info(num, name, ssn)
values(10,'황재성','030101-3234567');

insert into class4_info(num, name, ssn)
values(12,'신세계','011201-4234567');

insert into class4_info(num, name, ssn)
values(13,'박나래','880101-2234567');

insert into class4_info(num, name, ssn)
values(14,'김신영','880101-2234567');

commit;

--7. class4_info 테이블에서 번호, 이름 , 주민번호,
--   성별을 조회 하세요.
--   성별은 주민번호의   8번째 자리로 구한다.
--   8번째 자리가 1,3이면 남자, 2,4면 여자 그렇지 않으면 "오류"
--   로출력한다.

select NUM, NAME, SSN,
decode ( substr(ssn,8,1) when 1 then '남자'
						when 3 then '남자'
						when 2 then '여자'
						when 4 then '여자'
						end as gender
from class4_info;

select * from CLASS4_INFO;

