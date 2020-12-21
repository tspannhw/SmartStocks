show catalogs;

use catalog default_catalog;

CREATE TABLE stockEvents ( 
`symbol` STRING, 
`uuid` STRING, 
`ts` BIGINT, 
`dt` BIGINT,
`datetime` STRING, 
`open` STRING, 
`close` STRING, 
`high` STRING, 
`volume` STRING, 
`low` STRING, 
event_time AS CAST(from_unixtime(floor(ts/1000)) AS TIMESTAMP(3)), 
WATERMARK FOR event_time AS event_time - INTERVAL '5' SECOND ) 
WITH ( 'connector.type' = 'kafka', 'connector.version' = 'universal', 
'connector.topic' = 'stocks', 
'connector.startup-mode' = 'earliest-offset', 
'connector.properties.bootstrap.servers' = 'edge2ai-1.dim.local:9092', 
'format.type' = 'registry', 
'format.registry.properties.schema.registry.url' = 'http://edge2ai-1.dim.local:7788/api/v1' );

show tables;
