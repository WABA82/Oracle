/*
숙제
1. 아래와 같은 데이터를 저장할 수 있는 테이블을 생성한다.
 번호 - 숫자이며 5자리까지 입력
 이름 - 가변길이형이며 한글로 10자까지 입력.
 성별 - 고정길이이며 영어로 1자 입력.
 주소 - 가변길이형이며 한글로 120자 까지입력.
 점수 - 숫자이며 3자까지 입력
 입력일 - 데이터가 추가되는 현재 일로 입력.
*/

create table team_info(
	num number(5),
	name varchar2(30),
	gender char(1),
	adress varchar2(360),
	score number(3),
	I_date date
);
/*
 select tname from tab;
 /*
2. 위 테이블에 아래와 같은 데이터를 추가한다.
  1, '김준호', 'M', '서울시 강남구 역삼동',64,오늘
  2, '김준현', 'M', '서울시 구로구 개봉동',87,오늘
  3, '오나미', 'F', '서울시 영등포구 여의도동',97,오늘
  4, '황재성', 'M', '서울시 동작구 상도동',100,오늘
  5, '유재석', 'M', '경기도 수원시 영통구',100,오늘
 */
 insert into team_info(num, name, gender, adress, score, I_date)
  values(1,'김준호','M','서울시 강남구 역삼동',64,sysdate);

 insert into team_info(num, name, gender, adress, score, I_date)
  values(2,'김준현','M','서울시 구로구 개봉동',87,sysdate);

   insert into team_info(num, name, gender, adress, score, I_date)
  values(3,'오나미','F','서울시 영등포구 여의도동',97,sysdate);

   insert into team_info(num, name, gender, adress, score, I_date)
  values(4,'황재성','M','서울시 동작구 상도동',100,sysdate);

   insert into team_info(num, name, gender, adress, score, I_date)
  values(5,'유재석','M','경기도 수원시 영통구',100,sysdate);

  select * from TEAM_INFO;

-- 3. 위 입력된 데이터 중 에서 번호가 3번이며 점수가 97점인 사람의 이름을 '테스트'로 성별을 'M'으로 변경한다.
 update team_info
 set	name='테스트', gender='M'
 where num=3 and score=97;

commit;

   select * from TEAM_INFO;

--4. 위의 데이터에서 이름이 '유재석'인 사람의성별을 'F'로 변경한다.
 update team_info
 set gender='F'
 where name='유재석';

 commit;

   select * from TEAM_INFO;

 savepoint update_a;
 update team_info
 set gender='W'
 where name='유재석';


   select * from TEAM_INFO;

   rollback to update_a ;


	select * from TEAM_INFO;

	delete from  TEAM_INFO
	where num=1 and name='김준현';

	select * from TEAM_INFO;

	truncate table team_info;

	drop table team_info;

	 select tname from tab;

	 purge recyclebin;

	 	 select tname from tab;

/*

5. 4번의 작업을 취소한다.

6. 번호가 1번이며 이름이 김준현인 사람의 데이터를 삭제한다.

7. 모든 데이터를 절삭한다.

8. 테이블을 삭제한다.

9. 휴지통을 비운다.
*/
