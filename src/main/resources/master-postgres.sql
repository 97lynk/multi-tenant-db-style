-- create `db_style` in postgres db
create table datasourceconfig
(
    id              serial primary key,
    driverclassname varchar(255),
    initialize      boolean not null,
    name            varchar(255),
    password        varchar(255),
    url             varchar(255),
    username        varchar(255)
);

insert into datasourceconfig(name, initialize, username, password, driverclassname, url)
values ('tenant1', true, 'postgres', 'awhjw', 'org.postgresql.Driver',
        'jdbc:postgresql://localhost:5432/tenant1?ApplicationName=MultiTenant'),

       ('tenant2', true, 'postgres', 'awhjw', 'org.postgresql.Driver',
        'jdbc:postgresql://localhost:5432/tenant2?ApplicationName=MultiTenant'),

       ('tenant3', true, 'root', '12345678', 'com.mysql.cj.jdbc.Driver',
        'jdbc:mysql://localhost:33062/tenant3?useSSL=false'),

       ('tenant4', true, 'sa', '', 'org.h2.Driver', 'jdbc:h2:tcp://localhost:1521/~/citydb'),

       ('tenant5', true, 'SA', 'Lumia435@', 'com.microsoft.sqlserver.jdbc.SQLServerDriver',
        'jdbc:sqlserver://localhost:1433;databaseName=tenant4')
;