create table roles
(
	id serial primary key not null,
	role_name character varying (50) not null unique
);

create table users
(
	id uuid primary key DEFAULT gen_random_uuid() not null,
	role_id int not null,
	login char varying (200) unique not null,
	password_hash char varying (200),
	create_at date not null,
	is_active bool not null default true,
	created_at timestamptz default now(),
	CONSTRAINT fk_users_role 
        FOREIGN KEY (role_id) REFERENCES roles(id) 
        ON UPDATE CASCADE 
        ON DELETE RESTRICT
);


--Подробная информация о каждом пользователе
create table profiles
(
	id serial primary key,
	user_id uuid not null,
	constraint fk_profiles_user
	foreign key (user_id) references users(id)
		ON UPDATE CASCADE 
        ON DELETE CASCADE,
	surname char varying (100) not null,
	selfname char varying (100) not null,
	patronymic char varying (100),
	birthday date not null,
	phone char varying (20) not null,
	email char varying (100) unique not null,
	constraint check_age 
	check (birthday < CURRENT_DATE - INTERVAL '12 years'),
	constraint check_phone_format 
	check(phone ~ '^\+?[0-9]{10,15}$'),
	constraint check_email_format 
	check (email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$')
);