# to do
# afficher le nom du script en cours d'exécution
#!/bin/bash
echo $0
# récupérer la date de début d'exécution 
startime = echo $date -u

mysql -h <hostname> -u <jordanetsafack6744> --password= 21K1V8IL2 -D <database> -e 'source <path-to-sql-file>'
mysql -h cxln2.c.thelab-240901.internal -u sqoopuser --password=NHkkP876rp -D retail_db -e '../sql/oneshot/ddl_diamod_sio.sql'
# récuperer la date de fin d'exécution du sql
endtime = echo "$end"
# afficher la duré du traitement
echo time ls -l

# rediriger les logs dans un fichier log le fichier vas porter le nom du sh_timestamp.log (à stoquer dans logapp)
LOG_FILE=sh_timestamp.log 
#exec $LOG_FILE

# faire une copie d'un fichier datset de HDFS vers le système de fichier local (commande HDFS)

# # cosulter la taille des fichiers copiés sur HDFS (commande HDFS)

# noter le temps d'excession des imports (text/parquetfile)
# job_id=getId()
# mapred job -status job_1627727389933_7462 | grep "CPU time"

# Path filePath = ((FileSplit) context.getInputSplit()).getPath();
# String filePathString = ((FileSplit) context.getInputSplit()).getPath().toString();

# comparer les tailles entres les differents imports 


