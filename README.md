## Prerequisites

- JDK 1.8
- Intellij IDEA
- Docker

## Setup
### Run some DBMS on Docker
Execute `docker.bat` file to run MySQL, PostgreSQL, Microsoft SQL, H2 Database containers.
We will obtain containers:

| Database type | Tenant name | Port | Db username | Password |
| --- | --- | --- | --- | --- |
| PostgreSQL | tenant1 | 33062 | postgres | find in docker.bat |
| PostgreSQL | tenant2 | 33062 | postgres | find in docker.bat |
| MySQL | tenant3 | 33061 | root | find in docker.bat |
| H2 Database | tenant4 | 33063 | sa | find in docker.bat |
| Microsoft SQL | tenant5 | 33064 | SA | find in docker.bat |

### Create master database
Master database contains configurations to connect tenant databases.

This project use PostgreSQL to store master database. So access to PostgreSQL container and create `db_style` database. After that create config table 
and insert data by [master-postgres.sql](./src/main/resources/master-postgres.sql) file.

### Create tenant database
We also access every container on the below table to create database (e.g create tenant4 database in H2 container). After that we alse create city table. Please follow sql scripts.

| Database type | Database name | Script |
| --- | --- | --- |
| PostgreSQL | tenant1 | [tenant1-postgres.sql](./src/main/resources/tenant1-postgres.sql) |
| PostgreSQL | tenant2 | [tenant2-postgres.sql](./src/main/resources/tenant2-postgres.sql) |
| MySQL | tenant3 | [tenant3-mysql.sql](./src/main/resources/tenant3-mysql.sql) |
| H2 Database | tenant4 |[tenant4-h2db.sql](./src/main/resources/tenant4-h2db.sql) |
| Microsoft SQL | tenant5 | [tenant5-mssql.sql](./src/main/resources/tenant5-mssql.sql) |

### Inport project
Using Intellij IDEA to import and run project on port 8081.

## Testing
Testing request with cURL

Create new city:

```shell
curl -X POST --location "http://localhost:8081/city" \
    -H "X-TenantID: tenant1" \
    -H "Content-Type: application/json" \
    -d "{
          \"name\": \"HCM city\"
        }"
```

Get list city:
```shell
curl -X GET --location "http://localhost:8081/city" \
    -H "Content-Type: application/json" \
    -H "X-TenantID: tenant1"
```
 
 ## Roadmap
 I will deploy city serivce on docker as a container.

 