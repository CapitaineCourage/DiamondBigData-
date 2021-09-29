#!/bin/bash
# noter le temps d'excession des imports (text/parquetfile)
# ######## olist_customers ########
# text :
sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_customers -m 1 --delete-target-dir --target-dir  /user/jordanetsafack6744/bigdata/input/diamond/text/olist_customers
# Transferred 8.4258 MB in 19.5834 seconds (440.5761 KB/sec)
sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_customers -D mapred.reduce.tasks=10 --delete-target-dir --target-dir  /user/jordanetsafack6744/bigdata/input/diamond/text/olist_customers

# parquetfile :	
sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_customers -m 1 --delete-target-dir --target-dir  /user/jordanetsafack6744/bigdata/input/diamond/parquetfile/olist_customers --as-parquetfile
# Transferred 6.7408 MB in 20.193 seconds (341.8286 KB/sec)

# ######## olist_geolocation ######## 
# text :
#### --fetch-size
sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_geolocation -m 1 --delete-target-dir --target-dir  /user/jordanetsafack6744/bigdata/input/diamond/text/olist_geolocation
# Transferred 31.1975 MB in 24.4805 seconds (1.2744 MB/sec)
sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_geolocation -m 1 --fetch-size 5000 --delete-target-dir --target-dir  /user/jordanetsafack6744/bigdata/input/diamond/text/olist_geolocation
# Transferred 31.1975 MB in 23.9201 seconds (1.3042 MB/sec)
sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_geolocation -m 1 --fetch-size 10000 --delete-target-dir --target-dir  /user/jordanetsafack6744/bigdata/input/diamond/text/olist_geolocation
# Transferred 31.1975 MB in 25.6355 seconds (1.217 MB/sec)
sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_geolocation -m 1 --fetch-size 500 --delete-target-dir --target-dir  /user/jordanetsafack6744/bigdata/input/diamond/text/olist_geolocation
# Transferred 31.1975 MB in 24.813 seconds (1.2573 MB/sec)
sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_geolocation -m 1 --fetch-size 1500 --delete-target-dir --target-dir  /user/jordanetsafack6744/bigdata/input/diamond/text/olist_geolocation
# Transferred 31.1975 MB in 23.65 seconds (1.3191 MB/sec)
sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_geolocation -m 1 --fetch-size 2000 --delete-target-dir --target-dir  /user/jordanetsafack6744/bigdata/input/diamond/text/olist_geolocation
# Transferred 31.1975 MB in 22.61 seconds (1.3798 MB/sec)
sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_geolocation -m 1 --fetch-size 2500 --delete-target-dir --target-dir  /user/jordanetsafack6744/bigdata/input/diamond/text/olist_geolocation
# Transferred 31.1975 MB in 22.5729 seconds (1.3821 MB/sec)
sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_geolocation -m 1 --fetch-size 2750 --delete-target-dir --target-dir  /user/jordanetsafack6744/bigdata/input/diamond/text/olist_geolocation
# Transferred 31.1975 MB in 21.7078 seconds (1.4372 MB/sec)
# Transferred 31.1975 MB in 21.5209 seconds (1.4496 MB/sec)
sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_geolocation -m 1 --fetch-size 3000 --delete-target-dir --target-dir  /user/jordanetsafack6744/bigdata/input/diamond/text/olist_geolocation
# Transferred 31.1975 MB in 23.4091 seconds (1.3327 MB/sec)
# Transferred 31.1975 MB in 18.7209 seconds (1.6665 MB/sec)
# Transferred 31.1975 MB in 25.0262 seconds (1.2466 MB/sec)
sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_geolocation -m 1 --fetch-size 6000 --delete-target-dir --target-dir  /user/jordanetsafack6744/bigdata/input/diamond/text/olist_geolocation
# Transferred 31.1975 MB in 22.7516 seconds (1.3712 MB/sec)
# Transferred 31.1975 MB in 21.3328 seconds (1.4624 MB/sec)
# Transferred 31.1975 MB in 22.526 seconds (1.385 MB/sec)

