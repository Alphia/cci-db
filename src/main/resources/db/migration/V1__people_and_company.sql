create table app.app_company
(
    id             varchar(36) primary key,
    create_by      varchar(64) null,
    update_by      varchar(64) null,
    create_at      TIMESTAMP   null,
    update_at      TIMESTAMP   null,
    record_status  int4        null default 1,
    record_version int4        null default 1,
    name           varchar(32) not null,
    abbr           varchar(16) not null,
    boss           varchar(16) not null,
    phone          varchar(16) not null
);

comment on column app.app_company.id is '公司编号';
comment on column app.app_company.name is '公司名称';
comment on column app.app_company.abbr is '公司简称';
comment on column app.app_company.boss is '法人';
comment on column app.app_company.phone is '电话';

create table app.app_department
(
    id             varchar(36) primary key,
    create_by      varchar(64) null,
    update_by      varchar(64) null,
    create_at      TIMESTAMP   null,
    update_at      TIMESTAMP   null,
    record_status  int4        null default 1,
    record_version int4        null default 1,
    name           varchar(16) not null,
    company_id     varchar(32) not null,
    constraint fk_company_id foreign key (company_id) references app.app_company (id)
);
comment on column app.app_department.id is '部门编号';
comment on column app.app_department.name is '部门名称';
comment on column app.app_department.company_id is '所属公司';

create table app.app_employee
(
    id             varchar(36) primary key,
    create_by      varchar(64) null,
    update_by      varchar(64) null,
    create_at      TIMESTAMP   null,
    update_at      TIMESTAMP   null,
    record_status  int4        null default 1,
    record_version int4        null default 1,
    name           varchar(16) not null,
    phone          varchar(16) not null,
    position       varchar(16) not null,
    department_id  varchar(32) not null,
    company_id     varchar(32) not null,
    constraint fk_department_id foreign key (department_id) references app.app_company (id),
    constraint fk_company_id foreign key (company_id) references app.app_company (id)
);
comment on column app.app_employee.id is '编号';
comment on column app.app_employee.name is '姓名';
comment on column app.app_employee.phone is '电话';
comment on column app.app_employee.position is '职务';
comment on column app.app_employee.department_id is '部门';

create table app.app_device
(
    id             varchar(36) primary key,
    create_by      varchar(64) null,
    update_by      varchar(64) null,
    create_at      TIMESTAMP   null,
    update_at      TIMESTAMP   null,
    record_status  int4        null default 1,
    record_version int4        null default 1,
    name           varchar(16) not null,
    position       varchar(16) not null,
    department_id  varchar(32) ,
    company_id     varchar(32) not null,
    constraint fk_department_id foreign key (department_id) references app.app_company (id),
    constraint fk_company_id foreign key (company_id) references app.app_company (id)
);
comment on column app.app_device.id is '设备编号';
comment on column app.app_device.name is '设备名称';
comment on column app.app_device.position is '设备位置';
comment on column app.app_device.department_id is '所属部门';
comment on column app.app_device.company_id is '所属公司';

create table app.app_job
(
    id             varchar(36) primary key,
    create_by      varchar(64) null,
    update_by      varchar(64) null,
    create_at      TIMESTAMP   null,
    update_at      TIMESTAMP   null,
    record_status  int4        null default 1,
    record_version int4        null default 1,
    name           varchar(16) not null,
    position       varchar(16) not null,
    department_id  varchar(32) ,
    company_id     varchar(32) not null,
    constraint fk_department_id foreign key (department_id) references app.app_company (id),
    constraint fk_company_id foreign key (company_id) references app.app_company (id)
);
comment on column app.app_job.id is '作业编号';
comment on column app.app_job.name is '作业名称';
comment on column app.app_job.position is '作业位置';
comment on column app.app_job.department_id is '所属部门';
comment on column app.app_job.company_id is '所属公司';
