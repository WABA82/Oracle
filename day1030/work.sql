--1. 배기량이 1500~3000 사이인 차량의 제조국,제조사,모델명,년식,가격,
--    이미지,입력일,배기량, 옵션을 조회
--
----------단. 출력은 배기량의 내림차순 정렬했을때 3~6번째 레코드만 조회하고,
--
--     옵션은 처음 ',' 까지만 출력 할것. 가격과 연식은 3자리마다 ,를 넣어출력,
--     입력일은 월-일-년 의 형식으로 출력 할것.

select * from CAR_COUNTRY;
select * from CAR_MAKER;
select * from CAR_MODEL;

select R,COUNTRY, MAKER, MODEL, to_char(CAR_YEAR,'9,999'), to_char(PRICE,'99,999'), CAR_IMG, to_char(HIREDATE,'mm"월" dd"일" yyyy"년"'), CC, substr(CAR_OPTION,1,instr(CAR_OPTION,',')-1)
from (select rownum as R, COUNTRY, MAKER, MODEL, CAR_YEAR, PRICE, CAR_IMG,HIREDATE, CC, CAR_OPTION
	    from (select CON.COUNTRY, CON.MAKER, CMA.MODEL,CAR_YEAR, CMO.PRICE, CMO.CAR_IMG,CMO.HIREDATE, CMO.CC, CAR_OPTION
				from car_country con, car_maker cma, car_model cmo
				where (cma.maker(+) = con.maker and cmo.model(+) = cma.model) and cmo.cc between 1500 and 3000
	    		order by cmo.cc desc))
where R between 3 and 6;

select rownum, to_char(CMO.CAR_YEAR,'9,999'), to_char(CMO.PRICE,'99,999'), CMO.CAR_IMG, to_char(CMO.HIREDATE,'mm"월" dd"일" yyyy"년"'), CMO.CC, substr(CAR_OPTION,1,instr(CAR_OPTION,',')-1)
from car_model cmo
order by cmo.cc desc;

--2. 부서번호가 10과 30,40번인 모든 부서의 사원번호,사원명,입사일,
--   연봉,연봉순위,부서명,부서번호,위치, 우편번호,시도, 구군,동,번지 를 조회.

----  단,출력은 사원번호의 오름차순으로 정렬했을 때 2~5번째 레코드만 출력,

--   우편번호는 '-' 뒤부터 끝까지 출력, 번지가 없다면 '번지없음'으로 대체
--  하여 출력 ,입사일은 월-일-년 요일까지 출력

select * from DEPT;
select * from EMP;
select * from ZIPCODE;

select R, EMPNO, ENAME, HIREDATE, SAL,rank() over(order by SAL desc) as RANK, DEPTNO, LOC, substr(zipcode,instr(ZIPCODE,'-')+1), SIDO, GUGUN, DONG, nvl(BUNJI,'번지없음')
from(select rownum as R, EMPNO, ENAME, HIREDATE, SAL, DEPTNO, LOC, ZIPCODE, SIDO, GUGUN, DONG, BUNJI
		from(select E.EMPNO, E.ENAME, E.HIREDATE, E.SAL, DT.DEPTNO, dt.LOC, zip.zipcode,SIDO, GUGUN, DONG, BUNJI
				from dept dt, emp e, zipcode zip
				where (e.deptno = dt.deptno and  zip.seq=e.empno) and dt.deptno in (10,30,40)
				order by e.empno asc))
where R between 2 and 5;

--3. 차량의 제조사가 '현대','기아','삼성','BMW','AUDI'이고 옵션에 'ABS','TCS'가
-- 있는 차량의  제조국, 제조사,모델명, 연식,가격, 옵션, 이미지, 배기량 조회

--  --단, 연식의 내림차순 정렬하고, 연식이 같다면 가격의 내림차순으로 정렬

--   하여 출력, 이미지는 이미지명과 확장자를 구분하여 출력할것,
--   제조사명이 영어라면 Bmw, Audi 의 형식으로 출력 .


select COUNTRY, initcap(MAKER), MODEL, CAR_YEAR, PRICE, CAR_OPTION, substr(car_img,1,instr(CAR_IMG,'.')-1),substr(car_img,instr(CAR_IMG,'.')+1), CC
from(select CC.COUNTRY, CC.MAKER, CMA.MODEL, CAR_YEAR, PRICE, CAR_OPTION, CAR_IMG, CC
		from CAR_COUNTRY CC, CAR_MAKER CMA, CAR_MODEL CMO
		where (cma.maker(+) = cc.maker and cmo.model(+) = cma.model) and cc.maker in ('현대','기아','삼성','BMW','AUDI'))
