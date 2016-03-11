now=$(date +"%T")
DATE=`date +"%Y-%m-%d"`
USERNAME='root'
PASSWORD='root'
databases=`mysql --user=$USERNAME --password=$PASSWORD -e "SHOW DATABASES;"`
for db in $databases; do
if [ "$db" != "Database" ] && [ "$db" != "information_schema" ] &&  [ "$db" != "mysql" ] && [ "$db" != "performance_schema" ] ; then
FILE=$db-${DATE}@$now.sql
mysqldump --opt --user=${USERNAME} --password=${PASSWORD} ${db} > ${FILE}
echo "Backup Complete For Database $db INSIDE FILE ${FILE}"
fi
done
