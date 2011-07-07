create table users
(
	user_id integer not null auto_increment,
	user_username varchar(255) not null,
	user_password varchar(255) not null,
	user_last_activity long,
	user_validation varchar(255),
	primary key (user_id),
	unique (user_username)
);

create table sessions
(
	session_id integer not null auto_increment,
	session_key varchar(255) not null,
	session_date long not null,
	primary key (session_id)
);

create table invitations
(
	user_id integer not null,
	session_id integer not null,
	constraint invitation_id unique (user_id, session_id), 
	foreign key (user_id) references users(user_id),
	foreign key (session_id) references sessions(session_id)
);

create table messages
(
	message_id integer not null auto_increment,
	message_sender integer not null,
	message_content text not null,
	message_time long not null,
	message_during integer not null,
	primary key(message_id),
	foreign key (message_sender) references users(user_id),
	foreign key (message_during) references sessions(session_id)	
);

