# to do
# breve recherche sur l'outils sqoop
# consulter le nombre de commande (de la table ) ayant un prix supérieur à 20. (sqoop eval)
sqoop eval --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser  --password NHkkP876rp --query "SELECT count(*) Ad NoFROM olist_order_items WHERE price > 20"
# inporter toutes les tables au format ORC (sqoop import)

sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_customers -m 1 --delete-target-dir --target-dir  /user/jordanetsafack6744/bigdata/input/diamond/olist_customers --as-parquetfile

### 1 importer les données de ma base Mysql vers une table Hive cible
	# sqoop list-databases --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp
	hive -e "select count(*) from retail_db.h_olist_customers;"
	# importation de la table olist_customers to hive h_olist_customers 
	sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_customers -m 1 --delete-target-dir --hive-import --hive-database retail_db --hive-table h_olist_customers --hive-overwrite
	# importation de la table olist_geolocation to hive h_olist_geolocation
	sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_geolocation -m 1 --delete-target-dir --hive-import --hive-database retail_db --hive-table h_olist_geolocation --hive-overwrite
	# importation de la table olist_order_items to hive h_olist_order_items
	sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_order_items -m 1 --delete-target-dir --hive-import --hive-database retail_db --hive-table h_olist_order_items --hive-overwrite
	# importation de la table olist_order_payments to hive h_olist_order_payments
	sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_order_payments -m 1 --delete-target-dir --hive-import --hive-database retail_db --hive-table h_olist_order_payments --hive-overwrite
	# importation de la table olist_order_reviews to hive h_olist_order_reviews
	sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_order_reviews -m 1 --delete-target-dir --hive-import --hive-database retail_db --hive-table h_olist_order_reviews --hive-overwrite
	# importation de la table olist_orders to hive h_olist_orders
	sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_orders -m 1 --delete-target-dir --hive-import --hive-database retail_db --hive-table h_olist_orders --hive-overwrite
	# importation de la table olist_products to hive h_olist_products
	sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_products -m 1 --delete-target-dir --hive-import --hive-database retail_db --hive-table h_olist_products --hive-overwrite
	# importation de la table olist_sellers to hive h_olist_sellers
	sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_sellers -m 1 --delete-target-dir --hive-import --hive-database retail_db --hive-table h_olist_sellers --hive-overwrite
	# importation de la table product_category_name_translation to hive h_product_category_name_translation
	sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table product_category_name_translation -m 1 --delete-target-dir --hive-import --hive-database retail_db --hive-table h_product_category_name_translation --hive-overwrite
	
### 2 ingestion_diamond_sio_tuned.sh 
	# faire varier les différents parametres et observer les performences de mapred

