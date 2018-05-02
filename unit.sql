create table foo (a int, b int, c char);

create sequence fooseq start with 1 increment by 1;

insert into foo values (fooseq.nextval, '10', 'X');

insert into foo (select * from foo);



---------------------------


create table zeta (id number, date_created date, name varchar2(100));

create sequence zetaseq start with 1 increment by 1;

insert into zeta select zetaseq.nextval, sysdate, 'TYRION LANNISTER' from dual; 

insert into zeta select zetaseq.nextval, sysdate, 'TYRION LANNISTER' from dual connect by level <= 2000000;

----------------------------------------

SQL> create table ziggy (id number, code number, date_created date, name varchar2(42));
 
Table created.
 
SQL> insert into ziggy select rownum, mod(rownum,100), sysdate – mod(rownum,1000), DAVID BOWIE’ from dual connect by level <= 2000000; 2000000 rows created. SQL> commit;
 
Commit complete.
 
SQL> exec dbms_stats.gather_table_stats(ownname=>user, tabname=>'ZIGGY', estimate_percent=>null, method_opt=>'FOR ALL COLUMNS SIZE 1');
 
PL/SQL procedure successfully completed.
