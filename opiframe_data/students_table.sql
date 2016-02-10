create table students(

	_id int auto_increment not null unique,
    s_name varchar(255) not null,
    address varchar(255) not null,
    email varchar(255),
    phone varchar(255),
    primary key(_id)

)Engine=InnoDb;

drop table students;