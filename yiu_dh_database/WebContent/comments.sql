create table comments(
	seq int not null primary key,
	name varchar2(10) not null,
	pass varchar2(10) not null,
	content varchar2(100) not null,
	reg_date date default sysdate
);

insert into comments(seq, name, pass, content) values(1, 'test', '1234', 'test');