create table app.app_risk_type
(
    id             varchar(36) primary key,
    create_by      varchar(64) null,
    update_by      varchar(64) null,
    create_at      TIMESTAMP   null,
    update_at      TIMESTAMP   null,
    record_status  int4        null default 1,
    record_version int4        null default 1,
    name           varchar(16) not null
);
comment on column app.app_risk_type.id is '风险类型编号';
comment on column app.app_risk_type.name is '风险类型名称';

create table app.app_accident_type
(
    id             varchar(36) primary key,
    create_by      varchar(64) null,
    update_by      varchar(64) null,
    create_at      TIMESTAMP   null,
    update_at      TIMESTAMP   null,
    record_status  int4        null default 1,
    record_version int4        null default 1,
    name           varchar(16) not null
);
comment on column app.app_risk_type.name is '事故类型名称';
comment on column app.app_risk_type.id is '事故类型编号';

create table app.app_risk_level
(
    id             varchar(36) primary key,
    create_by      varchar(64) null,
    update_by      varchar(64) null,
    create_at      TIMESTAMP   null,
    update_at      TIMESTAMP   null,
    record_status  int4        null default 1,
    record_version int4        null default 1,
    name           varchar(16) not null
);
comment on column app.app_risk_level.id is '风险等级编号';
comment on column app.app_risk_level.name is '风险等级名称';


create table app.app_risk
(
    id                   varchar(36) primary key,
    create_by            varchar(64) null,
    update_by            varchar(64) null,
    create_at            TIMESTAMP   null,
    update_at            TIMESTAMP   null,
    record_status        int4        null default 1,
    record_version       int4        null default 1,
    name                 varchar(64) not null,
    code                 varchar(16) not null,
    device_id            varchar(36),
    job_id          varchar(36),
    company_in_charge_id varchar(36) not null,
    employee_id  varchar(36) not null,
    accident_type_codes  varchar(200),
    risk_level_id      varchar(16) not null,
    pic_uri              varchar(200),
    video_uri            varchar(200),
    remark               varchar(500),
    constraint fk_device_id foreign key(device_id) references app.app_device(id),
    constraint fk_job_id foreign key(job_id) references app.app_job(id),
    constraint fk_company_id foreign key(company_in_charge_id) references app.app_company(id),
    constraint fk_employee_id foreign key(employee_id) references app.app_employee(id),
    constraint fk_risk_level_id foreign key(risk_level_id) references app.app_risk_level(id)

);
comment on column app.app_risk.id is '风险点编号';
comment on column app.app_risk.name is '风险点名称';
comment on column app.app_risk.code is '风险点编码';
comment on column app.app_risk.device_id is '风险点设备id';
comment on column app.app_risk.job_id is '风险点活动id';
comment on column app.app_risk.company_in_charge_id is '责任单位';
comment on column app.app_risk.employee_id is '责任人';
comment on column app.app_risk.accident_type_codes is '可能的事故';
comment on column app.app_risk.risk_level_id is '风险等级';
comment on column app.app_risk.pic_uri is '风险图片链接';
comment on column app.app_risk.video_uri is '风险监控链接';
comment on column app.app_risk.remark is '备注';
