create table IF NOT EXISTS Z_ALL_SQL (
   object_name          varchar(64)                    not null,
   object_oper          ENUM('C','S','I','U','D')      not null,
   index_sql            smallint                       not null,
   skip_sql             char(1)                        default '0' not null,
   ignore_errors        char(1)                        default '1' not null,
   object_sql           text,
   constraint PK_Z_ALL_SQL primary key (object_name, object_oper, index_sql)
)
;


create table IF NOT EXISTS Z_CONTENTTYPE (
   id_contenttype       smallint                       not null,
   contenttype_text     varchar(50)                    not null,
   constraint PK_Z_CONTENTTYPE primary key (id_contenttype)
)
;

INSERT IGNORE INTO Z_CONTENTTYPE (id_contenttype, contenttype_text) VALUES
(1, 'image/png'),
(2, 'image/jpeg'),
(3, 'image/jpg'),
(4, 'image/gif'),
(5, 'image/tiff'),
(6, 'image/svg+xml'),
(7, 'image/vnd.microsoft.icon'),
(8, 'image/jp2'),
(9, 'image/bmp'),
(10, 'image/webp'),
(65, 'application/vnd.google-earth.kml+xml'),
(66, 'application/gpx+xml'),
(67, 'application/vnd.google-earth.kmz'),
(68, 'application/xml'),
(69, 'application/json'),
(70, 'application/geo+json'),
(71, 'application/vnd.sas.wikimapia.kml+xml'),
(72, 'application/vnd.sas.wikimapia.kmz'),
(73, 'application/vnd.sas.wikimapia.txt'),
(91, 'text/html'),
(92, 'text/plain')
;

create unique index Z_CONTENTTYPE_UNIQ on Z_CONTENTTYPE (
contenttype_text ASC
)
;



create table IF NOT EXISTS Z_OPTIONS (
   id_option            int                            not null,
   option_descript      varchar(255)                   not null,
   option_value         int                            not null,
   constraint PK_Z_OPTIONS primary key (id_option)
)
;

INSERT IGNORE INTO Z_OPTIONS (id_option,option_descript,option_value) VALUES
(1, 'Autocreate services', 0),
(2, 'Autocreate versions', 0),
(3, 'Keep TILE for TNE', 0)
;



create table IF NOT EXISTS Z_DIV_MODE (
   id_div_mode          char(1)                        not null,
   div_mode_name        varchar(30)                    not null,
   div_mask_width       smallint                       not null,
   constraint PK_Z_DIV_MODE primary key (id_div_mode)
)
;

INSERT IGNORE INTO Z_DIV_MODE (id_div_mode,div_mode_name,div_mask_width) VALUES
('Z','All-in-One',0),
('I','Based on 1024',10),
('J','Based on 2048',11),
('K','Based on 4096',12),
('L','Based on 8192',13),
('M','Based on 16384',14),
('N','Based on 32768',15)
;

create unique index Z_DIV_MODE_UNIQ on Z_DIV_MODE (
div_mode_name ASC
)
;



create table IF NOT EXISTS Z_VER_COMP (
   id_ver_comp          char(1)                        not null,
   ver_comp_field       varchar(30)                    not null,
   ver_comp_name        varchar(30)                    not null,
   constraint PK_Z_VER_COMP primary key (id_ver_comp)
)
;

INSERT IGNORE INTO Z_VER_COMP (id_ver_comp,ver_comp_field,ver_comp_name) VALUES
('0','-','No'),
('I','id_ver','By id'),
('V','ver_value','By value'),
('D','ver_date','By date'),
('N','ver_number','By number')
;

create unique index Z_VER_COMP_F_UNIQ on Z_VER_COMP (
ver_comp_field ASC
)
;

create unique index Z_VER_COMP_N_UNIQ on Z_VER_COMP (
ver_comp_name ASC
)
;





create table IF NOT EXISTS Z_SERVICE (
   id_service           smallint                       not null,
   service_code         varchar(20)                    not null,
   service_name         varchar(50)                    not null,
   id_contenttype       smallint                       not null,
   id_ver_comp          char(1)                        default '0' not null,
   id_div_mode          char(1)                        default 'I' not null,
   work_mode            ENUM('0','S','R')              default '0' not null,
   use_common_tiles     char(1)                        default '0' not null,
   tile_load_mode       smallint                       default 0 not null,
   tile_save_mode       smallint                       default 0 not null,
   tile_hash_mode       smallint                       default 0 not null,
   ver_by_tile_mode     smallint                       default 0 not null,
   constraint PK_Z_SERVICE primary key (id_service)
)
;

create unique index Z_SERVICE_C_UNIQ on Z_SERVICE (
service_code ASC
)
;

create unique index Z_SERVICE_N_UNIQ on Z_SERVICE (
service_name ASC
)
;

alter table Z_SERVICE
   add constraint FK_Z_SERVICE2Z_CONTENTTYPE foreign key (id_contenttype)
      references Z_CONTENTTYPE (id_contenttype)
;

alter table Z_SERVICE
   add constraint FK_Z_SERVICE2Z_DIV_MODE foreign key (id_div_mode)
      references Z_DIV_MODE (id_div_mode)
;

alter table Z_SERVICE
   add constraint FK_Z_SERVICE2Z_VER_COMP foreign key (id_ver_comp)
      references Z_VER_COMP (id_ver_comp)
;




create table IF NOT EXISTS Z_VER_BY_TILE (
   id_ver_by_tile       smallint                       not null,
   tile_contenttype     smallint                       not null,
   src_parser           varchar(255)                   not null,
   src_desc             varchar(255),
   src_catalog          varchar(255),
   src_root             varchar(63),
   src_name             varchar(63),
   src_mode             char(1),
   dst_mode             char(1),
   ver_mode             char(1),
   dat_mode             char(1),
   num_mode             char(1),
   dsc_mode             char(1),
   auxillary_ver        smallint,
   auxillary_dat        DATETIME,
   auxillary_num        int,
   constraint PK_Z_VER_BY_TILE primary key (id_ver_by_tile, tile_contenttype)
)
;

