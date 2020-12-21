INSERT INTO stockalerts 
/*+ OPTIONS('sink.partitioner'='round-robin') */ 
SELECT CAST(`symbol` as STRING) symbol, 
CAST(`uuid` as STRING) uuid, `ts`, `dt`, `open`, `close`, `high`, `volume`, `low`, 
`datetime`, 'new-high' message, 'nh' alertcode, CAST(CURRENT_TIMESTAMP AS BIGINT) alerttime FROM stocks st 
WHERE `symbol` is not null 
AND `symbol` <> 'null' 
AND trim(`symbol`) <> '' 
AND CAST(`close` as DOUBLE) > 11;

