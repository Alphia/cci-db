create table station
(
    id     serial primary key,
    code   text,
    name   text,
    pinyin text
);
create table app.app_risk_type
(
    id             varchar(36) primary key,
    tp__id         varchar(36) null,
    create_by      varchar(64) null,
    update_by      varchar(64) null,
    create_at      TIMESTAMP null,
    update_at      TIMESTAMP null,
    record_status  int4 null default 1,
    record_version int4 null default 1,
    name           varchar(16) not null,
    code           varchar(16) not null,
)

