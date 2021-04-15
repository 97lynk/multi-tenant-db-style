-- create 2 database with tenant1, tenant2
CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE;

create table city
(
    id   bigint not null
        constraint city_pkey
            primary key,
    name varchar(255)
);

-- create main db_style

create table city
(
    id   bigint not null
        constraint city_pkey
            primary key,
    name varchar(255)
);


create table datasourceconfig
(
    id              bigint  not null
        constraint datasourceconfig_pkey
            primary key,
    driverclassname varchar(255),
    initialize      boolean not null,
    name            varchar(255),
    password        varchar(255),
    url             varchar(255),
    username        varchar(255)
);

insert into datasourceconfig(id, driverclassname, initialize, name, username, password, url)
values (1, 'org.postgresql.Driver', true, 'tenant1', 'postgres', 'awhjw',
        'jdbc:postgresql://localhost:5432/tenant1?ApplicationName=MultiTenant'),
       (2, 'org.postgresql.Driver', true, 'tenant2', 'postgres', 'awhjw',
        'jdbc:postgresql://localhost:5432/tenant2?ApplicationName=MultiTenant');