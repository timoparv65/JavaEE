create table teachers(

	_id int auto_increment not null unique,
    t_name varchar(255) not null,
    email varchar(255),
    phone varchar(255),
    t_subject varchar(255) default "generic substitute",
    primary key(_id)

)Engine=InnoDb;

drop table teachers;

select t_name, phone from teachers;
