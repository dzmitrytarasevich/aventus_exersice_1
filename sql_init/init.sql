create table endpoint1 (
    id SERIAL PRIMARY KEY,
    name varchar(100)
);

insert into endpoint1 (name) values ('endpoint1');

create table endpoint2 (
    id SERIAL PRIMARY KEY,
    name varchar(100)
);

insert into endpoint2 (name) values ('endpoint2');