create table payment_statuses
(
	id serial primary key not null,
	payment_status_name character varying (50) not null unique
);


create table payments
(
	id serial primary key,
	client_id uuid not null,
	amount numeric(10, 2) not null check (amount > 0),
	payment_status int not null,
	transaction_date timestamp with time zone default now() not null,
	
	constraint fk_payments_pay_statuses
	foreign key (payment_status) references payment_statuses (id)
		ON UPDATE CASCADE 
        ON DELETE restrict
);
