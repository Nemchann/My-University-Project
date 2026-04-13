create table workout_types
(
    id serial primary key,
    type_name varchar(50) not null unique 
);

--Таблица готовых тренировок, но не занятий в спортзале, только описание и название
create table workouts
(
	id serial primary key not null,
	workout_name character varying (70) not null,
	workout_type_id int not null,
	description character varying (200),
	constraint fk_workouts_type 
        foreign key (workout_type_id) references workout_types(id)
        on update cascade 
        on delete restrict
);

--Комнаты
create table rooms
(
	id serial primary key not null,
	room_name character varying (50) not null unique,
	capacity int not null check (capacity > 0)
);

create table schedule
(
	id serial primary key not null,
	workout_id int not null,
	room_id int not null,
	trainer_id uuid not null,
	schedule_date date not null,
	start_time timestamptz not null,
	end_time timestamptz not null,	
	max_participants int not null check (max_participants > 0),
	current_participants int not null,
	created_at timestamptz default now() not null,
	
	constraint check_current_participants
	check (current_participants <= max_participants),
	
	constraint check_times
	check (end_time > start_time),
	
	constraint fk_schedule_workout
	foreign key (workout_id) references workouts (id)
		ON UPDATE CASCADE 
        ON DELETE cascade,
    constraint fk_schedule_rooms
    foreign key (room_id) references rooms (id)
		ON UPDATE CASCADE 
        ON DELETE cascade
);