#### --direct
sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_geolocation -m 1 --fetch-size 3000 --direct --delete-target-dir --target-dir  /user/jordanetsafack6744/bigdata/input/diamond/text/olist_geolocation
# Transferred 31.1975 MB in 20.6154 seconds (1.5133 MB/sec)
# Transferred 31.1975 MB in 20.0147 seconds (1.5587 MB/sec)
# Transferred 31.1975 MB in 18.6465 seconds (1.6731 MB/sec)

#### --split-by
sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_geolocation -m 1 --fetch-size 3000 --split-by geolocation_zip_code_prefix --delete-target-dir --target-dir  /user/jordanetsafack6744/bigdata/input/diamond/text/olist_geolocation
# Transferred 31.1975 MB in 22.3505 seconds (1.3958 MB/sec)
# Transferred 31.1975 MB in 21.2653 seconds (1.4671 MB/sec)
sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_geolocation -m 1 --fetch-size 3000 --split-by geolocation_city --delete-target-dir --target-dir  /user/jordanetsafack6744/bigdata/input/diamond/text/olist_geolocation
# Transferred 31.1975 MB in 19.7367 seconds (1.5807 MB/sec)
# Transferred 31.1975 MB in 21.4275 seconds (1.456 MB/sec)
sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_geolocation -m 1 --fetch-size 3000 --split-by geolocation_state --delete-target-dir --target-dir  /user/jordanetsafack6744/bigdata/input/diamond/text/olist_geolocation
# Transferred 31.1975 MB in 21.774 seconds (1.4328 MB/sec)

#### --num-mappers
sqoop import -Dorg.apache.sqoop.splitter.allow_text_splitter=true --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_geolocation --num-mappers 2 --fetch-size 3000 --split-by geolocation_zip_code_prefix --delete-target-dir --target-dir  /user/jordanetsafack6744/bigdata/input/diamond/text/olist_geolocation
# Transferred 31.1975 MB in 22.8274 seconds (1.3667 MB/sec)
# Transferred 31.1975 MB in 18.78 seconds (1.6612 MB/sec)
sqoop import -Dorg.apache.sqoop.splitter.allow_text_splitter=true --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_geolocation --num-mappers 10 --fetch-size 3000 --split-by geolocation_zip_code_prefix --delete-target-dir --target-dir  /user/jordanetsafack6744/bigdata/input/diamond/text/olist_geolocation
# 62.395 MB in 25.5612 seconds (2.441 MB/sec)
sqoop import -Dorg.apache.sqoop.splitter.allow_text_splitter=true --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_geolocation --num-mappers 5 --fetch-size 3000 --split-by geolocation_zip_code_prefix --delete-target-dir --target-dir  /user/jordanetsafack6744/bigdata/input/diamond/text/olist_geolocation
# Transferred 62.395 MB in 22.2204 seconds (2.808 MB/sec)
# Transferred 62.395 MB in 23.2055 seconds (2.6888 MB/sec)
sqoop import -Dorg.apache.sqoop.splitter.allow_text_splitter=true --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_geolocation --num-mappers 3 --fetch-size 3000 --split-by geolocation_zip_code_prefix --delete-target-dir --target-dir  /user/jordanetsafack6744/bigdata/input/diamond/text/olist_geolocation
# Transferred 31.1975 MB in 21.8966 seconds (1.4248 MB/sec)
# Transferred 31.1975 MB in 21.0749 seconds (1.4803 MB/sec)
# Transferred 31.1975 MB in 22.0885 seconds (1.4124 MB/sec)
sqoop import -Dorg.apache.sqoop.splitter.allow_text_splitter=true --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_geolocation --num-mappers 4 --fetch-size 3000 --split-by geolocation_zip_code_prefix --delete-target-dir --target-dir  /user/jordanetsafack6744/bigdata/input/diamond/text/olist_geolocation
# Transferred 31.1975 MB in 21.6668 seconds (1.4399 MB/sec)
# Transferred 31.1975 MB in 22.7131 seconds (1.3735 MB/sec)