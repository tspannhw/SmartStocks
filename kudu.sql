
CREATE TABLE stocks
(
  uuid STRING,
  `datetime` STRING,
  `symbol` STRING, 
  `open` STRING, 
  `close` STRING,
  `high` STRING,
  `volume` STRING,
  `ts` TIMESTAMP,
  `dt`	 TIMESTAMP,
  `low` STRING,
PRIMARY KEY (uuid,`datetime`) ) 
PARTITION BY HASH PARTITIONS 4 
STORED AS KUDU TBLPROPERTIES ('kudu.num_tablet_replicas' = '1');
