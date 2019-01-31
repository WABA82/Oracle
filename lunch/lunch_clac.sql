select * from ORDERING;

select * from LUNCH;

--Æ÷Å©Ä¥¸®, L_000001, ÃÑ ÆÇ¸Å¼ö·® 4°³, 4500*4 = 18000
--µ·±î½º, L_000002, ÃÑ ÆÇ¸Å¼ö·® 1°³, 3800*1 = 1

select to_char(to_date('2019-1-15','yyyy-mm-dd'),'yyyy-mm-dd')
from dual;
;
select l.lunch_name, l.lunch_code, sum(o.quan) total, sum(o.quan)*l.price price
from  lunch l, ordering o
where (o.lunch_code = l.lunch_code)
			and to_char(o.order_date, 'yyyy-mm-dd')=to_char(to_date('2019-1-16','yyyy-mm-dd'),'yyyy-mm-dd')
group by l.lunch_code, l.lunch_name, l.price
order by l.lunch_code;
