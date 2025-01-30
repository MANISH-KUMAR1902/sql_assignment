# mysql_dba
##Configure the Replica:
```sql
# Login to MySQL as root
mysql -u root -p
#Replication
CREATE USER 'replication_user'@'192.168.1.20' IDENTIFIED BY 'Replic@2025';
GRANT REPLICATION SLAVE ON *.* TO 'replication_user'@'192.168.1.20';
FLUSH PRIVILEGES;
SHOW MASTER STATUS;  ``

```sql
CHANGE MASTER TO MASTER_HOST='Master_IP', 
MASTER_USER='repl_user', 
MASTER_PASSWORD='password', 
MASTER_LOG_FILE='mysql-bin.000001', 
MASTER_LOG_POS=Position_Number;
START SLAVE;
```
```sql
USE test_db_1;
CREATE TABLE user_details (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(100),
    user_email VARCHAR(100),
    user_phone VARCHAR(15),
    INDEX(user_name),
    UNIQUE KEY(user_email, user_phone)
);

```