### 3 copier les fichiers dataset sur HDFS (commande HDFS)
	hadoop fs -copyFromLocal /home/jordanetsafack6744/bigdata/datasets/diamond/* /user/jordanetsafack6744/bigdata/input/diamond/tmp
	hadoop fs -ls /user/jordanetsafack6744/bigdata/input/diamond/tmp
### 4 Afficher le contenu d'un des fichiers HDFS copié (commande HDFS)
	hadoop fs -cat /user/jordanetsafack6744/bigdata/input/diamond/tmp/olist_customers_dataset.csv
	done

### 5 faire une copie d'un fichier datset de HDFS vers le système de fichier local (commande HDFS)
	hadoop fs -copyToLocal /user/jordanetsafack6744/bigdata/input/diamond/tmp/* /home/jordanetsafack6744/bigdata/datasets/diamond/
	done less /home/jordanetsafack6744/bigdata/datasets/local/olist_customers_dataset.csv 
### 6 cosulter la taille des fichiers copiés sur HDFS (commande HDFS)
	hadoop fs -du -s -h /user/jordanetsafack6744/bigdata/input/diamond/tmp/*
	done

## HIVE 
### 1 créer le fichier ingestion_diamond_sio_hive.sh
	contien les imports des données sources depuis le SIO (Mysql) vers hive : la base de donée cible est : "diamond_landing_layer"
	hive -e "CREATE DATABASE IF NOT EXISTS diamond_landing_layer;"
### 2 consulter le schéma de la table hive h_olist_geolocation
### 3 acceder/consulter au/le repertoire HDFS ou sont stocqués les données de la table hive h_olist_geolocation
### 4 Consulter le nombre de lignes de la table h_olist_geolocation
### 5 consulter le nombre de villes par Etat des cette table (noter le temps d'exécution de cette commande)
### 6 Qu'es ce qu'une tale parttionné sur Hive ?  
	comment la crée t\'elle ?
	créer une table hive h_olist_geolocation_partitioned 
	qui est une table pocedant la même structure que la tabe h_olist_geolocation à la différence qu'elle est parttionné par l'Etat 
	puis alimenter cette table avec le conteue de la table h_olist_geolocation
### 7 consigne de la question 5 avec la table h_olist_geolocation_partitioned
### 8 consulter le repertoire HDFS ou sont stocqués les données de la table h_olist_geolocation_partitioned
	Quelle est la différence entre h_olist_geolocation_partitioned et h_olist_geolocation	
	h_olist_geolocation_partitioned est stocqué en plusieur repertoire parttionée selon la maille 
### 9 Qu'es ce qu'une table avec des bucketes ?
	Comment créer une table avec des bucketes ?
	créer une table hive h_olist_geolocation_bucketed 
	qui est une table pocedant la même structure que la tabe h_olist_geolocation à la différence qu\'elle est bucketisée sur 12 bukete par la colonne geolocation_zip_code_prefix 
	puis alimenter cette table avec le conteue de la table h_olist_geolocation_bucketed
### 10 consigne de la question 5 avec la table h_olist_geolocation_bucketed
### 11 consulter le repertoire HDFS ou sont stocqués les données de la table h_olist_geolocation_bucketed
	Quelle est la différence entre h_olist_geolocation_bucketed et h_olist_geolocation 

### 12 créer une table avec des bucketes et des partitions comme spécifier ci-dessus (h_olist_geolocation_bucketed_partitioned)
	# consulter le nombre de villes par Etat des cette table (noter le temps d'exécution de cette commande)
	# acceder/consulter au/le repertoire HDFS ou sont stocqués les données de la table hive h_olist_geolocation

### 13 quelle dfference il y a t'il entre les cmd hdfs dfs -put et hdfs dfs -copyfromlocal
	copyFromLocal est similaire à la commande put, sauf que la source est restreinte à une référence de fichier local.
	Donc, fondamentalement, on peut faire avec put, tout ce que vous faites avec copyFromLocal, mais pas l\'inverse.
	Prenons un exemple: Si votre HDFS contient le chemin: /tmp/dir/abc.txt Et si votre disque local contient également ce chemin, l’API hdfs ne saura pas lequel vous voulez dire, à moins que vous ne spécifiiez un schéma comme file:// ou hdfs:// . Peut-être que cela choisit le chemin que vous ne vouliez pas copier.
	Donc vous avez -copyFromLocal qui vous empêche de copier accidentellement le mauvais fichier en limitant le paramètre que vous donnez au système de fichiers local.
	Put est destiné aux utilisateurs plus avancés qui savent quel schéma mettre en avant. 
	Il est toujours un peu déroutant pour les nouveaux utilisateurs Hadoop de savoir dans quel système de fichiers ils se trouvent et où se trouvent réellement leurs fichiers.
### 14 qu'es ce que l'architechture Hadoop Higth avaibility
### 15 quelle est la commande pour determiner le block size sur HDFS
	hadoop fs -stat %o -ls /user/jordanetsafack6744/bigdata/input/diamond/tmp/olist_customers_dataset.csv
	hadoop fs -ls /user/jordanetsafack6744/bigdata/input/diamond/tmp/
### 16 quelle est la diff entre les cmd hdfs dfs -du et hdfs dfs -ls
	la cmd hdfs dfs -ls affiche les droits assoicié aux fichier ainsi que la date de création du fichier 
	done
### quelle est la cmd pour determinter le nombre de block non repliqué sur HDFS 