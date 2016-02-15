create table user_roles(

	_id int auto_increment not null unique,
    user_id int,
    role varchar(45),
    primary key(_id),
    foreign key(user_id) references user(_id)
)Engine=InnoDb;