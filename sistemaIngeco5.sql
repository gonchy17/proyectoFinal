/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     06/07/2018 14:52:27                          */
/*==============================================================*/


drop table if exists DOCENTE;

drop table if exists ESTUDIANTE;

drop table if exists EXAMEN;

drop table if exists TEMA;

drop table if exists USUARIO;

/*==============================================================*/
/* Table: DOCENTE                                               */
/*==============================================================*/
create table DOCENTE
(
   ID_USUARIO           int not null,
   NOMBRE_USDOC         varchar(10) not null,
   PASSWD               varchar(7) not null,
   TEMA_DESIGNADO       int not null,
   primary key (ID_USUARIO)
);

/*==============================================================*/
/* Table: ESTUDIANTE                                            */
/*==============================================================*/
create table ESTUDIANTE
(
   ID_USUARIO           int not null,   
   NOMBRE_USEST         varchar(10) not null,
   PASSWD               varchar(7) not null,
   PORC_AVANCE          tinyint,
   ESTADO		tinyint,
   primary key (ID_USUARIO)
);

/*==============================================================*/
/* Table: EXAMEN                                                */
/*==============================================================*/
create table EXAMEN
(
   COD_EXAMEN           varchar(20) not null,
   COD_TEMA             varchar(40) not null,
   ID_TEMA              int not null,
   PREGUNTA             longblob null,
   RESPUESTA            longblob null,
   ID_USUARIO           int not null,
   primary key (COD_EXAMEN)
);

/*==============================================================*/
/* Table: TEMA                                                  */
/*==============================================================*/
create table TEMA
(
   ID_TEMA              int not null auto_increment,
   COD_TEMA             varchar(40) not null,
   FORMULAS             longblob not null,
   CONCEPTOS            varchar(200) not null, 
   ID_USUARIO           int not null,
   primary key (ID_TEMA)
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO
(
   ID_USUARIO           int not null auto_increment,	
   NOMBRES              varchar(30) not null,
   APELLIDOS            varchar(30) not null,
   ROL                  varchar(10) not null,  
   primary key (ID_USUARIO) 
);

alter table DOCENTE add constraint FK_USUARIO_DOCENTE foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO) on delete restrict on update restrict;

alter table ESTUDIANTE add constraint FK_USUARIO_ESTUDIANTE foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO) on delete restrict on update restrict;

alter table EXAMEN add constraint FK_TEMA_EXAMEN foreign key (ID_TEMA)
      references TEMA (ID_TEMA) on delete cascade on update restrict;

alter table TEMA add constraint FK_TEMA_USUARIO foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO) on delete restrict on update restrict;

