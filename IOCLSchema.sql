
CREATE database iocl;

USE iocl

CREATE TABLE `iocl_supported_userstatus` (
  `StatusId` int(11) NOT NULL,
  `UserStatus` varchar(25) NOT NULL,
  PRIMARY KEY (`StatusId`),
  UNIQUE KEY `UserStatus` (`UserStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `iocl_supported_quantitystatus` (
  `StatusId` int(11) NOT NULL,
  `QuantityStatus` varchar(25) NOT NULL,
  PRIMARY KEY (`StatusId`),
  UNIQUE KEY `QuantityStatus` (`QuantityStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `iocl_supported_userroles` (
  `RoleId` int(11) NOT NULL,
  `RoleName` varchar(50) NOT NULL,
  `ChildRoles` varchar(50) NOT NULL,
  PRIMARY KEY (`RoleId`),
  UNIQUE KEY `RoleName` (`RoleName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `iocl_supported_pinstatus` (
  `StatusId` int(11) NOT NULL,
  `FanPinStatus` varchar(25) NOT NULL,
  PRIMARY KEY (`StatusId`),
  UNIQUE KEY `FanPinStatus` (`FanPinStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `iocl_supported_locationstatus` (
  `StatusId` int(11) NOT NULL,
  `LocationStatus` varchar(25) NOT NULL,
  PRIMARY KEY (`StatusId`),
  UNIQUE KEY `LocationStatus` (`LocationStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `iocl_supported_contractorstatus` (
  `StatusId` int(11) NOT NULL,
  `ContractorStatus` varchar(25) NOT NULL,
  PRIMARY KEY (`StatusId`),
  UNIQUE KEY `ContractorStatus` (`ContractorStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `iocl_supported_baytypes` (
  `RecId` int(11) NOT NULL AUTO_INCREMENT,
  `TypeId` int(11) NOT NULL,
  `BayType` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`RecId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `iocl_supported_baystatus` (
  `StatusId` int(11) NOT NULL,
  `BayFunctionalStatus` varchar(25) NOT NULL,
  PRIMARY KEY (`StatusId`),
  UNIQUE KEY `BayFunctionalStatus` (`BayFunctionalStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `iocl_supported_bayoperationalstatus` (
  `StatusId` int(11) NOT NULL,
  `OperationalStatus` varchar(25) NOT NULL,
  PRIMARY KEY (`StatusId`),
  UNIQUE KEY `OperationalStatus` (`OperationalStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `iocl_states_details` (
  `StateId` int(11) NOT NULL AUTO_INCREMENT,
  `StateName` varchar(50) NOT NULL,
  PRIMARY KEY (`StateId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `iocl_userprivileges_mapping` (
  `PrivilegeId` int(11) NOT NULL AUTO_INCREMENT,
  `UserRoleId` int(11) NOT NULL,
  `PrivilegesName` varchar(100) NOT NULL,
  PRIMARY KEY (`PrivilegeId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `iocl_user_details` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(50) NOT NULL,
  `UserFirstName` varchar(50) NOT NULL,
  `UserLastName` varchar(50) NOT NULL,
  `UserDOB` date NOT NULL,
  `UserAadharNum` varchar(50) NOT NULL,
  `UserMobileNum` varchar(50) NOT NULL,
  `UserPassword` varchar(50) NOT NULL,
  `UserCreatedOn` datetime DEFAULT NULL,
  `UserUpdatedOn` datetime DEFAULT NULL,
  `UserDeletedOn` datetime DEFAULT NULL,
  `UserUpdatedBy` int(11) DEFAULT NULL,
  `UserCreatedBy` int(11) DEFAULT NULL,
  `UserStatusId` int(11) NOT NULL,
  `PwdExpiryDate` datetime NOT NULL,
  PRIMARY KEY (`UserId`),
  KEY `UserStatusId` (`UserStatusId`),
  CONSTRAINT `iocl_user_details_ibfk_1` FOREIGN KEY (`UserStatusId`) REFERENCES `iocl_supported_userstatus` (`StatusId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;


CREATE TABLE `iocl_userrole_mapping` (
  `RecId` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `UserTypeId` int(11) NOT NULL,
  PRIMARY KEY (`RecId`),
  KEY `UserTypeId` (`UserTypeId`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `iocl_userrole_mapping_ibfk_1` FOREIGN KEY (`UserTypeId`) REFERENCES `iocl_supported_userroles` (`RoleId`),
  CONSTRAINT `iocl_userrole_mapping_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `iocl_user_details` (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `iocl_truckregistration_details` (
  `TruckId` int(11) NOT NULL AUTO_INCREMENT,
  `TruckNo` varchar(25) NOT NULL,
  `DriverName` varchar(25) NOT NULL,
  `DriverLicNo` varchar(25) NOT NULL,
  `Customer` varchar(10) NOT NULL,
  `MobileNumber` varchar(15) NOT NULL,
  PRIMARY KEY (`TruckId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `iocl_contractortype_details` (
  `ContractorTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `ContractorType` varchar(50) NOT NULL,
  PRIMARY KEY (`ContractorTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `iocl_contractor_details` (
  `ContractorId` int(11) NOT NULL AUTO_INCREMENT,
  `ContractorName` varchar(25) DEFAULT NULL,
  `ContractorTypeId` int(11) NOT NULL,
  `ContractorAddress` varchar(25) DEFAULT NULL,
  `ContractorCity` varchar(25) DEFAULT NULL,
  `ContractorStateId` int(11) NOT NULL,
  `ZipCode` varchar(25) DEFAULT NULL,
  `ContractorStatusId` int(11) NOT NULL,
  `ContractorUpdatedBy` int(11) DEFAULT NULL,
  `ContractorCreatedBy` int(11) DEFAULT NULL,
  `ContractorUpdatedOn` datetime DEFAULT NULL,
  `ContractorCreatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`ContractorId`),
  KEY `ContractorStatusId` (`ContractorStatusId`),
  KEY `ContractorTypeId` (`ContractorTypeId`),
  KEY `ContractorStateId` (`ContractorStateId`),
  CONSTRAINT `iocl_contractor_details_ibfk_1` FOREIGN KEY (`ContractorStatusId`) REFERENCES `iocl_supported_contractorstatus` (`StatusId`),
  CONSTRAINT `iocl_contractor_details_ibfk_2` FOREIGN KEY (`ContractorTypeId`) REFERENCES `iocl_contractortype_details` (`ContractorTypeId`),
  CONSTRAINT `iocl_contractor_details_ibfk_3` FOREIGN KEY (`ContractorStateId`) REFERENCES `iocl_states_details` (`StateId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;


CREATE TABLE `iocl_location_details` (
  `LocationID` int(11) NOT NULL AUTO_INCREMENT,
  `LocationName` varchar(50) DEFAULT NULL,
  `LocationCode` varchar(50) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `LocationStatusId` int(11) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `PinCode` varchar(50) DEFAULT NULL,
  `StateId` int(11) DEFAULT NULL,
  `LocationUpdatedBy` int(11) DEFAULT NULL,
  `LocationCreatedBy` int(11) DEFAULT NULL,
  `LocationUpdatedOn` datetime DEFAULT NULL,
  `LocationCreatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`LocationID`),
  KEY `LocationStatusId` (`LocationStatusId`),
  KEY `StateId` (`StateId`),
  CONSTRAINT `iocl_location_details_ibfk_1` FOREIGN KEY (`LocationStatusId`) REFERENCES `iocl_supported_locationstatus` (`StatusId`),
  CONSTRAINT `iocl_location_details_ibfk_2` FOREIGN KEY (`StateId`) REFERENCES `iocl_states_details` (`StateId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

CREATE TABLE `iocl_quantities_details` (
  `QuantityId` int(11) NOT NULL AUTO_INCREMENT,
  `QuantityName` varchar(25) DEFAULT NULL,
  `Quantity` varchar(25) DEFAULT NULL,
  `QuantityUnits` varchar(25) DEFAULT NULL,
  `QuantityStatusId` int(11) DEFAULT NULL,
  `QuantityUpdatedBy` int(11) DEFAULT NULL,
  `QuantityCreatedBy` int(11) DEFAULT NULL,
  `QuantityUpdatedOn` datetime DEFAULT NULL,
  `QuantityCreatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`QuantityId`),
  KEY `QuantityStatusId` (`QuantityStatusId`),
  CONSTRAINT `iocl_quantities_details_ibfk_1` FOREIGN KEY (`QuantityStatusId`) REFERENCES `iocl_supported_quantitystatus` (`StatusId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

CREATE TABLE `iocl_bc_bayoperations` (
  `RecId` int(11) NOT NULL AUTO_INCREMENT,
  `BCInputTime` datetime NOT NULL,
  `BCUpdateTime` datetime DEFAULT NULL,
  `FanPin` varchar(50) NOT NULL,
  `BayNum` int(11) NOT NULL,
  `OperationalStatusId` int(11) DEFAULT NULL,
  `BcControllerId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`RecId`),
  KEY `OperationalStatusId` (`OperationalStatusId`),
  CONSTRAINT `iocl_bc_bayoperations_ibfk_1` FOREIGN KEY (`OperationalStatusId`) REFERENCES `iocl_supported_bayoperationalstatus` (`StatusId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `iocl_bc_audit_bayoperations` (
  `RecId` int(11) NOT NULL AUTO_INCREMENT,
  `BCInputTime` datetime NOT NULL,
  `FanPin` varchar(50) NOT NULL,
  `BayNum` int(11) NOT NULL,
  `OperationalStatus` varchar(50) NOT NULL,
  `BcControllerId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`RecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `iocl_bay_details` (
  `BayId` int(11) NOT NULL AUTO_INCREMENT,
  `BayName` varchar(25) NOT NULL,
  `BayNum` int(11) NOT NULL,
  `FunctionalStatusId` int(11) NOT NULL,
  PRIMARY KEY (`BayId`),
  UNIQUE KEY `BayNum` (`BayNum`),
  KEY `FunctionalStatusId` (`FunctionalStatusId`),
  CONSTRAINT `iocl_bay_details_ibfk_1` FOREIGN KEY (`FunctionalStatusId`) REFERENCES `iocl_supported_baystatus` (`StatusId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `iocl_bay_types` (
  `RecId` int(11) NOT NULL AUTO_INCREMENT,
  `BayId` int(11) NOT NULL,
  `BayTypeId` int(11) NOT NULL,
  PRIMARY KEY (`RecId`),
  KEY `BayId` (`BayId`),
  CONSTRAINT `iocl_bay_types_ibfk_1` FOREIGN KEY (`BayId`) REFERENCES `iocl_bay_details` (`BayId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `iocl_fanslip_details` (
  `FanId` int(11) NOT NULL AUTO_INCREMENT,
  `TruckId` int(11) NOT NULL,
  `FanPin` varchar(50) NOT NULL,
  `BayNo` int(11) NOT NULL,
  `Quantity` varchar(50) NOT NULL,
  `VehicleWgt` varchar(50) NOT NULL,
  `Destination` varchar(50) NOT NULL,
  `LocationID` int(11) NOT NULL,
  `ContractorID` int(11) NOT NULL,
  `QuantityID` int(11) NOT NULL,
  `FANPinStatusId` int(11) NOT NULL,
  `FanUpdatedBy` int(11) DEFAULT NULL,
  `FanCreatedBy` int(11) NOT NULL,
  `FanUpdatedOn` datetime DEFAULT NULL,
  `FanCreationOn` datetime NOT NULL,
  `FanExpirationOn` datetime NOT NULL,
  `bcinputtime` datetime DEFAULT NULL,
  `bccompletedtime` datetime DEFAULT NULL,
  `comments` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`FanId`),
  KEY `ContractorID` (`ContractorID`),
  KEY `LocationID` (`LocationID`),
  KEY `FANPinStatusId` (`FANPinStatusId`),
  KEY `iocl_fanslip_details_ibfk_4` (`QuantityID`),
  CONSTRAINT `iocl_fanslip_details_ibfk_1` FOREIGN KEY (`ContractorID`) REFERENCES `iocl_contractor_details` (`ContractorId`),
  CONSTRAINT `iocl_fanslip_details_ibfk_2` FOREIGN KEY (`LocationID`) REFERENCES `iocl_location_details` (`LocationID`),
  CONSTRAINT `iocl_fanslip_details_ibfk_3` FOREIGN KEY (`FANPinStatusId`) REFERENCES `iocl_supported_pinstatus` (`StatusId`),
  CONSTRAINT `iocl_fanslip_details_ibfk_4` FOREIGN KEY (`QuantityID`) REFERENCES `iocl_quantities_details` (`QuantityId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
