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

```sql
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

ALTER TABLE test_db_3.user_details ADD COLUMN user_address VARCHAR(255); ```

