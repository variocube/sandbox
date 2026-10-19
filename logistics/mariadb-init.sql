-- Runs once, when the MariaDB volume is created; the center database and user come from the MARIADB_* variables.
CREATE DATABASE logistics;
CREATE USER 'logistics'@'%' IDENTIFIED BY 'logistics';
GRANT ALL ON logistics.* TO 'logistics'@'%';
