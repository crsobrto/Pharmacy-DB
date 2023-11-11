DROP DATABASE Pharmacy;
CREATE DATABASE Pharmacy;
USE Pharmacy;

CREATE TABLE `employee` (
  `EmployeeID` varchar(10) NOT NULL,
  `Name` varchar(10) DEFAULT NULL,
  `Sex` varchar(10) DEFAULT NULL,
  `Age` varchar(10) DEFAULT NULL,
  `DOB` varchar(10) DEFAULT NULL,
  `Address` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `manufacturer` (
  `ManufacturerID` varchar(10) NOT NULL,
  `ManufacturerName` varchar(10) DEFAULT NULL,
  `Address` varchar(10) DEFAULT NULL,
  `PhoneNumber` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ManufacturerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `category` (
  `CategoryID` varchar(10) NOT NULL,
  `CategoryName` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `medications` (
  `SerialNumber` varchar(10) NOT NULL,
  `ManufacturerID` varchar(10) DEFAULT NULL,
  `MedicationName` varchar(10) DEFAULT NULL,
  `GenericName` varchar(10) DEFAULT NULL,
  `Description` varchar(10) DEFAULT NULL,
  `Strength` varchar(10) DEFAULT NULL,
  `ShelfPrice` varchar(10) DEFAULT NULL,
  `ManufacturerPrice` varchar(10) DEFAULT NULL,
  `CategoryID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`SerialNumber`),
  KEY `ManufacturerID_idx` (`ManufacturerID`),
  KEY `ManufacturerIDNum_idx` (`ManufacturerID`),
  KEY `CategoryID_idx` (`CategoryID`),
  CONSTRAINT `CategoryID` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`),
  CONSTRAINT `ManufacturerIDNum` FOREIGN KEY (`ManufacturerID`) REFERENCES `manufacturer` (`ManufacturerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `batchreports` (
  `BatchID` varchar(10) NOT NULL,
  `ManufacturerID` varchar(10) DEFAULT NULL,
  `SerialNumber` varchar(10) DEFAULT NULL,
  `Time` varchar(10) DEFAULT NULL,
  `Date` varchar(10) DEFAULT NULL,
  `Quantity` varchar(10) DEFAULT NULL,
  `TotalCost` varchar(10) DEFAULT NULL,
  `ExperationDate` varchar(10) DEFAULT NULL,
  `EmployeeID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`BatchID`),
  KEY `ManufacturerID_idx` (`ManufacturerID`),
  KEY `SerialNum_idx` (`SerialNumber`),
  KEY `EmployeeID_idx` (`EmployeeID`),
  CONSTRAINT `EmployeeID` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`),
  CONSTRAINT `ManufacturerID` FOREIGN KEY (`ManufacturerID`) REFERENCES `manufacturer` (`ManufacturerID`),
  CONSTRAINT `SerialNum` FOREIGN KEY (`SerialNumber`) REFERENCES `medications` (`SerialNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `inventory` (
  `InventoryID` varchar(10) NOT NULL,
  `BatchID` varchar(10) DEFAULT NULL,
  `Stock` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`InventoryID`),
  KEY `BatchID_idx` (`BatchID`),
  CONSTRAINT `BatchID` FOREIGN KEY (`BatchID`) REFERENCES `batchreports` (`BatchID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `inventory_out` (
  `InventoryID` varchar(10) NOT NULL,
  `BatchID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`InventoryID`),
  KEY `BatchID_idx` (`BatchID`),
  CONSTRAINT `BatchReportID` FOREIGN KEY (`BatchID`) REFERENCES `batchreports` (`BatchID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `patientlist` (
  `PatientID` varchar(10) NOT NULL,
  `Name` varchar(10) DEFAULT NULL,
  `Sex` varchar(10) DEFAULT NULL,
  `Age` varchar(10) DEFAULT NULL,
  `DOB` varchar(10) DEFAULT NULL,
  `PhoneNumber` varchar(10) DEFAULT NULL,
  `Address` varchar(10) DEFAULT NULL,
  `SSN` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `purchasehistory` (
  `PurchaseId` varchar(10) NOT NULL,
  `PatientID` varchar(10) DEFAULT NULL,
  `InventoryID` varchar(10) DEFAULT NULL,
  `SerialID` varchar(10) DEFAULT NULL,
  `Date` varchar(10) DEFAULT NULL,
  `TypeOfOrder` varchar(10) DEFAULT NULL,
  `Quantity` varchar(10) DEFAULT NULL,
  `TotalCost` varchar(10) DEFAULT NULL,
  `EmployeeID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`PurchaseId`),
  KEY `PatientID_idx` (`PatientID`),
  KEY `InventoryID_idx` (`InventoryID`),
  KEY `SerialID_idx` (`SerialID`),
  KEY `WorkerID_idx` (`EmployeeID`),
  CONSTRAINT `InventoryID` FOREIGN KEY (`InventoryID`) REFERENCES `inventory` (`InventoryID`),
  CONSTRAINT `PatientID` FOREIGN KEY (`PatientID`) REFERENCES `patientlist` (`PatientID`),
  CONSTRAINT `SerialID` FOREIGN KEY (`SerialID`) REFERENCES `medications` (`SerialNumber`),
  CONSTRAINT `WorkerID` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;