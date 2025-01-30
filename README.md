# mysql_dba
##Configure the Replica:
```bash
mysql -u root -p
```
```sql
CHANGE MASTER TO MASTER_HOST='Master_IP', 
MASTER_USER='repl_user', 
MASTER_PASSWORD='password', 
MASTER_LOG_FILE='mysql-bin.000001', 
MASTER_LOG_POS=Position_Number;
START SLAVE;
```
