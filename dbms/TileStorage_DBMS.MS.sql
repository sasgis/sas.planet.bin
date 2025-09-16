create view DUAL as select @@version as ENGINE_VERSION
go


create table Z_ALL_SQL (
   object_name          sysname                        not null,
   object_oper          char(1)                        not null
         constraint CKC_OBJECT_OPER_Z_ALL_SQL check (object_oper in ('C','S','I','U','D')),
   index_sql            smallint                       not null,
   skip_sql             char(1)                        default '0' not null,
   ignore_errors        char(1)                        default '1' not null,
   object_sql           text                           null,
   constraint PK_Z_ALL_SQL primary key (object_name, object_oper, index_sql)
)
go



create table Z_CONTENTTYPE (
   id_contenttype       smallint                       not null,
   contenttype_text     varchar(50)                    not null,
   constraint PK_Z_CONTENTTYPE primary key (id_contenttype)
)
go

if not exists(select 1 from Z_CONTENTTYPE where id_contenttype=1)
begin
  insert into Z_CONTENTTYPE (id_contenttype, contenttype_text)
  values (1, 'image/png')
end
go

if not exists(select 1 from Z_CONTENTTYPE where id_contenttype=2)
begin
  insert into Z_CONTENTTYPE (id_contenttype, contenttype_text)
  values (2, 'image/jpeg')
end
go

if not exists(select 1 from Z_CONTENTTYPE where id_contenttype=3)
begin
  insert into Z_CONTENTTYPE (id_contenttype, contenttype_text)
  values (3, 'image/jpg')
end
go

if not exists(select 1 from Z_CONTENTTYPE where id_contenttype=4)
begin
  insert into Z_CONTENTTYPE (id_contenttype, contenttype_text)
  values (4, 'image/gif')
end
go

if not exists(select 1 from Z_CONTENTTYPE where id_contenttype=5)
begin
  insert into Z_CONTENTTYPE (id_contenttype, contenttype_text)
  values (5, 'image/tiff')
end
go

if not exists(select 1 from Z_CONTENTTYPE where id_contenttype=6)
begin
  insert into Z_CONTENTTYPE (id_contenttype, contenttype_text)
  values (6, 'image/svg+xml')
end
go

if not exists(select 1 from Z_CONTENTTYPE where id_contenttype=7)
begin
  insert into Z_CONTENTTYPE (id_contenttype, contenttype_text)
  values (7, 'image/vnd.microsoft.icon')
end
go

if not exists(select 1 from Z_CONTENTTYPE where id_contenttype=8)
begin
  insert into Z_CONTENTTYPE (id_contenttype, contenttype_text)
  values (8, 'image/jp2')
end
go

if not exists(select 1 from Z_CONTENTTYPE where id_contenttype=9)
begin
  insert into Z_CONTENTTYPE (id_contenttype, contenttype_text)
  values (9, 'image/bmp')
end
go

if not exists(select 1 from Z_CONTENTTYPE where id_contenttype=10)
begin
  insert into Z_CONTENTTYPE (id_contenttype, contenttype_text)
  values (10, 'image/webp')
end
go

if not exists(select 1 from Z_CONTENTTYPE where id_contenttype=65)
begin
  insert into Z_CONTENTTYPE (id_contenttype, contenttype_text)
  values (65, 'application/vnd.google-earth.kml+xml')
end
go

if not exists(select 1 from Z_CONTENTTYPE where id_contenttype=66)
begin
  insert into Z_CONTENTTYPE (id_contenttype, contenttype_text)
  values (66, 'application/gpx+xml')
end
go

if not exists(select 1 from Z_CONTENTTYPE where id_contenttype=67)
begin
  insert into Z_CONTENTTYPE (id_contenttype, contenttype_text)
  values (67, 'application/vnd.google-earth.kmz')
end
go

if not exists(select 1 from Z_CONTENTTYPE where id_contenttype=68)
begin
  insert into Z_CONTENTTYPE (id_contenttype, contenttype_text)
  values (68, 'application/xml')
end
go

if not exists(select 1 from Z_CONTENTTYPE where id_contenttype=69)
begin
  insert into Z_CONTENTTYPE (id_contenttype, contenttype_text)
  values (69, 'application/json')
