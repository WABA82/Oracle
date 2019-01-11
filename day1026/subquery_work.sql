select * from CAR_COUNTRY;
select * from CAR_MAKER ;
select * from CAR_MODEL;

--1. 사원 테이블에서 사원번호,사원명, 연봉, 보너스를 조회
--   단, 사원 번호를 내림차순 정렬 했을 때 3~5사이의 레코드만 출력 하고
--      연봉은 7자리로 맞춰 출력하고 ,를 넣어 출력한다.
--      해당 자리에 값이 없으면 0을 출력한다.

--select rownum, r, empno, ename, to_char(hiredate)
--from (select rownum as R, empno, ename, hiredate
--		from (select rownum, empno, ename, hiredate
--				from emp order by hiredate desc))
--where r between 2 and 6 ;

select rownum, R, EMPNO, ENAME, SAL, COMM
from ( select rownum as R,EMPNO, ENAME, SAL, COMM from (select rownum, EMPNO, ENAME, SAL, COMM from emp order by empno desc))
where r between 3 and 5;

--2. class4_info 테이블에서 번호, 이름 , 나이, 태어난 해를 조회 하세요.
--   태어난 해는 현재년도-나이+1 로 구합니다.
sysdate-age+1 as birth;

select age, to_char(sysdate,'yyyy')-age+1 as birth
from class4_info;

select num, name, age, to_char(sysdate,'yyyy')-age+1 as birth
from  class4_info;

--3. class4_info 테이블 번호, 이름 나이, 이메일, 이메일의 유효성 여부를
--   조회.
--   단, 이메일의 유효성은 '@' 이 없으면 '무효', '@'이 존재하면 '유효'를출력
select substr(email,instr(email,'@'),1)
from class4_info;

select decode(substr(email,instr(email,'@'),1),'@','유효','무효')
from class4_info;

select num,name,age,email,decode(substr(email,instr(email,'@'),1),'@','유효','무효') as PO
from class4_info;

--4. car_model 테이블에서 옵션에 'ABS'나 '에어백'이 있는 차량의
--    모델명,년식,가격,옵션, 이미지, 제조사를 조회 하세요.
--    단, 가격의 오름차순으로 정렬하여 출력할 것.

select CAR_OPTION
from CAR_MODEL
where CAR_OPTION like '%ABS%' or CAR_OPTION like '%에어백%';

select MODEL, CAR_YEAR, PRICE, CAR_OPTION, CAR_IMG, CC
from (select MODEL, CAR_YEAR, PRICE, CAR_OPTION, CAR_IMG, CC
from CAR_MODEL
where CAR_OPTION like '%ABS%' or CAR_OPTION like '%에어백%')
order by price desc;

--5. car_model 테이블에서 모델명이 '아반테', '소렌토', 'A8'인 차량의
--    모델명,모델별 가격 총합과 총계를 조회 하세요.

--having절 그룹화 조건 설정
--rollup :  그룹별 소계와 총계를 구할 때 사용하고 결과를 레코드 출력 후에 보여준다.
--cube : 그룹별 소계와 총계를 구할 때 사용하고 결과를 레코드 출력 전에 보여준다.

select MODEL, PRICE, sum(price)
from car_model
where model like '아반테' or model like '소렌토' or model like 'A8'
group by rollup(model,price);

select * from CAR_MODEL;
select * from CAR_MAKER;

--6. car_model 테이블에서 차량 가액이 1500~3000 사이인 차량의
--   모델명, 년식, 가격, 옵션, 입력일, 가격별 순위를 조회하세요.
--   단, 가격별 순위는 중복되지 않는 번호가 출력되어야합니다.
--
--	* rank() over() : 중복 순위가 발생 할 수 있음
--	*
--row_number() over() : 중복 순위가 발생하지 않음
--	*
--rank() over(order by 정렬할 컬럼 asc/desc) : 단순 순위 정하기
--	*
--rank() over(partition by) 그룹 컬럼명 order by 컬럼명 asc/desc : 그룹별 순위 구하기
--


select MODEL, CAR_YEAR, PRICE, CAR_OPTION, HIREDATE, row_number() over(order by price asc) as ranking
from car_model
where price between 1500 and 3000;

--7. 사원 테이블에서 입사년도가 1981년 이상이면서 매니저가 있는  사원의
--   사원번호,사원명,연봉,매니저번호, 연봉 순위를 조회 하세요.
--   단, 연봉순위는 동일한 연봉일 때 동일한 순위를 보여줍니다.

select * from EMP
order by hiredate desc;

select EMPNO, ENAME, MGR, SAL, rank() over(order by sal asc) as ranking, hiredate
from (select empno, ename, sal, hiredate,mgr from emp where hiredate >= all(select hiredate from emp where to_char(hiredate,'yyyy')='1981') order by hiredate asc)
where mgr is not null;


select rownum, empno, ename, hiredate
from (select rownum, empno, ename, hiredate from emp order by hiredate desc)
where hiredate >= all(select hiredate from emp where to_char(hiredate,'yyyy')='1981');

