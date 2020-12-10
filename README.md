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


## References

* https://github.com/cloudera/flink-tutorials/tree/master/flink-sql-tutorial
* https://github.com/tspannhw/FlinkSQLWithCatalogsDemo
* https://github.com/tspannhw/ClouderaFlinkSQLForPartners/blob/main/README.md
* https://github.com/tspannhw/ApacheConAtHome2020/tree/main/scripts
* https://github.com/tspannhw/SmartWeather
