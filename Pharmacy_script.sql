DROP DATABASE Pharmacy;
CREATE DATABASE Pharmacy;
USE Pharmacy;

-- Creating tables
CREATE TABLE `employee` (
  `EmployeeID` INTEGER NOT NULL,
  `FirstName` varchar(10) DEFAULT NULL,
  `LastName` varchar(10) DEFAULT NULL,
  `Sex` varchar(1) DEFAULT NULL,
  `Age` INTEGER DEFAULT NULL,
  `DOB` varchar(10) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `manufacturer` (
  `ManufacturerID` INTEGER NOT NULL,
  `ManufacturerName` varchar(20) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ManufacturerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `category` (
  `CategoryID` INTEGER NOT NULL,
  `CategoryName` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `medications` (
  `SerialNumber` INTEGER NOT NULL,
  `ManufacturerID` INTEGER DEFAULT NULL,
  `MedicationName` varchar(10) DEFAULT NULL,
  `GenericName` varchar(15) DEFAULT NULL,
  `Description` varchar(10) DEFAULT NULL,
  `Strength` varchar(5) DEFAULT NULL,
  `ShelfPrice` varchar(10) DEFAULT NULL,
  `ManufacturerPrice` varchar(10) DEFAULT NULL,
  `CategoryID` INTEGER DEFAULT NULL,
  PRIMARY KEY (`SerialNumber`),
  KEY `ManufacturerID_idx` (`ManufacturerID`),
  KEY `ManufacturerIDNum_idx` (`ManufacturerID`),
  KEY `CategoryID_idx` (`CategoryID`),
  CONSTRAINT `CategoryID` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`),
  CONSTRAINT `ManufacturerIDNum` FOREIGN KEY (`ManufacturerID`) REFERENCES `manufacturer` (`ManufacturerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `batchreports` (
  `BatchID` varchar(10) NOT NULL,
  `ManufacturerID` INTEGER DEFAULT NULL,
  `SerialNumber` int(10) DEFAULT NULL,
  `Time` varchar(10) DEFAULT NULL,
  `Date` varchar(10) DEFAULT NULL,
  `Quantity` varchar(10) DEFAULT NULL,
  `TotalCost` varchar(10) DEFAULT NULL,
  `ExperationDate` varchar(10) DEFAULT NULL,
  `EmployeeID` INTEGER DEFAULT NULL,
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
  `PatientID` INTEGER NOT NULL,
  `FirstName` varchar(10) DEFAULT NULL,
  `LastName` varchar(10) DEFAULT NULL,
  `Sex` varchar(1) DEFAULT NULL,
  `Age` int(10) DEFAULT NULL,
  `DOB` varchar(10) DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `SSN` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `purchasehistory` (
  `PurchaseId` varchar(10) NOT NULL,
  `PatientID` INTEGER DEFAULT NULL,
  `InventoryID` varchar(10) DEFAULT NULL,
  `SerialID` INTEGER DEFAULT NULL,
  `Date` varchar(10) DEFAULT NULL,
  `TypeOfOrder` varchar(10) DEFAULT NULL,
  `Quantity` varchar(10) DEFAULT NULL,
  `TotalCost` varchar(10) DEFAULT NULL,
  `EmployeeID` INTEGER DEFAULT NULL,
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



-- Adding data to tables
INSERT INTO PatientList VALUES(1020, 'John', 'Freeman', 'M', 36, '02/15/1987', '(470) 965-3841', '141 E Cherry Street', '670-54-2946');
INSERT INTO PatientList VALUES(1036, 'Jackie', 'Moon', 'F', 42, '05/22/1981', '(470) 365-4817', '236 Sunset Boulevard', '452-98-1679');
INSERT INTO PatientList VALUES(1145, 'Charles', 'Fletcher', 'M', 65, '07/16/1958', '(470) 293-5465', '741 Adams Road', '125-32-0163');
INSERT INTO PatientList VALUES(1063, 'Mary', 'Smith', 'F', 70, '01/23/1953', '(470) 526-4820', '101 Rivocean Drive', '510-63-5819');
INSERT INTO PatientList VALUES(1042, 'Ellie', 'Jenkins', 'F', 24, '08/21/1999', '(470) 328-9816', '430 Mark Lane', '250-58-3169');
INSERT INTO PatientList VALUES(1326, 'Frank', 'Bazemore', 'M', 39, '04/02/1984', '(470) 710-3942', '1140 Larrytown Road', '432-12-9647');
INSERT INTO PatientList VALUES(1080, 'Gustavo', 'Escuela', 'M', 20, '06/25/2003', '(470) 538-6185', '645 Atlantic Avenue', '481-20-5346');
INSERT INTO PatientList VALUES(1247, 'Steve', 'Williams', 'M', 50, '09/14/1973', '(470) 515-7290', '102 Hillshire Drive', '323-14-0517');
INSERT INTO PatientList VALUES(1202, 'Bill', 'Upton', 'M', 55, '03/18/1968', '(470) 326-7158', '780 Main Street', '167-65-4352');
INSERT INTO PatientList VALUES(1018, 'Denise', 'McReary', 'F', 21, '08/25/2002', '(470) 585-1492', '140 Clinton Boulevard', '435-62-4780');
INSERT INTO PatientList VALUES(1312, 'Kiki', 'Daniels', 'F', 32, '11/17/1991', '(470) 565-8123', '3016 Wallace Way', '601-54-2593');
INSERT INTO PatientList VALUES(1425, 'Carmen', 'Ortiz', 'F', 46, '09/08/1977', '(470) 740-1683', '850 Henry Road', '712-64-2461');
INSERT INTO PatientList VALUES(1067, 'Nathan', 'Sullivan', 'M', 67, '06/24/1956', '(470) 985-6216', '613 Old Street', '582-34-7161');
INSERT INTO PatientList VALUES(1027, 'Jerry', 'Fillmore', 'M', 53, '10/10/1970', '(470) 245-7363', '716 Grand Lane', '510-31-6257');
INSERT INTO PatientList VALUES(1443, 'Greg', 'Daniels', 'M', 44, '12/30/1979', '(470) 656-4137', '360 Bull Avenue', '467-52-1675');
INSERT INTO PatientList VALUES(1572, 'Hugo', 'Johnson', 'M', 38, '03/28/1985', '(470) 948-2638', '289 Circuit Street', '493-05-5681');
INSERT INTO PatientList VALUES(1362, 'Donna', 'Summers', 'F', 26, '07/25/1997', '(470) 859-7619', '217 Worth Circle', '301-23-4768');
INSERT INTO PatientList VALUES(1245, 'Rachel', 'Ray', 'F', 41, '04/12/1982', '(470) 320-1767', '921 Lot Avenue', '164-93-4285');
INSERT INTO PatientList VALUES(1205, 'Katelyn', 'Marsh', 'F', 23, '02/18/2000', '(470) 949-5369', '2014 Angle Road', '760-14-6813');
INSERT INTO PatientList VALUES(1345, 'Sarah', 'Monroe', 'F', 48, '06/29/1975', '(470) 510-6472', '460 Play Street', '842-35-4073');

-- SELECT * FROM PatientList;

INSERT INTO Employee VALUES(5001, 'Marcus', 'Lightfoot', 'M', 25, '03/03/1998', '240 Marilyn Drive');
INSERT INTO Employee VALUES(5008, 'Carrie', 'Blunt', 'F', 18, '12/28/2005', '701 Kane Street');
INSERT INTO Employee VALUES(5016, 'Henry', 'Jarrolds', 'M', 32, '05/17/1991', '630 Roy Avenue');
INSERT INTO Employee VALUES(5024, 'Greg', 'Bryant', 'M', 34, '10/15/1989', '425 East Crane Avenue');
INSERT INTO Employee VALUES(5005, 'Vera', 'Scott', 'F', 21, '01/23/2002', '356 Jane Drive');
INSERT INTO Employee VALUES(5061, 'Jasmine', 'Miles', 'F', 35, '04/21/1988', '101 Lock Boulevard');
INSERT INTO Employee VALUES(5053, 'Elizabeth', 'Pines', 'F', 26, '09/14/1997', '264 Grant Drive');
INSERT INTO Employee VALUES(5041, 'Hope', 'Redmond', 'F', 36, '08/30/1987', '945 Dogwood Circle');
INSERT INTO Employee VALUES(5072, 'Desmond', 'Phillips', 'M', 40, '01/25/1983', '360 Battle Drive');
INSERT INTO Employee VALUES(5036, 'Ned', 'Walker', 'M', 45, '06/13/1978', '890 Yellow Road');

-- SELECT * FROM Employee;

INSERT INTO Manufacturer VALUES(9044, 'GlaxoSmithKline', '410 Blackwell Street', '(800) 245-1041');
INSERT INTO Manufacturer VALUES(9037, 'Organon & Co.', '30 Hudson Street', '(551) 430-6000');
INSERT INTO Manufacturer VALUES(9042, 'Amneal', '400 Crossing Boulevard', '(908) 947-3120');
INSERT INTO Manufacturer VALUES(9055, 'Validus', '90 East Halsey Road', '(866) 982-5438');
INSERT INTO Manufacturer VALUES(9033, 'Parke-Davis', '870 Parkdale Road', '(201) 540-2000');
INSERT INTO Manufacturer VALUES(9158, 'Concordia', '612 Southeast 5th Avenue', '(954) 320-9990');
INSERT INTO Manufacturer VALUES(9321, 'USAntibiotics', '201 Industrial Drive', '(423) 274-3300');
INSERT INTO Manufacturer VALUES(9426, 'Pfizer', '66 Hudson Boulevard', '(800) 879-3477');
INSERT INTO Manufacturer VALUES(9165, 'Bayer', '100 Bayer Boulevard', '(862) 404-3000');
INSERT INTO Manufacturer VALUES(9618, 'Sun', '1 Western Express Highway', '(741) 564-9820');
INSERT INTO Manufacturer VALUES(9572, 'Otsuka', '508 Carnegie Center Drive', '(609) 524-6788');
INSERT INTO Manufacturer VALUES(9730, 'Allergan', '5 Giralda Farms', '(862) 261-8700');
INSERT INTO Manufacturer VALUES(9846, 'Vanda', '2200 Pennsylvania Avenue Northwest', '(202) 734-3400');

-- SELECT * FROM Manufacturer;

INSERT INTO Category VALUES(8010, 'Antimigraine Agents');
INSERT INTO Category VALUES(8045, 'Antidepressants');
INSERT INTO Category VALUES(8073, 'Cardiovascular Agents');
INSERT INTO Category VALUES(8023, 'Antibacterials');
INSERT INTO Category VALUES(8066, 'Bipolar Agents');

-- SELECT * FROM Category;