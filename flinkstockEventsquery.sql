SELECT * 
FROM 
( SELECT * , ROW_NUMBER() OVER 
( PARTITION BY window_start ORDER BY num_stocks desc ) AS rownum 
FROM ( 
SELECT TUMBLE_START(event_time, INTERVAL '10' MINUTE) AS window_start, 
symbol, 
COUNT(*) AS num_stocks 
FROM stockEvents 
GROUP BY symbol, 
TUMBLE(event_time, INTERVAL '10' MINUTE) ) ) 
WHERE rownum <=3;

SELECT `symbol`, 
TUMBLE_START(event_time, INTERVAL '1' MINUTE) as tumbleStart, 
TUMBLE_END(event_time, INTERVAL '1' MINUTE) as tumbleEnd, 
AVG(CAST(`high` as DOUBLE)) as avgHigh 
FROM stockEvents 
WHERE `symbol` is not null 
GROUP BY TUMBLE(event_time, INTERVAL '1' MINUTE), `symbol`;

