SELECT *
FROM daily_gold_rate

ALTER TABLE daily_gold_rate
ALTER COLUMN Date date

-- Seeing top 15 highest values of the USD 

SELECT TOP 15 Date,	USD
FROM daily_gold_rate
ORDER BY USD DESC

-- Seeing the highest value of USD 

SELECT TOP 1 Date,	USD
FROM daily_gold_rate
ORDER BY USD DESC

-- Seeing when the USD was the same as EUR

SELECT date,USD, EUR 
FROM daily_gold_rate
WHERE USD = EUR

-- Seeing the pattern of the USD in the first 3 days of every month in the dataset

select convert(varchar,date,34)
from daily_gold_rate
 
 DROP TABLE IF EXISTS #TempDate
 create table #TempDate 
 (DateMod varchar(255),
  USD float)

 insert into #tempdate
 select convert(varchar,date,34),USD
from daily_gold_rate

SELECT 
SUBSTRING(DATEmod,CHARINDEX('-',datemod)-2,5)
FROM #tempdate

create table #tempdate3
(date3 varchar(255)
,usd float)

insert into #tempdate3
SELECT 
SUBSTRING(DATEmod,CHARINDEX('-',datemod)-2,5),usd
FROM #tempdate


select *
from #tempdate3
where date3 like '01%' or date3 like '02%' or date3 like '03%'



