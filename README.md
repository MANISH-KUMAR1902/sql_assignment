# mysql_dba
##Configure the Replica:
```sql
# Login to MySQL as root
mysql -u root -p

# Create replication user and grant privileges
CREATE USER 'replication_user'@'replica_ip' IDENTIFIED BY 'replication_password';
GRANT REPLICATION SLAVE ON *.* TO 'replication_user'@'replica_ip';
FLUSH PRIVILEGES;

# Get master status (record position)
SHOW MASTER STATUS;  # Note the File and Position```
```sql
CHANGE MASTER TO MASTER_HOST='Master_IP', 
MASTER_USER='repl_user', 
MASTER_PASSWORD='password', 
MASTER_LOG_FILE='mysql-bin.000001', 
MASTER_LOG_POS=Position_Number;
START SLAVE;
```
