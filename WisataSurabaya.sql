/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     10/03/2015 0:46:34                           */
/*==============================================================*/


drop table if exists CATEGORY;

drop table if exists KONTEN;

drop table if exists MEMBUAT;

drop table if exists USER;

/*==============================================================*/
/* Table: CATEGORY                                              */
/*==============================================================*/
create table CATEGORY
(
   ID_CATEGORY          int not null,
   NAMA_KATEGORI        text,
   primary key (ID_CATEGORY)
);

/*==============================================================*/
/* Table: KONTEN                                                */
/*==============================================================*/
create table KONTEN
(
   NAMA_KONTEN          varchar(100) not null,
   ID_CATEGORY          int not null,
   TANGGAL_INPUT        date,
   TANGGAL_TERAKHIR_SUNTING date,
   CONTRIBUTOR          text,
   KATEGORI             text not null,
   primary key (NAMA_KONTEN)
);

/*==============================================================*/
/* Table: MEMBUAT                                               */
/*==============================================================*/
create table MEMBUAT
(
   NAMA_KONTEN          varchar(100) not null,
   USER_ID              int not null,
   primary key (NAMA_KONTEN, USER_ID)
);

/*==============================================================*/
/* Table: USER                                                  */
/*==============================================================*/
create table USER
(
   USER_ID              int not null,
   FIRST_NAME           varchar(30),
   MIDDLE_NAME          varchar(30),
   LAST_NAME            varchar(30),
   USERNAME             varchar(40),
   PASSWORD             char(32),
   primary key (USER_ID)
);

alter table KONTEN add constraint FK_MEMILIKI foreign key (ID_CATEGORY)
      references CATEGORY (ID_CATEGORY) on delete restrict on update restrict;

alter table MEMBUAT add constraint FK_MEMBUAT foreign key (NAMA_KONTEN)
      references KONTEN (NAMA_KONTEN) on delete restrict on update restrict;

alter table MEMBUAT add constraint FK_MEMBUAT2 foreign key (USER_ID)
      references USER (USER_ID) on delete restrict on update restrict;

