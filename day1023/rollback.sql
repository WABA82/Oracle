-- Transaction 취소
-- savepoint를 설정하여  특정 지점까지 작업 취소
-- Transaction이 여러개의 쿼리로 이루어진 경우 savepoint를 사용한다.

savepoint insert_a;
insert into class4_info(num, name, email)
 values(21,'테스트','test@test.com');

savepoint insert_b;
insert into class4_info(num, name, email)
 values(22,'테스트1','test1@test.com');

savepoint update_c;
update	class4_info
set	name='연습3'
where	num=22;

savepoint delete_d;
delete from class4_info
where num=22;

--저장점을 지정해서 특정 지점까지 롤백 할 수 있다.
--rollback to delete_d;
--rollback to update_c;