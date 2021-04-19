## Prerequisites

- JDK 1.8
- Intellij IDEA
- Docker

## Run some DBMS on Docker
Execute `docker.bat` file to run MySQL, PostgreSQL, Microsoft SQL, H2 Database containers.
We will obtain containers:

| Database type | Tenant name | Port | Db username | Password |
| --- | --- | --- | --- | --- |
| PostgreSQL | tenant1 | 33062 | postgres | find in docker.bat |
| PostgreSQL | tenant2 | 33062 | postgres | find in docker.bat |
| MySQL | tenant3 | 33061 | root | find in docker.bat |
| H2 Database | tenant4 | 33063 | sa | find in docker.bat |
| Microsoft SQL | tenant5 | 33064 | SA | find in docker.bat |

## Create master database
Master database contains configurations to connect tenant databases.

This project use PostgreSQL to store master database. So access to PostgreSQL container and create `db_style` database. After that create config table 
and insert data by [master-postgres.sql](./src/main/resources/master-postgres.sql) file.

## Create tenant database
We also access every container on the below table to create database (e.g create tenant4 database in H2 container). After that we alse create city table. Please follow sql scripts.

| Database type | Database name | Script |
| --- | --- | --- |
| PostgreSQL | tenant1 | [script](./src/main/resources/tenant1-postgres.sql) |
| PostgreSQL | tenant2 | [script](./src/main/resources/tenant2-postgres.sql) |
| MySQL | tenant3 | [script](./src/main/resources/tenant3-mysql.sql) |
| H2 Database | tenant4 |[script](./src/main/resources/tenant4-h2db.sql) |
| Microsoft SQL | tenant5 | [script](./src/main/resources/tenant5-mssql.sql) |



 