end
go

if not exists(select 1 from Z_CONTENTTYPE where id_contenttype=70)
begin
  insert into Z_CONTENTTYPE (id_contenttype, contenttype_text)
  values (70, 'application/geo+json')
end
go

if not exists(select 1 from Z_CONTENTTYPE where id_contenttype=71)
begin
  insert into Z_CONTENTTYPE (id_contenttype, contenttype_text)
  values (71, 'application/vnd.sas.wikimapia.kml+xml')
end
go

if not exists(select 1 from Z_CONTENTTYPE where id_contenttype=72)
begin
  insert into Z_CONTENTTYPE (id_contenttype, contenttype_text)
  values (72, 'application/vnd.sas.wikimapia.kmz')
end
go

if not exists(select 1 from Z_CONTENTTYPE where id_contenttype=73)
begin
  insert into Z_CONTENTTYPE (id_contenttype, contenttype_text)
  values (73, 'application/vnd.sas.wikimapia.txt')
end
go

if not exists(select 1 from Z_CONTENTTYPE where id_contenttype=91)
begin
  insert into Z_CONTENTTYPE (id_contenttype, contenttype_text)
  values (91, 'text/html')
end
go

if not exists(select 1 from Z_CONTENTTYPE where id_contenttype=92)
begin
  insert into Z_CONTENTTYPE (id_contenttype, contenttype_text)
  values (92, 'text/plain')
end
go


create unique index Z_CONTENTTYPE_UNIQ on Z_CONTENTTYPE (
contenttype_text ASC
)
go



create table Z_OPTIONS (
   id_option            int                            not null,
   option_descript      varchar(255)                   not null,
   option_value         int                            not null,
   constraint PK_Z_OPTIONS primary key (id_option)
)
go

if not exists(select 1 from Z_OPTIONS where id_option=1)
begin
  insert into Z_OPTIONS (id_option,option_descript,option_value)
  values (1, 'Autocreate services', 0)
end
go

if not exists(select 1 from Z_OPTIONS where id_option=2)
begin
  insert into Z_OPTIONS (id_option,option_descript,option_value)
  values (2, 'Autocreate versions', 0)
end
go

if not exists(select 1 from Z_OPTIONS where id_option=3)
begin
  insert into Z_OPTIONS (id_option,option_descript,option_value)
  values (3, 'Keep TILE for TNE', 0)
end
go




create table Z_DIV_MODE (
   id_div_mode          char(1)                        not null,
   div_mode_name        varchar(30)                    not null,
   div_mask_width       smallint                       not null,
   constraint PK_Z_DIV_MODE primary key (id_div_mode)
)
go

if not exists(select 1 from Z_DIV_MODE where id_div_mode='Z')
begin
  insert into Z_DIV_MODE (id_div_mode,div_mode_name,div_mask_width)
  values ('Z','All-in-One',0)
end
go

if not exists(select 1 from Z_DIV_MODE where id_div_mode='I')
begin
  insert into Z_DIV_MODE (id_div_mode,div_mode_name,div_mask_width)
  values ('I','Based on 1024',10)
end
go

if not exists(select 1 from Z_DIV_MODE where id_div_mode='J')
begin
  insert into Z_DIV_MODE (id_div_mode,div_mode_name,div_mask_width)
  values ('J','Based on 2048',11)
end
go

if not exists(select 1 from Z_DIV_MODE where id_div_mode='K')
begin
  insert into Z_DIV_MODE (id_div_mode,div_mode_name,div_mask_width)
  values ('K','Based on 4096',12)
end
go

if not exists(select 1 from Z_DIV_MODE where id_div_mode='L')
begin
  insert into Z_DIV_MODE (id_div_mode,div_mode_name,div_mask_width)
  values ('L','Based on 8192',13)
end
go

if not exists(select 1 from Z_DIV_MODE where id_div_mode='M')
begin
  insert into Z_DIV_MODE (id_div_mode,div_mode_name,div_mask_width)
  values ('M','Based on 16384',14)
end
go

if not exists(select 1 from Z_DIV_MODE where id_div_mode='N')
begin
  insert into Z_DIV_MODE (id_div_mode,div_mode_name,div_mask_width)
  values ('N','Based on 32768',15)
