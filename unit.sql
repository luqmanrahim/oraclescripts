create table foo (a int, b int, c char);

create sequence fooseq start with 1 increment by 1;

insert into foo values (fooseq.nextval, '10', 'X');

insert into foo (select * from foo);
