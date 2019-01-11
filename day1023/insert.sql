-- 테이블에 레코드(row,행) 추가
-- 컬럼명을 생략하는 경우

 insert into Class4_info values(1, '정택성', '684649-1234567',26,1.3,'jung@sist.co.kr', sysdate);
 commit;

 insert into Class4_info values(2, '684649-1234567', '택성',26,1.3,'jung@sist.co.kr', sysdate);
 commit;

-- 컬럼을 명시하여 추가
 insert into Class4_info(num,name,ssn,age,eye,email,input_date)
  values(3,'이재현','684649-1234568',26,1.3,'jung@sist.co.kr',sysdate);

-- 컬럼의 정의 순서는 테이블의 정의된 컬럼의 순서와 다르게 작성 가능

 insert into Class4_info(name,email,num,ssn,age,input_date,eye)
  values('오영근','oh@test.com',4,'890101-1234567',28,sysdate,0.8);
 commit;

-- 컬럼을 생략하면 null이 입력된다.
 insert into class4_info(num,name,age)
  values(5,'김정운',20);
 commit;     

 select * from CLASS4_INFO
