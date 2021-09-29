#!/bin/bash
### 1 importer les données de ma base Mysql "retail_db" vers une table Hive cible
	# importation de la table olist_customers to hive "diamond_landing_layer.olist_customers"
	sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_customers -m 1 --delete-target-dir --hive-import --hive-database diamond_landing_layer --hive-table olist_customers --hive-overwrite
	# importation de la table olist_geolocation to hive olist_geolocation
	sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_geolocation -m 1 --delete-target-dir --hive-import --hive-database diamond_landing_layer --hive-table olist_geolocation --hive-overwrite
	# importation de la table olist_order_items to hive olist_order_items
	sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_order_items -m 1 --delete-target-dir --hive-import --hive-database diamond_landing_layer --hive-table olist_order_items --hive-overwrite
	# importation de la table olist_order_payments to hive olist_order_payments
	sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_order_payments -m 1 --delete-target-dir --hive-import --hive-database diamond_landing_layer --hive-table olist_order_payments --hive-overwrite
	# importation de la table olist_order_reviews to hive olist_order_reviews
	sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_order_reviews -m 1 --delete-target-dir --hive-import --hive-database diamond_landing_layer --hive-table olist_order_reviews --hive-overwrite
	# importation de la table olist_orders to hive olist_orders
	sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_orders -m 1 --delete-target-dir --hive-import --hive-database diamond_landing_layer --hive-table olist_orders --hive-overwrite
	# importation de la table olist_products to hive olist_products
	sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_products -m 1 --delete-target-dir --hive-import --hive-database diamond_landing_layer --hive-table olist_products --hive-overwrite
	# importation de la table olist_sellers to hive olist_sellers
	sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_sellers -m 1 --delete-target-dir --hive-import --hive-database diamond_landing_layer --hive-table olist_sellers --hive-overwrite
	# importation de la table product_category_name_translation to hive product_category_name_translation
	sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table product_category_name_translation -m 1 --delete-target-dir --hive-import --hive-database diamond_landing_layer --hive-table product_category_name_translation --hive-overwrite