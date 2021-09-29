#!/bin/bash


sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --query 'select * from olist_orders WHERE order_purchase_timestamp <= (current_date -INTERVAL '1848' DAY) AND $CONDITIONS' -m 1 --delete-target-dir --hive-import --hive-database diamond_landing_layer --hive-table olist_orders_query --hive-overwrite --target-dir /user/jordanetsafack6744/bigdata/output/diamond/tmp