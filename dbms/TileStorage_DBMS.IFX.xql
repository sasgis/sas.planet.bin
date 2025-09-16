create table X_%SVC% (
   id_ver               smallint                       not null,
   ver_value            varchar(50)                    not null,
   ver_date             DATETIME YEAR TO FRACTION      not null,
   ver_number           int                            default 0 not null,
   ver_comment          varchar(255)                   null,
   primary key (id_ver) constraint PK_X_%SVC%
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
   common_body          BYTE                           null,
   primary key (id_common_tile) constraint PK_Y_%SVC%
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
   load_date            DATETIME YEAR TO FRACTION      default CURRENT not null,
   tile_body            BYTE                           null,
   primary key (x, y, id_ver) constraint PK_%Z%%HX%%DIV%%HY%_%SVC%
)
;

create index ZZ_%Z%%HX%%DIV%%HY%_%SVC% on "%Z%%HX%%DIV%%HY%_%SVC%" (
x ASC,
y ASC,
id_ver ASC,
tile_size ASC
)
;

