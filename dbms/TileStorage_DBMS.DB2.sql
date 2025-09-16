create view DUAL as select * from SYSIBM.SYSVERSIONS
;

create table Z_ALL_SQL (
   object_name          varchar(128)                   not null,
   object_oper          char(1)                        not null
         constraint CKC_OBJECT_OPER_Z_ALL_SQL check (object_oper in ('C','S','I','U','D')),
   index_sql            smallint                       not null,
   skip_sql             char(1)                        default '0' not null,
   ignore_errors        char(1)                        default '1' not null,
   object_sql           CLOB                           null,
   constraint PK_Z_ALL_SQL primary key (object_name, object_oper, index_sql)
)
;

create table Z_CONTENTTYPE (
   id_contenttype       smallint                       not null,
   contenttype_text     varchar(50)                    not null,
   constraint PK_Z_CONTENTTYPE primary key (id_contenttype)
)
;

merge into Z_CONTENTTYPE z
using (
select 1 as id, 'image/png' as name from dual
union all
select 2 as id, 'image/jpeg' as name from dual
union all
select 3 as id, 'image/jpg' as name from dual
union all
select 4 as id, 'image/gif' as name from dual
union all
select 5 as id, 'image/tiff' as name from dual
union all
select 6 as id, 'image/svg+xml' as name from dual
union all
select 7 as id, 'image/vnd.microsoft.icon' as name from dual
union all
select 8 as id, 'image/jp2' as name from dual
union all
select 9 as id, 'image/bmp' as name from dual
union all
select 10 as id, 'image/webp' as name from dual
union all
select 65 as id, 'application/vnd.google-earth.kml+xml' as name from dual
union all
select 66 as id, 'application/gpx+xml' as name from dual
union all
select 67 as id, 'application/vnd.google-earth.kmz' as name from dual
union all
select 68 as id, 'application/xml' as name from dual
union all
select 69 as id, 'application/json' as name from dual
union all
select 70 as id, 'application/geo+json' as name from dual
union all
select 71 as id, 'application/vnd.sas.wikimapia.kml+xml' as name from dual
union all
select 72 as id, 'application/vnd.sas.wikimapia.kmz' as name from dual
union all
select 73 as id, 'application/vnd.sas.wikimapia.txt' as name from dual
union all
select 91 as id, 'text/html' as name from dual
union all
select 92 as id, 'text/plain' as name from dual
) c
on (c.id = z.id_contenttype)
when matched then update set contenttype_text = c.name
when not matched then insert (id_contenttype, contenttype_text) values (c.id, c.name)
;

create unique index Z_CONTENTTYPE_UNIQ on Z_CONTENTTYPE (
contenttype_text ASC
)
;



create table Z_OPTIONS (
   id_option            int                            not null,
   option_descript      varchar(255)                   not null,
   option_value         int                            not null,
   constraint PK_Z_OPTIONS primary key (id_option)
)
;

merge into Z_OPTIONS z
using (
select 1 as id, 'Autocreate services' as name, 0 as v from dual
union all
select 2 as id, 'Autocreate versions' as name, 0 as v from dual
union all
select 3 as id, 'Keep TILE for TNE' as name, 0 as v from dual
) c
on (c.id = z.id_option)
when matched then update set option_descript = c.name, option_value = c.v
when not matched then insert (id_option, option_descript, option_value) values (c.id, c.name, c.v)
;





create table Z_DIV_MODE (
   id_div_mode          char(1)                        not null,
   div_mode_name        varchar(30)                    not null,
   div_mask_width       smallint                       not null,
   constraint PK_Z_DIV_MODE primary key (id_div_mode)
)
;

merge into Z_DIV_MODE z
using (
select 'Z' as id, 'All-in-One' as name, 0 as v from dual
union all
select 'I' as id, 'Based on 1024' as name, 10 as v from dual
union all
select 'J' as id, 'Based on 2048' as name, 11 as v from dual
union all
select 'K' as id, 'Based on 4096' as name, 12 as v from dual
union all
select 'L' as id, 'Based on 8192' as name, 13 as v from dual
union all
select 'M' as id, 'Based on 16384' as name, 14 as v from dual
union all
select 'N' as id, 'Based on 32768' as name, 15 as v from dual
) c
on (c.id = z.id_div_mode)
when matched then update set div_mode_name = c.name, div_mask_width = c.v
when not matched then insert (id_div_mode, div_mode_name, div_mask_width) values (c.id, c.name, c.v)
;

create unique index Z_DIV_MODE_UNIQ on Z_DIV_MODE (
div_mode_name ASC
)
;





create table Z_VER_COMP (
   id_ver_comp          char(1)                        not null,
   ver_comp_field       varchar(30)                    not null,
   ver_comp_name        varchar(30)                    not null,
   constraint PK_Z_VER_COMP primary key (id_ver_comp)
)
;

merge into Z_VER_COMP z
using (
select '0' as id, '-' as name, 'No' as v from dual
union all
select 'I' as id, 'id_ver' as name, 'By id' as v from dual
union all
select 'V' as id, 'ver_value' as name, 'By value' as v from dual
union all
select 'D' as id, 'ver_date' as name, 'By date' as v from dual
union all
select 'N' as id, 'ver_number' as name, 'By number' as v from dual
) c
on (c.id = z.id_ver_comp)
when matched then update set ver_comp_field = c.name, ver_comp_name = c.v
when not matched then insert (id_ver_comp, ver_comp_field, ver_comp_name) values (c.id, c.name, c.v)
;

create unique index Z_VER_COMP_F_UNIQ on Z_VER_COMP (
ver_comp_field ASC
)
;

create unique index Z_VER_COMP_N_UNIQ on Z_VER_COMP (
ver_comp_name ASC
)
;





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
   auxillary_dat        TIMESTAMP                      null,
   auxillary_num        int                            null,
   constraint PK_Z_VER_BY_TILE primary key (id_ver_by_tile, tile_contenttype)
)
;

