/*
Created		23. 05. 2018
Modified		23. 05. 2018
Project		
Model		
Company		
Author		
Version		
Database		mySQL 5 
*/


Create table ustanove (
	id Serial NOT NULL,
	ime Text NOT NULL,
	naslov Text NOT NULL,
 Primary Key (id)) ENGINE = MyISAM;

Create table igre (
	id Serial NOT NULL,
	ime Text NOT NULL,
	zanra Text,
 Primary Key (id)) ENGINE = MyISAM;

Create table ucilnice (
	id Serial NOT NULL,
	kraj_id Bigint UNSIGNED NOT NULL,
	sponzor_id Bigint UNSIGNED NOT NULL,
	ustanova_id Bigint UNSIGNED NOT NULL,
	ime Text NOT NULL,
	nadstropje Int NOT NULL,
	st_mest Int NOT NULL,
 Primary Key (id)) ENGINE = MyISAM;

Create table drzave (
	id Serial NOT NULL,
	ime Text NOT NULL,
	kratica Text,
 Primary Key (id)) ENGINE = MyISAM;

Create table racunalniki (
	id Serial NOT NULL,
	ucilnica_id Bigint UNSIGNED NOT NULL,
	ime Text NOT NULL,
	opis Text,
	benchmark_score Int NOT NULL,
 Primary Key (id)) ENGINE = MyISAM;

Create table users (
	id Serial NOT NULL,
	ucilnica_id Bigint UNSIGNED NOT NULL,
	ime Text NOT NULL,
	priimek Text NOT NULL,
	leto_roj Int,
	mail Text NOT NULL,
	geslo Text NOT NULL,
 Primary Key (id)) ENGINE = MyISAM;

Create table sponzorji (
	id Serial NOT NULL,
	ime Text NOT NULL,
	denar Int NOT NULL,
 Primary Key (id)) ENGINE = MyISAM;

Create table kraji (
	id Serial NOT NULL,
	drzava_id Bigint UNSIGNED NOT NULL,
	ime Char(20) NOT NULL,
	posta Char(20) NOT NULL,
 Primary Key (id)) ENGINE = MyISAM;

Create table igre_ucilnice (
	id Serial NOT NULL,
	igra_id Bigint UNSIGNED NOT NULL,
	ucilnica_id Bigint UNSIGNED NOT NULL,
 Primary Key (id)) ENGINE = MyISAM;


Alter table ucilnice add Foreign Key (ustanova_id) references ustanove (id) on delete  restrict on update  restrict;
Alter table igre_ucilnice add Foreign Key (igra_id) references igre (id) on delete  restrict on update  restrict;
Alter table racunalniki add Foreign Key (ucilnica_id) references ucilnice (id) on delete  restrict on update  restrict;
Alter table users add Foreign Key (ucilnica_id) references ucilnice (id) on delete  restrict on update  restrict;
Alter table igre_ucilnice add Foreign Key (ucilnica_id) references ucilnice (id) on delete  restrict on update  restrict;
Alter table kraji add Foreign Key (drzava_id) references drzave (id) on delete  restrict on update  restrict;
Alter table ucilnice add Foreign Key (sponzor_id) references sponzorji (id) on delete  restrict on update  restrict;
Alter table ucilnice add Foreign Key (kraj_id) references kraji (id) on delete  restrict on update  restrict;


