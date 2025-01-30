```sql
CREATE DATABASE test_db_1;
CREATE DATABASE test_db_2;
CREATE DATABASE test_db_3;

USE test_db_1;

CREATE TABLE user_details (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  user_name VARCHAR(100),
  user_email VARCHAR(100),
  user_phone VARCHAR(15),
  INDEX (user_name),
  UNIQUE KEY (user_email, user_phone)
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

'''Full Backup of All Schemas'''
mysqldump -u root -p --all-databases > full_backup.sql
  
''' Backup Schema & Table Structures (Without Data)'''
mysqldump -u root -p --no-data --all-databases > schema_backup.sql

'''Full Backup Using Percona Xtrabackup'''
xtrabackup --backup --target-dir=/var/backups/full_backup

Restorations
'Restore Backup from ful_backup'
  
mysql -u root -p < full_backup.sql
  
' Restore Backup without data'
mysql -u root -p < schema_backup.sql
  
'Restore Xtrabackup
Prepare the backup: '
xtrabackup --prepare --target-dir=/var/backups/full_backup
  
'Restore the backup:'
xtrabackup --copy-back --target-dir=/var/backups/full_backup

  'Set correct permissions:'
chown -R mysql:mysql /var/lib/mysql



```

