--triggering event 비교
create or replace trigger event_compare
after insert or update or delete on trigger1
for each row
--trigger 안에서 변수를 작성하려면 declare를 사용해야한다.
--declare
--	num number;
begin
	if inserting then
		--trigger2테이블에 이름, 나이 1살 더하기 를 추가
		--dbms_output.put_line('추가 작업 감시');
		insert into trigger2(name, age)
		values(:new.name, :new.age+1);
	end if;

	if updating then
		--trigger1 테이블에서 변경작업이 발생하면 trigger2 테이블에 이전이름과 나이를 추가한다.
		insert into trigger2(name, age)
		values(:old.name, :old.age+1);
	end if;

	if deleting then
		--trigger1테이블에서 삭제작업 발생하면 trigger2테이블에서 같은 이름의 모든 레코드를 삭제
		delete from trigger2
			where name = :old.name;
	end if;

end;
/
