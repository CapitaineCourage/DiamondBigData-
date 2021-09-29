# to do
# breve recherche sur l'outils sqoop
# consulter le nombre de commande (de la table ) ayant un prix supérieur à 20. (sqoop eval)
sqoop eval --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser  --password NHkkP876rp --query "SELECT count(*) Ad NoFROM olist_order_items WHERE price > 20"
# inporter toutes les tables au format ORC (sqoop import)

sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_customers -m 1 --delete-target-dir --target-dir  /user/jordanetsafack6744/bigdata/input/diamond/olist_customers --as-parquetfile

### 1 importer les données de ma base Mysql vers une table Hive cible
	# sqoop list-databases --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp
	hive -e "select count(*) from retail_db.olist_customers;"
	# importation de la table olist_customers to hive olist_customers 
	sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_customers -m 1 --delete-target-dir --hive-import --hive-database retail_db --hive-table olist_customers --hive-overwrite
	# importation de la table olist_geolocation to hive olist_geolocation
	sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_geolocation -m 1 --delete-target-dir --hive-import --hive-database retail_db --hive-table olist_geolocation --hive-overwrite
	# importation de la table olist_order_items to hive olist_order_items
	sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_order_items -m 1 --delete-target-dir --hive-import --hive-database retail_db --hive-table olist_order_items --hive-overwrite
	# importation de la table olist_order_payments to hive olist_order_payments
	sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_order_payments -m 1 --delete-target-dir --hive-import --hive-database retail_db --hive-table olist_order_payments --hive-overwrite
	# importation de la table olist_order_reviews to hive olist_order_reviews
	sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_order_reviews -m 1 --delete-target-dir --hive-import --hive-database retail_db --hive-table olist_order_reviews --hive-overwrite
	# importation de la table olist_orders to hive olist_orders
	sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_orders -m 1 --delete-target-dir --hive-import --hive-database retail_db --hive-table olist_orders --hive-overwrite
	# importation de la table olist_products to hive olist_products
	sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_products -m 1 --delete-target-dir --hive-import --hive-database retail_db --hive-table olist_products --hive-overwrite
	# importation de la table olist_sellers to hive olist_sellers
	sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_sellers -m 1 --delete-target-dir --hive-import --hive-database retail_db --hive-table olist_sellers --hive-overwrite
	# importation de la table product_category_name_translation to hive product_category_name_translation
	sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table product_category_name_translation -m 1 --delete-target-dir --hive-import --hive-database retail_db --hive-table product_category_name_translation --hive-overwrite
	
### 2 ingestion_diamond_sio_tuned.sh 
	# faire varier les différents parametres et observer les performences de mapred
	les parametres à faire varier pour observer une amélioration de mapred sont : 
	* le nombre de mapred (-m 1 | --num-mappers 2,3..n)
	* le paramètre --split-by nom_de_la_colonne
	* le paramètre --direct qui corespond à une intégration des donné en mode "rapide"
	* le paramètre --fetch-size qui corespond à la taille de découpage de la table (--fetch-size 500,1000...n)
