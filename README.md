## Smart Stocks
FLaNK:   Smart Stocks


## Article

* https://www.datainmotion.dev/2020/11/flank-smart-weather-applications-with.html

* https://www.datainmotion.dev/2020/11/flank-smart-weather-websocket.html

![NiFi Ingest](https://1.bp.blogspot.com/-yWoOZkKZWCw/X5r3YQS3UAI/AAAAAAAAbzs/f16NAAkUbwQP-KIst28Tpj5J6KbOZcj6ACLcBGAsYHQ/w472-h640/weatheringest.png)

## To Script Loading Schemas, Tables, Alerts see scripts/setup.sh:

https://github.com/tspannhw/ApacheConAtHome2020

## Run Flink SQL Client

flink-yarn-session -tm 2048 -s 2 -d

flink-sql-client embedded -e sql-env.yaml

## Run Flink SQL

# Cross Catalog Query to Stocks Kafka Topic

select * from registry.default_database.stocks;

# Cross Catalog Query to Stocks Kudu/Impala Table

select * from kudu.default_database.`impala::default.stocks`;

# Default Catalog

use catalog default_catalog;

CREATE TABLE stockEvents ( 
`symbol` STRING, `uuid` STRING, `ts` BIGINT, `dt` BIGINT, `datetime` STRING, 
`open` STRING, `close` STRING, `high` STRING, `volume` STRING, `low` STRING, 
event_time AS CAST(from_unixtime(floor(ts/1000)) AS TIMESTAMP(3)), 
WATERMARK FOR event_time AS event_time - INTERVAL '5' SECOND ) 
WITH ( 
'connector.type' = 'kafka', 'connector.version' = 'universal', 
'connector.topic' = 'stocks', 'connector.startup-mode' = 'earliest-offset',
'connector.properties.bootstrap.servers' = 'edge2ai-1.dim.local:9092', 
'format.type' = 'registry', 
'format.registry.properties.schema.registry.url' = 'http://edge2ai-1.dim.local:7788/api/v1' );

show tables;

Flink SQL> describe stockEvents;
root
 |-- symbol: STRING
 |-- uuid: STRING
 |-- ts: BIGINT
 |-- dt: BIGINT
 |-- datetime: STRING
 |-- open: STRING
 |-- close: STRING
 |-- high: STRING
 |-- volume: STRING
 |-- low: STRING
 |-- event_time: TIMESTAMP(3) AS CAST(FROM_UNIXTIME(FLOOR(`ts` / 1000)) AS TIMESTAMP(3))
 |-- WATERMARK FOR event_time AS `event_time` - INTERVAL '5' SECOND
 
## References

* https://github.com/cloudera/flink-tutorials/tree/master/flink-sql-tutorial
* https://github.com/tspannhw/FlinkSQLWithCatalogsDemo
* https://github.com/tspannhw/ClouderaFlinkSQLForPartners/blob/main/README.md
* https://github.com/tspannhw/ApacheConAtHome2020/tree/main/scripts
* https://github.com/tspannhw/SmartWeather
