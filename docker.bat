docker run -d `
	-p 33064:1433 `
	-e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=Lumia435@' `
	-v D:\docker\mssql:/var/opt/mssql/data `
	--name mssql-container `
	mcr.microsoft.com/mssql/server:2017-CU8-ubuntu

docker run -d `
	-p 33063:1521 -p 81:81 `
	-v D:\docker\h2db:/data `
	--name=h2db-container `
	 joedoe/h2db

docker run -d `
	-p 33061:3306 `
	-v D:\docker\mysql:/var/lib/mysql `
	-e MYSQL_ROOT_PASSWORD=12345678 `
	--name mysql-container `
	mysql:5.7

docker run -d `
	-p 33062:5432 `
	-v D:\docker\postgres:/var/lib/postgresql/data `
	-e POSTGRES_PASSWORD=awhjw `
	--name postgres-container `
postgres:9.6.17