where (car_option like '%ABS%' or car_option like '%TCS%')
order by CAR_YEAR desc, PRICE desc;

select rpad(PRICE,7,0)
from CAR_MODEL;

--4. 모델명이 'K5','아반테', '소렌토','A8','SM3' 인 차량의 모델명, 제조국,
--  제조사,가격,연식을 아래와 같은 형식의 문장으로 출력.

--  단, 출력 가격의 오름차순을 정렬했을 때 2~7 사이의 레코드만 출력,

--   [모델명] 차량의 연식은 [ xxxx ]이고, 제조국은 [국산|수입]이며,
--   [XX]사가 제조사입니다. 가격은 [0,000,000]원 입니다.

select R, '['||MODEL||']' ||' 차량의 연식은'|| '['||CAR_YEAR||']' || '이고, 제조국은 ' || '['||COUNTRY||']' || '이며,' || '['||MAKER||']' || '사가 제조사입니다. 가격은 ' || '['||to_char(rpad(PRICE,7,0),'0,000,000')||']'
from	(select rownum as R, MODEL, CAR_YEAR, COUNTRY, MAKER, PRICE
		from(select cma.MODEL, CAR_YEAR, cc.COUNTRY, cc.MAKER, cmo.PRICE
				from CAR_COUNTRY CC, CAR_MAKER CMA, CAR_MODEL CMO
				where (cma.maker(+) = cc.maker and cmo.model(+) = cma.model) and cmo.model in ('K5','아반테','소렌토','A8','SM3')
				order by cmo.PRICE asc))
where R between 2 and 7;

--5. 제조사가 '현대'인 차량의 년식, 모델명, 연식별 총가격을 조회 .
--
--select e1.empno, e1.ename, e1. hiredate, e1.sal
--from emp e1, emp e2
--where (e1.sal < e2.sal) and e2.ename='SCOTT';

select cmo.CAR_YEAR,cmo.MODEL, sum(PRICE)
from car_maker cma, car_model cmo
where (cmo.model = cma.model)
	and cma.maker = '현대'
group by rollup(cmo.model, cmo.car_year);

--6. 사원명이 'S'로 끝나거나 이름5자이면서 세번째 글자가 'A'인 -
		where ename like '%S' or ename like '__A__'
--   사원의  사원번호, 사원명, 입사일,연봉,세금, 실수령액, 연봉인상액, 부서번호,부서명,위치,우편번호,시도, 구군,동,번지 를 조회
		select EMPNO, ENAME, HIREDATE, SAL, SAL*0.033 as tax, to_char(SAL+(SAL/12)+nvl(COMM,0)-(SAL*0.033),9999.99) as realget, DEPTNO, DNAME, LOC, ZIPCODE, SIDO, GUGUN, DONG, BUNJI, SEQ
--   단,실수령액은 연봉+퇴직금+보너스-세금(연봉 3.3) 로 계산

--     연봉인상액은 부서번호에 따라 차등 인상
		to_char(decode(deptno,10,SAL*0.07,20,SAL*0.04,30,SAL*1.0,SAL*0.03),'0,000')
--     10- 년봉 7%, 20- 년봉 4%, 30- 년봉+보너스 10%, 그외 3%로
--     계산하여 3자리마다 ,를 넣어 출력.
--     모든 영어는 소문자로 출력.
-- ename

select * from DEPT;
select * from EMP;
select * from ZIPCODE;

select e.empno, e.ename, e.hiredate, e.sal, SAL*0.033 as tax, to_char(SAL+(SAL/12)+nvl(COMM,0)-(SAL*0.033),9999.99) as r_sal,
		d.deptno, dname, z.zipcode, z.sido, z.gugun, z.dong, z.bunji
from emp e, dept d, zipcode z
where (e.empno = z.seq and e.deptno = d.deptno)


case deptno when 10 then 0.07
				when 20 then 0.04
			    when 30 then 0.1+comm*0.1
			else 0.03      
			
--select empno, ename, deptno, sal,
--case deptno when 10 then sal * 0.2 + sal + nvl(comm,0)
--				when 20 then sal * 0.5 + sal + nvl(comm,0)
--				when 30 then sal * 0.3 + sal + nvl(comm,0)
--				else sal * 0.1 + sal + nvl(comm,0)
--				end incen
--from emp;	