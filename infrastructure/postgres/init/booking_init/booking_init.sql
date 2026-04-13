create table subscription_statuses
(
	id serial primary key not null,
	subscription_status_name character varying (50) not null unique
);

create table booking_statuses
(
	id serial primary key not null,
	booking_status_name character varying (50) not null unique
);

--Абонементы
create table subscriptions
(
	id serial primary key not null,
	subscription_name character varying (50) not null,
	price numeric(10, 2) not null check (price >= 0),
	duration_days int check (duration_days > 0),
	visits_count int check (visits_count > 0)
);

create table client_subscriptions
(
	id serial primary key not null,
	client_id uuid not null,
	subscription_id int not null,
	start_date date not null,
	end_date date not null,
	constraint check_dates_format
	check (end_date > start_date),
	remaining_visits int not null,
	subscription_status int,
	
	constraint fk_client_subscriptions_subscriptions
	foreign key (subscription_id) references subscriptions(id)
		ON UPDATE CASCADE 
        ON DELETE restrict,
	constraint fk_client_subscriptions_subscription_statuses
	foreign key (subscription_status) references subscription_statuses(id)
		ON UPDATE CASCADE 
        ON DELETE restrict
);

create table bookings 
(
	id serial not null,
	schedule_id int not null,
	client_id uuid not null,
	status_id int not null,
	created_at timestamptz default now(),
	constraint check_creation_date
	check (created_at <= CURRENT_DATE),
	
    constraint fk_bookings_booking_statuses
	foreign key (status_id) references booking_statuses (id)
		ON UPDATE CASCADE 
        ON DELETE restrict
	
);