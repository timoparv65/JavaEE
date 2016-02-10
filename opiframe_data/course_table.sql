create table course(

	_id int auto_increment not null unique,
    c_name varchar(255) not null,
    grade float,
    c_info text,
    primary key(_id)

)Engine=InnoDb;

drop table course;
