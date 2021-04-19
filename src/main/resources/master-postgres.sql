-- create `db_style` in postgres db
create table datasourceconfig
(
    id                         serial primary key,
    driver_class_name          varchar(255),
    initialize                 boolean not null,
    name                       varchar(255),
    connection_string_template varchar(255),
    host                       varchar(255),
    port                       int,
    database_name              varchar(255),
    username                   varchar(255),
    password                   varchar(255)
);

insert into datasourceconfig(name, initialize, username, password, driver_class_name,
                             connection_string_template, host, port, database_name)
values ('tenant1', true, 'postgres', 'awhjw', 'org.postgresql.Driver',
        'jdbc:postgresql://%s:%s/%s?ApplicationName=MultiTenant', 'localhost', 33062, 'tenant1'),

       ('tenant2', true, 'postgres', 'awhjw', 'org.postgresql.Driver',
        'jdbc:postgresql://%s:%s/%s?ApplicationName=MultiTenant', 'localhost', 33062, 'tenant2'),

       ('tenant3', true, 'root', '12345678', 'com.mysql.cj.jdbc.Driver',
        'jdbc:mysql://%s:%s/%s?useSSL=false', 'localhost', 33061, 'tenant3'),

       ('tenant4', true, 'sa', '', 'org.h2.Driver',
        'jdbc:h2:tcp://%s:%s/~/%s', 'localhost', 33063, 'tenant4'),

       ('tenant5', true, 'SA', 'Lumia435@', 'com.microsoft.sqlserver.jdbc.SQLServerDriver',
        'jdbc:sqlserver://%s:%d;databaseName=%s', 'localhost', 33064, 'tenant5')
;
