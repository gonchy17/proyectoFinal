/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     24/09/2017 20:44:31                          */
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
   PASSWD               varchar(30) not null,
   primary key (ID_USUARIO)
);

/*==============================================================*/
/* Table: ESTUDIANTE                                            */
/*==============================================================*/
create table ESTUDIANTE
(
   ID_USUARIO           int not null,
   NOMBRE_USEST         varchar(10) not null,
   PASSWD               varchar(30) not null,
   PORC_AVANCE          tinyint,
   primary key (ID_USUARIO)
);

/*==============================================================*/
/* Table: EXAMEN                                                */
/*==============================================================*/
create table EXAMEN
(
   COD_EXAMEN           varchar(20) not null,
   COD_TEMA             varchar(30) not null,
   PREGUNTA             varchar(100) not null,
   RESPUESTA            varchar(100) not null,
   primary key (COD_EXAMEN)
);

/*==============================================================*/
/* Table: TEMA                                                  */
/*==============================================================*/
create table TEMA
(
   COD_TEMA             varchar(30) not null,
   FORMULAS             varchar(100) not null,
   CONCEPTOS            varchar(200) not null,
   ID_USUARIO           int not null,
   primary key (COD_TEMA)
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

alter table EXAMEN add constraint FK_EXAMEN_TEMA foreign key (COD_TEMA)
      references TEMA (COD_TEMA) on delete restrict on update restrict;

alter table TEMA add constraint FK_TEMA_USUARIO foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO) on delete restrict on update restrict;