end
go

create unique index Z_DIV_MODE_UNIQ on Z_DIV_MODE (
div_mode_name ASC
)
go





create table Z_VER_COMP (
   id_ver_comp          char(1)                        not null,
   ver_comp_field       varchar(30)                    not null,
   ver_comp_name        varchar(30)                    not null,
   constraint PK_Z_VER_COMP primary key (id_ver_comp)
)
go

if not exists(select 1 from Z_VER_COMP where id_ver_comp='0')
begin
  insert into Z_VER_COMP (id_ver_comp,ver_comp_field,ver_comp_name)
  values ('0','-','No')
end
go

if not exists(select 1 from Z_VER_COMP where id_ver_comp='I')
begin
  insert into Z_VER_COMP (id_ver_comp,ver_comp_field,ver_comp_name)
  values ('I','id_ver','By id')
end
go

if not exists(select 1 from Z_VER_COMP where id_ver_comp='V')
begin
  insert into Z_VER_COMP (id_ver_comp,ver_comp_field,ver_comp_name)
  values ('V','ver_value','By value')
end
go

if not exists(select 1 from Z_VER_COMP where id_ver_comp='D')
begin
  insert into Z_VER_COMP (id_ver_comp,ver_comp_field,ver_comp_name)
  values ('D','ver_date','By date')
end
go

if not exists(select 1 from Z_VER_COMP where id_ver_comp='N')
begin
  insert into Z_VER_COMP (id_ver_comp,ver_comp_field,ver_comp_name)
  values ('N','ver_number','By number')
end
go

create unique index Z_VER_COMP_F_UNIQ on Z_VER_COMP (
ver_comp_field ASC
)
go

create unique index Z_VER_COMP_N_UNIQ on Z_VER_COMP (
ver_comp_name ASC
)
go





create table Z_SERVICE (
   id_service           smallint                       not null,
   service_code         varchar(20)                    not null,
   service_name         varchar(50)                    not null,
   id_contenttype       smallint                       not null,
   id_ver_comp          char(1)                        default '0' not null,
   id_div_mode          char(1)                        default 'I' not null,
   work_mode            char(1)                        default '0' not null
         constraint CKC_WORK_MODE_Z_SERVICE check (work_mode in ('0','S','R')),
   use_common_tiles     char(1)                        default '0' not null,
   tile_load_mode       smallint                       default 0 not null,
   tile_save_mode       smallint                       default 0 not null,
   tile_hash_mode       smallint                       default 0 not null,
   ver_by_tile_mode     smallint                       default 0 not null,
   constraint PK_Z_SERVICE primary key (id_service)
)
go

create unique index Z_SERVICE_C_UNIQ on Z_SERVICE (
service_code ASC
)
go

create unique index Z_SERVICE_N_UNIQ on Z_SERVICE (
service_name ASC
)
go

alter table Z_SERVICE
   add constraint FK_Z_SERVICE2Z_CONTENTTYPE foreign key (id_contenttype)
      references Z_CONTENTTYPE (id_contenttype)
go

alter table Z_SERVICE
   add constraint FK_Z_SERVICE2Z_DIV_MODE foreign key (id_div_mode)
      references Z_DIV_MODE (id_div_mode)
go

alter table Z_SERVICE
   add constraint FK_Z_SERVICE2Z_VER_COMP foreign key (id_ver_comp)
      references Z_VER_COMP (id_ver_comp)
go



create table Z_VER_BY_TILE (
   id_ver_by_tile       smallint                       not null,
   tile_contenttype     smallint                       not null,
   src_parser           varchar(255)                   not null,
   src_desc             varchar(255)                   null,
   src_catalog          varchar(255)                   null,
   src_root             varchar(63)                    null,
   src_name             varchar(63)                    null,
   src_mode             char(1)                        null,
   dst_mode             char(1)                        null,
   ver_mode             char(1)                        null,
   dat_mode             char(1)                        null,
   num_mode             char(1)                        null,
   dsc_mode             char(1)                        null,
   auxillary_ver        smallint                       null,
   auxillary_dat        datetime                       null,
   auxillary_num        int                            null,
   constraint PK_Z_VER_BY_TILE primary key (id_ver_by_tile, tile_contenttype)
)
go

