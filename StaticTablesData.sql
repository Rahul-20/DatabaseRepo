use iocl;

insert into iocl_supported_userstatus (StatusId,UserStatus) values(1,'Active');
insert into iocl_supported_userstatus (StatusId,UserStatus) values(2,'Not Active');
insert into iocl_supported_userstatus (StatusId,UserStatus) values(3,'Locked');

insert into iocl_supported_userroles (RoleId,RoleName,ChildRoles) values (1,'Super Admin','1,2,3,4');
insert into iocl_supported_userroles (RoleId,RoleName,ChildRoles) values (2,'Admin','2,3,4');
insert into iocl_supported_userroles (RoleId,RoleName,ChildRoles) values (3,'Supervisor','3,4');
insert into iocl_supported_userroles (RoleId,RoleName,ChildRoles) values (4,'TTES Operator','4');

insert into iocl_userprivileges_mapping (UserRoleId,PrivilegesName) values (1,'Bay');
insert into iocl_userprivileges_mapping (UserRoleId,PrivilegesName) values (1,'Users');
insert into iocl_userprivileges_mapping (UserRoleId,PrivilegesName) values (1,'Contractors');
insert into iocl_userprivileges_mapping (UserRoleId,PrivilegesName) values (1,'Locations');
insert into iocl_userprivileges_mapping (UserRoleId,PrivilegesName) values (1,'Quantity');
insert into iocl_userprivileges_mapping (UserRoleId,PrivilegesName) values (2,'Bay');
insert into iocl_userprivileges_mapping (UserRoleId,PrivilegesName) values (2,'Users');
insert into iocl_userprivileges_mapping (UserRoleId,PrivilegesName) values (2,'Contractors');
insert into iocl_userprivileges_mapping (UserRoleId,PrivilegesName) values (2,'Locations');
insert into iocl_userprivileges_mapping (UserRoleId,PrivilegesName) values (2,'Quantity');
insert into iocl_userprivileges_mapping (UserRoleId,PrivilegesName) values (2,'Reports');
insert into iocl_userprivileges_mapping (UserRoleId,PrivilegesName) values (3,'Users');
insert into iocl_userprivileges_mapping (UserRoleId,PrivilegesName) values (3,'Truck Operations');
insert into iocl_userprivileges_mapping (UserRoleId,PrivilegesName) values (4,'Truck Operations');


insert into iocl_user_details
(UserName,UserFirstName,UserLastName,UserDOB,UserAadharNum,UserMobileNum,UserPassword,UserCreatedOn,UserUpdatedOn,UserDeletedOn,UserStatusId,PwdExpiryDate)
VALUES
('IOCLAdmin','IOCL','IOCL','2017-08-31','9191902192001','99999999999','58dc147a1bee6df62f2bad5e5664cfddf670d381','2017-08-31 15:08:22',null,null,1,'2025-08-31');

insert into iocl_userrole_mapping (UserId,UserTypeId) values (1,1);

insert into iocl_supported_baystatus(StatusId,BayFunctionalStatus) values(1,'Active');
insert into iocl_supported_baystatus(StatusId,BayFunctionalStatus) values(2,'Not Active');
insert into iocl_supported_baystatus(StatusId,BayFunctionalStatus) values(3,'Maintenance');


insert into iocl_supported_baytypes(TypeId,BayType) values(1,'LPG');

insert into iocl_supported_pinstatus(StatusId,FanPinStatus) values(1,'Created');
insert into iocl_supported_pinstatus(StatusId,FanPinStatus) values(2,'Expired');
insert into iocl_supported_pinstatus(StatusId,FanPinStatus) values(3,'Cancelled');
insert into iocl_supported_pinstatus(StatusId,FanPinStatus) values(4,'InProgress');
insert into iocl_supported_pinstatus(StatusId,FanPinStatus) values(5,'Completed');


insert into iocl_supported_quantitystatus values(1,'Active');
insert into iocl_supported_quantitystatus values(2,'Not Active');


insert into iocl_supported_contractorstatus values(1,'Active');
insert into iocl_supported_contractorstatus values(2,'Not Active');


insert into iocl_supported_locationstatus values(1,'Active');
insert into iocl_supported_locationstatus values(2,'Not Active');

insert into iocl_supported_bayoperationalstatus(StatusId,OperationalStatus) values (1,'InProgress');
insert into iocl_supported_bayoperationalstatus(StatusId,OperationalStatus) values (2,'Pause');
insert into iocl_supported_bayoperationalstatus(StatusId,OperationalStatus) values (3,'Terminate');
insert into iocl_supported_bayoperationalstatus(StatusId,OperationalStatus) values (4,'ErrorOut');
insert into iocl_supported_bayoperationalstatus(StatusId,OperationalStatus) values (5,'Completed');
