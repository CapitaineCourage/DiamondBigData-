
#Nonbre de lignes de olist_customers :
sqoop eval --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser  --password NHkkP876rp --query "SELECT count(*) FROM olist_customers"
# importation de la table olist_customers au format text
sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_customers -m 1 --delete-target-dir --target-dir  /user/jordanetsafack6744/bigdata/input/diamond/text/olist_customers

#Nonbre de lignes de olist_geolocation :
sqoop eval --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser  --password NHkkP876rp --query "SELECT count(*) FROM olist_geolocation"
# importation de la table olist_geolocation au format text
sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_geolocation -m 1 --delete-target-dir --target-dir  /user/jordanetsafack6744/bigdata/input/diamond/text/olist_geolocation

#Nonbre de lignes de olist_order_items :
sqoop eval --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser  --password NHkkP876rp --query "SELECT count(*) FROM olist_order_items"
# importation de la table olist_order_items au format text
sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_order_items -m 1 --delete-target-dir --target-dir  /user/jordanetsafack6744/bigdata/input/diamond/text/olist_order_items
 
#Nonbre de lignes de olist_order_payments :
sqoop eval --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser  --password NHkkP876rp --query "SELECT count(*) FROM olist_order_payments"
# importation de la table olist_order_payments au format text
sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_order_payments -m 1 --delete-target-dir --target-dir  /user/jordanetsafack6744/bigdata/input/diamond/text/olist_order_payments

#Nonbre de lignes de olist_order_reviews :
sqoop eval --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser  --password NHkkP876rp --query "SELECT count(*) FROM olist_order_reviews"
# importation de la table olist_order_reviews au format text
sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_order_reviews -m 1 --delete-target-dir --target-dir  /user/jordanetsafack6744/bigdata/input/diamond/text/olist_order_reviews

#Nonbre de lignes de olist_orders :
sqoop eval --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser  --password NHkkP876rp --query "SELECT count(*) FROM olist_orders"
# importation de la table olist_orders au format text
sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_orders -m 1 --delete-target-dir --target-dir  /user/jordanetsafack6744/bigdata/input/diamond/text/olist_orders

#Nonbre de lignes de olist_products :
sqoop eval --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser  --password NHkkP876rp --query "SELECT count(*) FROM olist_products"
# importation de la table olist_products au format text
sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_products -m 1 --delete-target-dir --target-dir  /user/jordanetsafack6744/bigdata/input/diamond/text/olist_products

#Nonbre de lignes de olist_sellers :
sqoop eval --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser  --password NHkkP876rp --query "SELECT count(*) FROM olist_sellers"
# importation de la table olist_sellers au format text
sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_sellers -m 1 --delete-target-dir --target-dir  /user/jordanetsafack6744/bigdata/input/diamond/text/olist_sellers

#Nonbre de lignes de product_category_name_translation :
sqoop eval --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser  --password NHkkP876rp --query "SELECT count(*) FROM product_category_name_translation"
# importation de la table product_category_name_translation au format text
sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table product_category_name_translation -m 1 --delete-target-dir --target-dir  /user/jordanetsafack6744/bigdata/input/diamond/text/product_category_name_translation

# cosulter la taille des fichiers copiés sur HDFS (commande HDFS)
$HADOOP_HOME/bin/hadoop fs -cat /user/jordanetsafack6744/bigdata/input/diamond/olist_customers/part-m-*


# noter le temps d'excession des imports (text/parquetfile)
# comparer les tailles entres les differents imports 
# ingestion_diamond_sio_tuned.sh 

