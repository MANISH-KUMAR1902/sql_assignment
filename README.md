# mysql_dba
## Configure the Replica:
```sql
# Login to MySQL as root
mysql -u root -p
#Replication
CREATE USER 'replication_user'@'192.168.1.20' IDENTIFIED BY 'Replic@2025';
GRANT REPLICATION SLAVE ON *.* TO 'replication_user'@'192.168.1.20';
FLUSH PRIVILEGES;
SHOW MASTER STATUS;
```

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


INSERT INTO user_details (user_name, user_email, user_phone) 
VALUES
INSERT INTO user_details (user_name, user_email, user_phone) 
VALUES
INSERT INTO user_details (user_name, user_email, user_phone) 
VALUES
('Aarav', 'aarav@example.com', '9876543210'),
('Vihaan', 'vihaan@example.com', '8765432109'),
('Reyansh', 'reyansh@example.com', '7654321098'),
('Sai', 'sai@example.com', '6543210987'),
('Ishaan', 'ishaan@example.com', '5432109876'),
('Kabir', 'kabir@example.com', '4321098765'),
('Vivaan', 'vivaan@example.com', '3210987654'),
('pk', 'pk@example.com', '2109876543'),
('Atharv', 'atharv@example.com', '1098765432'),
('mk', 'mk@example.com', '0987654321');

CREATE TABLE test_db_2.user_details AS SELECT * FROM test_db_1.user_details;
CREATE TABLE test_db_3.user_details AS SELECT * FROM test_db_1.user_details;

ALTER TABLE test_db_3.user_details ADD COLUMN user_address VARCHAR(255);
 ```
```bash

### 8.backups:
### a. Using mysqldump : take a full backup of all schemas
mysqldump -u root -p --all-databases > full_backup.sql
  
### b. Using mysqldump : take the backup of ONLY ‘schema & table structures’ (without data)
mysqldump -u root -p --no-data --all-databases > schema_backup.sql

### c. Using percona xtrabackup : take a full backup of all schemas
xtrabackup --backup --target-dir=/var/backups/full_backup

### 9. Restorations:
### a. Restore the backup taken in point 8.a
  
mysql -u root -p < full_backup.sql
  
### b. Restore the backup taken in point 8.b
mysql -u root -p < schema_backup.sql
### c. Restore the backup taken in point 8.c
sudo xtrabackup --prepare --target-dir=/path/to/backup_dir
sudo xtrabackup --copy-back --target-dir=/path/to/backup_dir

### a. Create a ‘my.cnf’ file -
### Briefly explain all the critical parameters which you defined in this my.cnf file.

The my.cnf file is the primary configuration file for MySQL/MariaDB. It allows database administrators to control the server behavior, performance, security, and backup settings.



```
