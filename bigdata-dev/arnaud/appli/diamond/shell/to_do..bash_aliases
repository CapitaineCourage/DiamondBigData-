# to do
# breve recherche sur l'outils sqoop
# consulter le nombre de commande (de la table ) ayant un prix supérieur à 20. (sqoop eval)
sqoop eval --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser  --password NHkkP876rp --query "SELECT count(*) Ad NoFROM olist_order_items WHERE price > 20"
 
# inporter toutes les tables une à une au format ORC (sqoop import)
sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_customers -m 1 --delete-target-dir --target-dir  /user/jordanetsafack6744/bigdata/input/diamond/olist_customers --as-parquetfile

# importer toutes les tables dans une table cible Hive (sqoop import)
sqoop import --connect jdbc:mysql://cxln2.c.thelab-240901.internal/retail_db --username sqoopuser --password NHkkP876rp --table olist_customers --num-mappers 1 --hcatalog-database h_retail_db --hcatalog-table h_olist_customers --create-hcatalog-table --hcatalog-storage-stanza "stored as olist_customers orcfile"

# copier les fichiers dataset sur HDFS (commande HDFS)

# Afficher le contenu d'un des fichiers HDFS copié (commande HDFS)
# faire une copie d'un fichier datset de HDFS vers le système de fichier local (commande HDFS)
