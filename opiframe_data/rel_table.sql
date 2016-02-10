create table rel_table(

	_id int auto_increment not null unique,
    primary key(_id),
    c_id int,
    s_id int,
    t_id int,
    foreign key(c_id) references course(_id),
    foreign key(s_id) references students(_id),
    foreign key(t_id) references teachers(_id)

)Engine=InnoDb;

drop table rel_table;
