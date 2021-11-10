/*Création type table*/
drop table if exists type;

create table if not exists type(
	id_type int not null AUTO_INCREMENT primary key,
	lib_type varchar(20) not null
)engine = InnoDB;

/*Création table compte*/
drop table if exists compte;

create table if not exists compte(
	id_compte int not null AUTO_INCREMENT primary key,
	login varchar(20) not null,
	passwd varchar(20) not null,
	nom varchar(20) not null,
	prenom varchar(20) not null,
	id_type int not null
)engine = InnoDB;

/*Création table matiere*/
drop table if exists matiere;

create table if not exists matiere(
	id_matiere int not null AUTO_INCREMENT primary key,
	lib_matiere varchar(20) not null
)engine = InnoDB;

/*Création table note*/
drop table if exists note;

create table if not exists note(
	id_note int not null AUTO_INCREMENT primary key,
	valeur int not null,
	description varchar(100) null,
	id_matiere int not null,
	id_compte int not null
)engine = InnoDB;

insert into type(lib_type) values
	("admin"),
	("professeur"),
	("etudiant");

insert into compte(login, passwd, nom, prenom, id_type) values
	("GraMad","1234","Madembo","Grace",(SELECT id_type FROM type WHERE lib_type = "professeur")),
	("NicVal","1234","Valentin","Nicolas",(SELECT id_type FROM type WHERE lib_type = "professeur")),
	("NicLeh","1234","Lehmann","Nicolas",(SELECT id_type FROM type WHERE lib_type = "professeur")),
	("MarSen","1234","Sensei","Marine",(SELECT id_type FROM type WHERE lib_type = "professeur")),
	("JefZum","1234","Zumkir","Jeffrey",(SELECT id_type FROM type WHERE lib_type = "etudiant")),
	("BapRif","1234","Riff","Baptiste",(SELECT id_type FROM type WHERE lib_type = "etudiant")),
	("MarSch","1234","Schwartz","Marine",(SELECT id_type FROM type WHERE lib_type = "etudiant")),
	("HugEit","1234","Eitel","Hugo",(SELECT id_type FROM type WHERE lib_type = "etudiant")),
	("GaePio","1234","Piou","Gaetan",(SELECT id_type FROM type WHERE lib_type = "etudiant")),
	("LucCor","1234","Cornu","Luc",(SELECT id_type FROM type WHERE lib_type = "etudiant"));

insert into matiere(lib_matiere) values
	("Web"),
	("Algo"),
	("GD"),
	("Japonais");

insert into note(valeur, id_matiere, id_compte) values
	("15",(SELECT id_matiere FROM matiere WHERE lib_matiere = "Web"), (SELECT id_compte FROM compte WHERE login = "JefZum")),
	("13",(SELECT id_matiere FROM matiere WHERE lib_matiere = "Web"), (SELECT id_compte FROM compte WHERE login = "JefZum")),
	("17",(SELECT id_matiere FROM matiere WHERE lib_matiere = "Web"), (SELECT id_compte FROM compte WHERE login = "MarSch")),
	("15",(SELECT id_matiere FROM matiere WHERE lib_matiere = "Web"), (SELECT id_compte FROM compte WHERE login = "MarSch")),
	("14",(SELECT id_matiere FROM matiere WHERE lib_matiere = "Web"), (SELECT id_compte FROM compte WHERE login = "BapRif")),
	("2",(SELECT id_matiere FROM matiere WHERE lib_matiere = "Web"), (SELECT id_compte FROM compte WHERE login = "BapRif")),
	("18",(SELECT id_matiere FROM matiere WHERE lib_matiere = "Web"), (SELECT id_compte FROM compte WHERE login = "HugEit")),
	("2",(SELECT id_matiere FROM matiere WHERE lib_matiere = "Web"), (SELECT id_compte FROM compte WHERE login = "HugEit")),
	("15",(SELECT id_matiere FROM matiere WHERE lib_matiere = "GD"), (SELECT id_compte FROM compte WHERE login = "JefZum")),
	("16",(SELECT id_matiere FROM matiere WHERE lib_matiere = "GD"), (SELECT id_compte FROM compte WHERE login = "MarSch")),
	("17",(SELECT id_matiere FROM matiere WHERE lib_matiere = "GD"), (SELECT id_compte FROM compte WHERE login = "BapRif")),
	("16",(SELECT id_matiere FROM matiere WHERE lib_matiere = "GD"), (SELECT id_compte FROM compte WHERE login = "HugEit")),
	("17",(SELECT id_matiere FROM matiere WHERE lib_matiere = "Algo"), (SELECT id_compte FROM compte WHERE login = "JefZum")),
	("16",(SELECT id_matiere FROM matiere WHERE lib_matiere = "Algo"), (SELECT id_compte FROM compte WHERE login = "MarSch")),
	("15",(SELECT id_matiere FROM matiere WHERE lib_matiere = "Algo"), (SELECT id_compte FROM compte WHERE login = "BapRif")),
	("16",(SELECT id_matiere FROM matiere WHERE lib_matiere = "Algo"), (SELECT id_compte FROM compte WHERE login = "HugEit")),
	("15",(SELECT id_matiere FROM matiere WHERE lib_matiere = "Japonais"), (SELECT id_compte FROM compte WHERE login = "JefZum")),
	("18",(SELECT id_matiere FROM matiere WHERE lib_matiere = "Japonais"), (SELECT id_compte FROM compte WHERE login = "MarSch"));