### 3 copier les fichiers dataset sur HDFS (commande HDFS)
	hadoop fs -copyFromLocal /home/jordanetsafack6744/bigdata/datasets/diamond/* /user/jordanetsafack6744/bigdata/input/diamond/tmp
	hadoop fs -ls /user/jordanetsafack6744/bigdata/input/diamond/tmp
	done
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
	done
### 2 consulter le schéma de la table hive olist_geolocation
	hive -e "USE diamond_landing_layer; DESCRIBE FORMATTED olist_geolocation ;" # col_name              data_type               comment
	#affiche le nom des colonnes de la table hive olist_geolocation avec leur type
	2.1 consulter les tables de la base diamond_landing_layer
	hive -e "USE diamond_landing_layer; SHOW TABLES;" | hive -e "SHOW TABLES IN diamond_landing_layer;"
	2.2 consulter les colonnes de la table hive olist_geolocation
	hive -e "SHOW COLUMNS IN olist_geolocation FROM diamond_landing_layer" # montre les colonnes sans le detail de type
	done
### 3 acceder/consulter au/le repertoire HDFS ou sont stocqués les données de la table hive olist_geolocation
	hive -e "USE diamond_landing_layer; DESCRIBE FORMATTED olist_geolocation ;"
	#result = hdfs://cxln1.c.thelab-240901.internal:8020/apps/hive/warehouse/diamond_landing_layer.db/olist_geolocation
	done
### 4 Consulter le nombre de lignes de la table olist_geolocation
	hive -e "USE diamond_landing_layer; SELECT count(*) FROM olist_geolocation;"
	done
### 5 consulter le nombre de villes par Etat des cette table (noter le temps d'exécution de cette commande)
		hive -e "USE diamond_landing_layer; SELECT geolocation_state, count(geolocation_city) AS cities FROM olist_geolocation GROUP BY geolocation_state;"
		Time taken: 36.821 seconds, Fetched: 30 row(s)
		Time taken: 23.428 seconds, Fetched: 30 row(s)
		Time taken: 23.51 seconds, Fetched: 30 row(s)
		Time taken: 22.511 seconds, Fetched: 30 row(s)
	done
### 6 Qu'es ce qu'une table parttionné sur Hive ? | créer une table hive olist_geolocation_partitioned parttionné par "geolocation_state" puis alimenter cette table avec le conteue de la table olist_geolocation	
	hive -e "USE diamond_landing_layer; CREATE TABLE olist_geolocation_partitioned(geolocation_zip_code_prefix int, geolocation_lat decimal(9,2), geolocation_lng decimal(9,2), geolocation_city VARCHAR(255)) PARTITIONED BY (geolocation_state VARCHAR(255));"
	hive set hive.exec.dynamic.partition=true;    
	hive set hive.exec.dynamic.partition.mode=nonstrict;  
	USE diamond_landing_layer; INSERT INTO olist_geolocation_partitioned PARTITION(geolocation_state) SELECT * FROM olist_geolocation dual;
	SELECT * FROM olist_geolocation_partitioned LIMIT 4; # LIMIT est une syntaxe Mysql. Oracle et Sql Server ont un chancun sa syntaxe
### 7 consigne de la question 5 avec la table olist_geolocation_partitioned
	hive -e "USE diamond_landing_layer; SELECT geolocation_state, count(geolocation_city) AS cities FROM olist_geolocation_partitioned GROUP BY geolocation_state;"
	Time taken: 25.906 seconds, Fetched: 30 row(s)
	Time taken: 23.523 seconds, Fetched: 30 row(s)
	Time taken: 24.814 seconds, Fetched: 30 row(s)
	Time taken: 21.625 seconds, Fetched: 30 row(s)
	done
### 8 consulter le repertoire HDFS ou sont stocqués les données de la table olist_geolocation_partitioned
	hive -e "USE diamond_landing_layer; DESCRIBE FORMATTED olist_geolocation_partitioned ;"
	#result = hdfs://cxln1.c.thelab-240901.internal:8020/apps/hive/warehouse/diamond_landing_layer.db/olist_geolocation_partitioned
	hdfs dfs -ls hdfs://cxln1.c.thelab-240901.internal:8020/apps/hive/warehouse/diamond_landing_layer.db/olist_geolocation_partitioned
	Quelle est la différence entre olist_geolocation_partitioned et olist_geolocation ?
	# On constate que le repertoie est subdivisé en 30 repertoires corespondant aux différents Etats
	done
### 9 Qu'es ce qu'une table avec des bucketes ? | Comment créer une table avec des bucketes ?
	créer une table hive olist_geolocation_bucketed qui est une table pocedant la même structure que la tabe olist_geolocation à la différence qu\'elle est bucketisée sur 12 BUCKETS par la colonne geolocation_zip_code_prefix
	hive -e "USE diamond_landing_layer; CREATE TABLE olist_geolocation_bucketed(geolocation_zip_code_prefix int, geolocation_lat double, geolocation_lng double, geolocation_city VARCHAR(255), geolocation_state VARCHAR(255)) CLUSTERED BY (geolocation_zip_code_prefix) INTO 12 BUCKETS;"
	# alimenter cette table avec le contenue de la table olist_geolocation
	hive -e "USE diamond_landing_layer; INSERT INTO olist_geolocation_bucketed SELECT * FROM olist_geolocation;"
	#Time taken: 42.983 seconds
	hive -e "USE diamond_landing_layer; SELECT * FROM olist_geolocation_bucketed LIMIT 15;"
	done
### 10 consigne de la question 5 avec la table olist_geolocation_bucketed
	hive -e "USE diamond_landing_layer; SELECT geolocation_state, count(geolocation_city) AS cities FROM olist_geolocation_bucketed GROUP BY geolocation_state;"
	Time taken: 25.579 seconds, Fetched: 30 row(s)
	Time taken: 24.502 seconds, Fetched: 30 row(s)
	Time taken: 23.52 seconds, Fetched: 30 row(s)
	Time taken: 24.562 seconds, Fetched: 30 row(s)
	done
### 11 consulter le repertoire HDFS ou sont stocqués les données de la table olist_geolocation_bucketed
	hive -e "USE diamond_landing_layer; DESCRIBE FORMATTED olist_geolocation_bucketed ;"
	# result = hdfs://cxln1.c.thelab-240901.internal:8020/apps/hive/warehouse/diamond_landing_layer.db/olist_geolocation_bucketed
	Quelle est la différence entre olist_geolocation_bucketed et olist_geolocation 
	# hdfs dfs -ls hdfs://cxln1.c.thelab-240901.internal:8020/apps/hive/warehouse/diamond_landing_layer.db/olist_geolocation_bucketed 
	# On constate que le repertoire de stockage est subdivisé en 12, avec des indices partans de 0 à 11
	done
### 12 créer une table avec des bucketes et des partitions comme spécifier ci-dessus (olist_geolocation_bucketed_partitioned)
	hive -e "USE diamond_landing_layer; CREATE TABLE olist_geolocation_bucketed_partitioned(geolocation_zip_code_prefix int, geolocation_lat double, geolocation_lng double, geolocation_city VARCHAR(255)) PARTITIONED BY (geolocation_state VARCHAR(255)) CLUSTERED BY (geolocation_zip_code_prefix) INTO 12 BUCKETS;"
	hive -e "USE diamond_landing_layer; INSERT INTO olist_geolocation_bucketed_partitioned PARTITION(geolocation_state) SELECT * FROM olist_geolocation;"
	Time taken: 56.297 seconds
	# consulter le nombre de villes par Etat des cette table (noter le temps d'exécution de cette commande)
	hive -e "USE diamond_landing_layer; SELECT geolocation_state, count(geolocation_city) AS cities FROM olist_geolocation_bucketed_partitioned GROUP BY geolocation_state;"
	Time taken: 24.815 seconds, Fetched: 30 row(s) # il semblerai qu'on ai une amélioration du temps de réponse
	# acceder/consulter au/le repertoire HDFS ou sont stocqués les données de la table hive olist_geolocation
	hive -e "USE diamond_landing_layer; DESCRIBE FORMATTED olist_geolocation_bucketed_partitioned ;"
	# result = hdfs://cxln1.c.thelab-240901.internal:8020/apps/hive/warehouse/diamond_landing_layer.db/olist_geolocation_bucketed_partitioned
	hdfs dfs -ls hdfs://cxln1.c.thelab-240901.internal:8020/apps/hive/warehouse/diamond_landing_layer.db/olist_geolocation_bucketed_partitioned
	done
### 13 quelle dfference il y a t'il entre les cmd hdfs dfs -put et hdfs dfs -copyfromlocal
	copyFromLocal est similaire à la commande put, sauf que la source est restreinte à une référence de fichier local.
	Donc, fondamentalement, on peut faire avec put, tout ce que vous faites avec copyFromLocal, mais pas l\'inverse.
	Prenons un exemple: Si votre HDFS contient le chemin: /tmp/dir/abc.txt Et si votre disque local contient également ce chemin, l’API hdfs ne saura pas lequel vous voulez dire, à moins que vous ne spécifiiez un schéma comme file:// ou hdfs:// . Peut-être que cela choisit le chemin que vous ne vouliez pas copier.
	Donc vous avez -copyFromLocal qui vous empêche de copier accidentellement le mauvais fichier en limitant le paramètre que vous donnez au système de fichiers local.
	Put est destiné aux utilisateurs plus avancés qui savent quel schéma mettre en avant. 
	Il est toujours un peu déroutant pour les nouveaux utilisateurs Hadoop de savoir dans quel système de fichiers ils se trouvent et où se trouvent réellement leurs fichiers.
### 14 qu'es ce que l'architechture Hadoop Higth avaibility
### 15 quelle est la commande pour determiner le block size sur HDFS
	hadoop fs -stat "type:%F %u:%g block size :(%o) mtime:%y atime:%x name:%n" /user/jordanetsafack6744/bigdata/input/diamond/tmp/olist_customers_dataset.csv
	#Print statistics about the file/directory at <path> in the specified format. Format accepts permissions in octal (%a) and symbolic (%A), 
	#filesize in bytes (%b), type (%F), group name of owner (%g), name (%n), block size (%o), replication (%r), 
	#user name of owner(%u), access date(%x, %X), and modification date (%y, %Y). %x and %y show UTC date as “yyyy-MM-dd HH:mm:ss”
	done
### 16 quelle est la diff entre les cmd hdfs dfs -du et hdfs dfs -ls
	la cmd hdfs dfs -ls affiche les droits assoicié aux fichier ainsi que la date de création du fichier 
	done
### 17 quelle est la cmd pour determinter le nombre de block non repliqué sur HDFS
	hadoop fs -stat "type:%F %u:%g replication:%r name:%n" /user/jordanetsafack6744/bigdata/input/diamond/tmp/olist_customers_dataset.csv
	done
### 18 cmd pour consulter les derniers enregistrements d'un ficher
	hadoop fs -tail /user/jordanetsafack6744/bigdata/input/diamond/tmp/olist_customers_dataset.csv
	done
### 19 Déterminer les colonnes de ref temporel de chaque table

### 20 créer un fichier ingestion_diamond_sio_hive_query.sh
	contenant les cmd d\'import sqoop avec l\'option --query vers les tables hive;
	la requete dans --query ne doit ingérer que les données d\'une certaine date 
### 21 Diff entre Hive 2 et Hive 3
	Deux nouveaux connecteurs sont disponibles pour les tables externes :
	Le connecteur JDBC (JdbcStorageHandler), qui est en lecture seule pour le moment. Il vous permet de lire/importer facilement des données depuis l’une des bases de données prises en charge : MySQL, PostgreSQL, Oracle, MSSQL et Apache Derby.
	Le connecteur Kafka, qui peut être utilisé pour requêter des données en temps réel à partir de Apache Kafka, et qui permet également l’insertion de données en temps réel vers Hive avec une garantie “exactly-once” et la transformation de données en temps réel ! Voir Integrating Hive and Kafka pour plus de détails.

	La deuxième version de Hive ACID comporte plusieurs améliorations :

	Des performances aussi bonnes que les tables non-ACID ;
	Les tables transactionnelles (tables supportant les opérations ACID) ne doivent plus être obligatoirement bucketées ;
	La prise en charge des formats non-ORC pour les opérations INSERT/SELECT ;
	La compatibilité avec les fournisseurs de stockage Cloud, par exemple Amazon S3;
	La nouvelle API HiveStreaming (v2).
### 22 Apache Oozie
### 23 lister les différents workflows Oozie
	Starting a Workflow, Coordinator or Bundle Job
	Suspending a Workflow, Coordinator or Bundle Job
	Resuming a Workflow, Coordinator or Bundle Job
	Killing a Workflow, Coordinator or Bundle Job   
	Changing endtime/concurrency/pausetime of a Coordinator Job
	Rerunning a Workflow Job
	Rerunning a Coordinator Action or Multiple Actions
	Rerunning a Bundle Job
	Checking the Status of a Workflow, Coordinator or Bundle Job or a Coordinator Action
	Dryrun of Coordinator Job
	Dryrun of Workflow Job
### 24 Lister les différentes actions Oozie

### 25 ecrire un exemple de workflows Oozie pour le lancement d'un shell
	oozie job -oozie /home/jordanetsafack6744/arnaud/workspace/DiamondBigData-/bigdata-dev/arnaud/appli/diamond/shell/ingestion_diamond_sio.sh -start /home/jordanetsafack6744/arnaud/workspace/DiamondBigData-/bigdata-dev/arnaud/appli/diamond/shell/ingestion_diamond_sio.sh
### 26 Quelle est la différence entre HDP(Hortonworks) et CDH de Cloudera et CDP 
	

olist_customers
olist_geolocation
olist_order_items
olist_order_payments
olist_order_reviews
olist_orders
olist_products
olist_sellers
product_category_name_translation

# Min Date :
	select MIN(order_purchase_timestamp) from olist_orders;
	2016-09-04 21:15:19.0

# Max Date : Je n_ai pas utiliser la fonction MAX() parce que NULL est la date MAX içi
	select order_purchase_timestamp from olist_orders ORDER BY order_purchase_timestamp DESC LIMIT 15;
	2018-10-17 17:30:18.0

# Difference between NOW and MIN Date
	SELECT DATEDIFF(current_date,'2016-09-04');
	1849 jours

# debut de requete : recuperation du premier jour de mon process
	SELECT (current_date -INTERVAL '1849' DAY);
	2016-09-04 00:00:00

# recupération du client et de la premier date de commande
	select customer_id from olist_orders WHERE order_purchase_timestamp = '2016-09-04';
	-- SELECT (current_date -INTERVAL '1849' DAY);


	SELECT * IN olist_orders FROM diamond_landing_layer;
	USE diamond_landing_layer; SELECT * FROM olist_orders LIMIT 5;
select * from olist_orders WHERE 

SHOW COLUMNS IN olist_orders;

select * from olist_customers WHERE customer_id = (select customer_id from olist_orders WHERE order_purchase_timestamp <= (current_date -INTERVAL '1849' DAY));

sqoop eval --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser  --password NHkkP876rp --query "select * from olist_orders WHERE order_purchase_timestamp <= (current_date -INTERVAL '1848' DAY) AND order_purchase_timestamp!= '0000-00-00 00:00:00'";
select * from olist_orders WHERE order_purchase_timestamp <= (current_date -INTERVAL '1848' DAY) AND order_purchase_timestamp!= '0000-00-00 00:00:00';

mysql -h cxln2.c.thelab-240901.internal -u sqoopuser --password=NHkkP876rp -D retail_db -e "select * from olist_orders WHERE order_purchase_timestamp <= (current_date -INTERVAL '1848' DAY);" AND order_purchase_timestamp!= '0000-00-00 00:00:00'

select p.* from olist_products p, s.* from olist_sellers s 


