--시노님 생성

select * from user_synonyms;

create synonym tmp for TABLE_MULTIPRIMARY;

--시노님 DML 사용
select * from tmp;

insert into tmp (ITEM_NUM, ITEM, ITEM_INFO)
values('item_0003', '바나나', '뒤에 오는 라이더가 밟으면 미끄러짐');

update tmp
set item_num = 'ITEM_0003'
where item = '바나나';

drop synonym tmp;