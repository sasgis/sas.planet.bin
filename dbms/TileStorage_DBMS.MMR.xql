create table X_%SVC% (
   id_ver               smallint                       not null,
   ver_value            varchar(50)                    not null,
   ver_date             TIMESTAMP                      not null,
   ver_number           int                            default 0 not null,
   ver_comment          varchar(255)                   null,
   constraint PK_X_%SVC% primary key (id_ver)
)
;

create unique index ZX_%SVC% on X_%SVC% (
ver_value ASC
)
;




create table Y_%SVC% (
   id_common_tile       smallint                       not null,
   id_common_type       smallint                       not null,
   common_size          int                            not null,
   common_body          BLOB                           null,
   constraint PK_Y_%SVC% primary key (id_common_tile)
)
;

create index ZY_%SVC% on Y_%SVC% (
id_common_type ASC,
common_size ASC
)
;




create table "%Z%%HX%%DIV%%HY%_%SVC%" (
   x                    numeric                        not null,
   y                    numeric                        not null,
   id_ver               smallint                       not null,
   tile_size            int                            default 0 not null,
   id_contenttype       smallint                       not null,
   load_date            TIMESTAMP                      default LOCALTIMESTAMP not null,
   tile_body            BLOB                           null,
   constraint PK_%Z%%HX%%DIV%%HY%_%SVC% primary key (x, y, id_ver)
)
;

create index ZZ_%Z%%HX%%DIV%%HY%_%SVC% on "%Z%%HX%%DIV%%HY%_%SVC%" (
x ASC,
y ASC,
id_ver ASC,
tile_size ASC
)
;

