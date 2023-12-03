DROP DATABASE Pharmacy;
CREATE DATABASE Pharmacy;
USE Pharmacy;
DROP FUNCTION IF EXISTS getProfit;
DROP FUNCTION IF EXISTS calculateProfit;

-- Creating tables
CREATE TABLE `employee` (
  `employeeID` INTEGER NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(10) DEFAULT NULL,
  `LastName` varchar(10) DEFAULT NULL,
  `Sex` varchar(1) DEFAULT NULL,
  `Age` INTEGER DEFAULT NULL,
  `DOB` Date DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`employeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `manufacturer` (
  `manufacturerID` INTEGER NOT NULL AUTO_INCREMENT,
  `manufacturerName` varchar(20) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`manufacturerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `category` (
  `categoryID` INTEGER NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `medications` (
  `SerialNumber` INTEGER NOT NULL AUTO_INCREMENT,
  `manufacturerID` INTEGER DEFAULT NULL,
  `MedicationName` varchar(10) DEFAULT NULL,
  `GenericName` varchar(25) DEFAULT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `Strength` varchar(5) DEFAULT NULL,
  `ShelfPrice` DECIMAL(10,2) DEFAULT NULL,
  `manufacturerPrice` DECIMAL(10,2) DEFAULT NULL,
  `categoryID` INTEGER DEFAULT NULL,
  PRIMARY KEY (`SerialNumber`),
  KEY `manufacturerID_idx` (`manufacturerID`),
  KEY `manufacturerIDNum_idx` (`manufacturerID`),
  KEY `categoryID_idx` (`categoryID`),
  CONSTRAINT `categoryID` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`)on delete set null,
  CONSTRAINT `manufacturerIDNum` FOREIGN KEY (`manufacturerID`) REFERENCES `manufacturer` (`manufacturerID`)on delete set null
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `batchreports` (
  `BatchID` INTEGER NOT NULL,
  `manufacturerID` INTEGER DEFAULT NULL,
  `SerialNumber` INTEGER DEFAULT NULL,
  `Time` varchar(5) DEFAULT NULL,
  `ConfirmationDate` Date DEFAULT NULL,
  `Quantity` INTEGER DEFAULT NULL,
  `TotalCost` DECIMAL(10,2) DEFAULT NULL,
  `ExpirationDate` varchar(10) DEFAULT NULL,
  `employeeID` INTEGER DEFAULT NULL,
  PRIMARY KEY (`BatchID`),
  KEY `manufacturerID_idx` (`manufacturerID`),
  KEY `SerialNum_idx` (`SerialNumber`),
  KEY `employeeID_idx` (`employeeID`),
  CONSTRAINT `employeeID` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`) on delete set null,
  CONSTRAINT `manufacturerID` FOREIGN KEY (`manufacturerID`) REFERENCES `manufacturer` (`manufacturerID`)on delete set null,
  CONSTRAINT `SerialNum` FOREIGN KEY (`SerialNumber`) REFERENCES `medications` (`SerialNumber`)on delete set null
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `inventory` (
  `inventoryID` INTEGER NOT NULL AUTO_INCREMENT,
  `BatchID` INTEGER DEFAULT NULL,
  `Stock` INTEGER DEFAULT NULL,
	`Deleted` bit default 0,
    `SerialNumber` INTEGER DEFAULT NULL,
  PRIMARY KEY (`inventoryID`),
  KEY `BatchID_idx` (`BatchID`),
  CONSTRAINT `BatchID` FOREIGN KEY (`BatchID`) REFERENCES `batchreports` (`BatchID`)on delete set null
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `inventory_out` (
  `inventoryID` INTEGER NOT NULL,
  `BatchID` INTEGER DEFAULT NULL,
  PRIMARY KEY (`inventoryID`),
  KEY `BatchID_idx` (`BatchID`),
  CONSTRAINT `BatchReportID` FOREIGN KEY (`BatchID`) REFERENCES `batchreports` (`BatchID`)on delete set null
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `patientlist` (
  `PatientID` INTEGER NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(10) DEFAULT NULL,
  `LastName` varchar(10) DEFAULT NULL,
  `Sex` varchar(1) DEFAULT NULL,
  `Age` int(10) DEFAULT NULL,
  `DOB` Date DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `SSN` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `purchasehistory` (
  `PurchaseID` INTEGER NOT NULL,
  `PatientID` INTEGER DEFAULT NULL,
  `inventoryID` INTEGER DEFAULT NULL,
  `SerialID` INTEGER DEFAULT NULL,
  `ConfirmationDate` Date DEFAULT NULL,
  `TypeOfOrder` varchar(12) DEFAULT NULL,
  `Quantity` INTEGER DEFAULT NULL,
  `TotalCost` DECIMAL(10,2) DEFAULT NULL,
  `employeeID` INTEGER DEFAULT NULL,
  PRIMARY KEY (`PurchaseId`),
  KEY `PatientID_idx` (`PatientID`),
  KEY `inventoryID_idx` (`inventoryID`),
  KEY `SerialID_idx` (`SerialID`),
  KEY `WorkerID_idx` (`employeeID`),
  CONSTRAINT `PatientID` FOREIGN KEY (`PatientID`) REFERENCES `patientlist` (`PatientID`)on delete set null,
  CONSTRAINT `SerialID` FOREIGN KEY (`SerialID`) REFERENCES `medications` (`SerialNumber`)on delete set null,
  CONSTRAINT `WorkerID` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`)on delete set null
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE employee AUTO_INCREMENT=5000;
ALTER TABLE patientlist AUTO_INCREMENT=1000;
ALTER TABLE manufacturer AUTO_INCREMENT=9000;
ALTER TABLE medications AUTO_INCREMENT=7000;
ALTER TABLE batchreports AUTO_INCREMENT=6000;
ALTER TABLE inventory AUTO_INCREMENT=4000;
ALTER TABLE purchasehistory AUTO_INCREMENT=2000;

-- Adding data to tables
INSERT INTO patientlist VALUES(1001,'John', 'Freeman', 'M', 36, '1987-02-15', '(470) 965-3841', '141 East Cherry Street', '670-54-2946');
INSERT INTO patientlist VALUES(1002, 'Jackie', 'Moon', 'F', 42, '1981-05-22', '(470) 365-4817', '236 Sunset Boulevard', '452-98-1679');
INSERT INTO patientlist VALUES(1003, 'Charles', 'Fletcher', 'M', 65, '1958-07-16', '(470) 293-5465', '741 Adams Road', '125-32-0163');
INSERT INTO patientlist VALUES(1004, 'Mary', 'Smith', 'F', 70, '1953-01-23', '(470) 526-4820', '101 Rivocean Drive', '510-63-5819');
INSERT INTO patientlist VALUES(1005, 'Ellie', 'Jenkins', 'F', 24, '1999-08-21', '(470) 328-9816', '430 Mark Lane', '250-58-3169');
INSERT INTO patientlist VALUES(1006, 'Frank', 'Bazemore', 'M', 39, '1984-04-02', '(470) 710-3942', '1140 Larrytown Road', '432-12-9647');
INSERT INTO patientlist VALUES(1007, 'Gustavo', 'Escuela', 'M', 20, '2003-06-05', '(470) 538-6185', '645 Atlantic Avenue', '481-20-5346');
INSERT INTO patientlist VALUES(1008, 'Steve', 'Williams', 'M', 50, '1973-09-14', '(470) 515-7290', '102 Hillshire Drive', '323-14-0517');
INSERT INTO patientlist VALUES(1009, 'Bill', 'Upton', 'M', 55, '1968-03-18', '(470) 326-7158', '780 Main Street', '167-65-4352');
INSERT INTO patientlist VALUES(1010, 'Denise', 'McReary', 'F', 21, '2002-08-25', '(470) 585-1492', '140 Clinton Boulevard', '435-62-4780');
INSERT INTO patientlist VALUES(1011, 'Kiki', 'Daniels', 'F', 32, '1991-11-17', '(470) 565-8123', '3016 Wallace Way', '601-54-2593');
INSERT INTO patientlist VALUES(1012, 'Carmen', 'Ortiz', 'F', 46, '1977-09-08', '(470) 740-1683', '850 Henry Road', '712-64-2461');
INSERT INTO patientlist VALUES(1013, 'Nathan', 'Sullivan', 'M', 67, '1956-06-24', '(470) 985-6216', '613 Old Street', '582-34-7161');
INSERT INTO patientlist VALUES(1014, 'Jerry', 'Fillmore', 'M', 53, '1970-10-10', '(470) 245-7363', '716 Grand Lane', '510-31-6257');
INSERT INTO patientlist VALUES(1015, 'Greg', 'Daniels', 'M', 44, '1979-12-30', '(470) 656-4137', '360 Bull Avenue', '467-52-1675');
INSERT INTO patientlist VALUES(1016, 'Hugo', 'Johnson', 'M', 38, '1985-03-28', '(470) 948-2638', '289 Circuit Street', '493-05-5681');
INSERT INTO patientlist VALUES(1017, 'Donna', 'Summers', 'F', 26, '1997-07-25', '(470) 859-7619', '217 Worth Circle', '301-23-4768');
INSERT INTO patientlist VALUES(1018, 'Rachel', 'Ray', 'F', 41, '1982-04-12', '(470) 320-1767', '921 Lot Avenue', '164-93-4285');
INSERT INTO patientlist VALUES(1019, 'Katelyn', 'Marsh', 'F', 23, '2000-02-18', '(470) 949-5369', '2014 Angle Road', '760-14-6813');
INSERT INTO patientlist VALUES(1020, 'Sarah', 'Monroe', 'F', 48, '1975-06-29', '(470) 510-6472', '460 Play Street', '842-35-4073');

INSERT INTO employee VALUES(5001, 'Marcus', 'Lightfoot', 'M', 25, '1998-03-03', '240 Marilyn Drive');
INSERT INTO employee VALUES(5002, 'Carrie', 'Blunt', 'F', 18, '2005-12-28', '701 Kane Street');
INSERT INTO employee VALUES(5003, 'Henry', 'Jarrolds', 'M', 32, '1991-05-17', '630 Roy Avenue');
INSERT INTO employee VALUES(5004, 'Greg', 'Bryant', 'M', 34, '1989-10-15', '425 East Crane Avenue');
INSERT INTO employee VALUES(5005, 'Vera', 'Scott', 'F', 21, '2002-01-23', '356 Jane Drive');
INSERT INTO employee VALUES(5006, 'Jasmine', 'Miles', 'F', 35, '1988-04-21', '101 Lock Boulevard');
INSERT INTO employee VALUES(5007, 'Elizabeth', 'Pines', 'F', 26, '1997-09-14', '264 Grant Drive');
INSERT INTO employee VALUES(5008, 'Hope', 'Redmond', 'F', 36, '1987-08-30', '945 Dogwood Circle');
INSERT INTO employee VALUES(5009, 'Desmond', 'Phillips', 'M', 40, '1983-01-25', '360 Battle Drive');
INSERT INTO employee VALUES(5010, 'Ned', 'Walker', 'M', 45, '1978-06-13', '890 Yellow Road');

INSERT INTO manufacturer VALUES(9001, 'GlaxoSmithKline', '410 Blackwell Street', '(800) 245-1041');
INSERT INTO manufacturer VALUES(9002, 'Organon & Co.', '30 Hudson Street', '(551) 430-6000');
INSERT INTO manufacturer VALUES(9003, 'Amneal', '400 Crossing Boulevard', '(908) 947-3120');
INSERT INTO manufacturer VALUES(9004, 'Validus', '90 East Halsey Road', '(866) 982-5438');
INSERT INTO manufacturer VALUES(9005, 'Parke-Davis', '870 Parkdale Road', '(201) 540-2000');
INSERT INTO manufacturer VALUES(9006, 'Concordia', '612 Southeast 5th Avenue', '(954) 320-9990');
INSERT INTO manufacturer VALUES(9007, 'USAntibiotics', '201 Industrial Drive', '(423) 274-3300');
INSERT INTO manufacturer VALUES(9008, 'Pfizer', '66 Hudson Boulevard', '(800) 879-3477');
INSERT INTO manufacturer VALUES(9009, 'Bayer', '100 Bayer Boulevard', '(862) 404-3000');
INSERT INTO manufacturer VALUES(9010, 'Sun', '1 Western Express Highway', '(741) 564-9820');
INSERT INTO manufacturer VALUES(9011, 'Otsuka', '508 Carnegie Center Drive', '(609) 524-6788');
INSERT INTO manufacturer VALUES(9012, 'Allergan', '5 Giralda Farms', '(862) 261-8700');
INSERT INTO manufacturer VALUES(9013, 'Vanda', '2200 Pennsylvania Avenue Northwest', '(202) 734-3400');

INSERT INTO category VALUES(8001, 'Antimigraine Agents');
INSERT INTO category VALUES(8002, 'Antidepressants');
INSERT INTO category VALUES(8003, 'Cardiovascular Agents');
INSERT INTO category VALUES(8004, 'Antibacterials');
INSERT INTO category VALUES(8005, 'Bipolar Agents');

INSERT INTO medications VALUES(7001, 9001, 'Imitrex', 'Sumatriptan', 'For acute treatment of migraines/cluster headaches. | For use by patients 18 years of age and older.', '20MG', '14.30', '12.00', 8001);
INSERT INTO medications VALUES(7002, 9002, 'Maxalt', 'Rizatriptan', 'For acute treatment of migraines (not for cluster headaches). | For use by adults and children 6-17 years of age.', '10MG', '6.40', '5.00', 8001);
INSERT INTO medications VALUES(7003, 9003, 'Zomig', 'Zolmitriptan', 'For treating migraines and reducing substances that trigger headache pain. | For use by adults.', '5MG', '113.00', '110.00', 8001);
INSERT INTO medications VALUES(7004, 9004, 'Marplan', 'Isocarboxazid', 'For treating depression. Not for newly diagnosed patients of depression. | For use by patients 16 years or older.', '10MG', '307.00', '304.00', 8002);
INSERT INTO medications VALUES(7005, 9005, 'Nardil', 'Phenelzine', 'For treating depression in patients who have tried other medications unsuccessfully. | For use by patients 16 years and older.', '15MG', '171.00', '167.00', 8002);
INSERT INTO medications VALUES(7006, 9006, 'Parnate', 'Tranylcypromine', 'For treating certain types of depression. | For use by patients 18 years and older.', '10MG', '86.20', '84.00', 8002);
INSERT INTO medications VALUES(7007, 9007, 'Amoxil', 'Amoxicillin', 'For treating bacterial infections like chest infections and dental abscesses. | For use by adults, teenagers, and children.', '125MG', '4.90', '3.50', 8004);
INSERT INTO medications VALUES(7008, 9008, 'Flagyl', 'Metronidazole', 'For treating bacterial and parasitic infections. | For use by teenagers and adults.', '250MG', '2.90', '2.00', 8004);
INSERT INTO medications VALUES(7009, 9009, 'Cipro', 'Ciprofloxacin', 'For killing and preventing the growth of bacteria. | For use by patients aged 1 year and older.', '500MG', '7.00', '6.00', 8004);
INSERT INTO medications VALUES(7010, 9008, 'Norpace', 'Disopyramide', 'For treating certain types of serious irregular heartbeats and restore normal heartbeats. | For use by adults.', '600MG', '124.50', '122.00', 8003);
INSERT INTO medications VALUES(7011, 9001, 'Rythmol', 'Propafenone', 'For preventing atrial fibrillation in patientwho suffer from episodic atrial fibrillation who do not have heart disease. | For use by children and adults.', '150MG', '41.30', '39.00', 8003);
INSERT INTO medications VALUES(7012, 9010, 'Ethmozine', 'Moricizine Hydrochloride', 'For suppressing nonmalignant ventricular arrhythmias. | For use by patients 18 years of age and older.', '250MG', '50.00', '48.50', 8003);
INSERT INTO medications VALUES(7013, 9011, 'Abilify', 'Aripiprazole', 'For treating several types of mental health conditions, including schizophrenia, bipolar I disorder, autism, and Tourette syndrome. | For use by adults and children 6 years of age and older.', '20MG', '100.00', '98.00', 8005);
INSERT INTO medications VALUES(7014, 9012, 'Saphris', 'Asenapine', 'For treating schizophrenia. | For use by adults.', '10MG', '180.00', '178.00', 8005);
INSERT INTO medications VALUES(7015, 9013, 'Fanapt', 'Iloperidone', 'For treating mental/mood disorders, including schizophrenia. | For use by adults.', '8MG', '256.00', '254.00', 8005);

INSERT INTO batchreports VALUES(6001, 9001, 7001, '08:30', '2023-01-12', 200, '240.00', '2024-06-09', 5005);
INSERT INTO batchreports VALUES(6002, 9002, 7002, '10:10', '2023-01-04', 300, '150.00', '2024-08-18', 5009);
INSERT INTO batchreports VALUES(6003, 9003, 7003, '09:15', '2023-04-07', 100, '1100.00', '2025-01-03', 5008);
INSERT INTO batchreports VALUES(6004, 9004, 7004, '13:15', '2023-07-06', 50, '1520.00', '2024-04-27', 5006);
INSERT INTO batchreports VALUES(6005, 9005, 7005, '14:30', '2023-05-21', 50, '835.00', '2025-07-22', 5009);
INSERT INTO batchreports VALUES(6006, 9006, 7006, '14:20', '2023-05-18', 130, '1092.00', '2025-08-7', 5010);
INSERT INTO batchreports VALUES(6007, 9007, 7007, '11:30', '2023-06-28', 280, '98.00', '2026-01-01', 5001);
INSERT INTO batchreports VALUES(6008, 9008, 7008, '13:35', '2023-11-17', 250, '50.00', '2025-05-05', 5008);
INSERT INTO batchreports VALUES(6009, 9009, 7009, '15:40', '2023-03-27', 300, '180.00', '2025-11-27', 5008);
INSERT INTO batchreports VALUES(6010, 9008, 7010, '10:40', '2023-02-16', 100, '1220.00', '2024-11-11', 5006);
INSERT INTO batchreports VALUES(6011, 9001, 7011, '15:00', '2023-04-21', 340, '1326.00', '2024-11-07', 5010);
INSERT INTO batchreports VALUES(6012, 9009, 7012, '11:45', '2023-09-14', 280, '1358.00', '2026-02-28', 5009);
INSERT INTO batchreports VALUES(6013, 9011, 7013, '13:30', '2023-08-24', 100, '980.00', '2025-03-02', 5004);
INSERT INTO batchreports VALUES(6014, 9012, 7014, '14:25', '2023-05-19', 50, '890.00', '2025-07-07', 5009);
INSERT INTO batchreports VALUES(6015, 9013, 7015, '09:50', '2023-10-17', 50, '1270.00', '2024-08-20', 5009);

INSERT INTO inventory VALUES(4001, 6001, 1000, 0, 7001);
INSERT INTO inventory VALUES(4002, 6002, 2000, 0, 7002);
INSERT INTO inventory VALUES(4003, 6003, 500, 0, 7003);
INSERT INTO inventory VALUES(4004, 6004, 250, 0, 7004);
INSERT INTO inventory VALUES(4005, 6005, 300, 0, 7005);
INSERT INTO inventory VALUES(4006, 6006, 350, 0, 7006);
INSERT INTO inventory VALUES(4007, 6007, 2500, 0, 7007);
INSERT INTO inventory VALUES(4008, 6008, 3000, 0, 7008);
INSERT INTO inventory VALUES(4009, 6009, 1400, 0, 7009);
INSERT INTO inventory VALUES(4010, 6010, 800, 0, 7010);
INSERT INTO inventory VALUES(4011, 6011, 1000, 0, 7011);
INSERT INTO inventory VALUES(4012, 6012, 1200, 0, 7012);
INSERT INTO inventory VALUES(4013, 6013, 1100, 0, 7013);
INSERT INTO inventory VALUES(4014, 6014, 700, 0, 7014);
INSERT INTO inventory VALUES(4015, 6015, 400, 0, 7015);

INSERT INTO purchasehistory VALUES(2001, 1001, 4014, 7014, '2023-08-14', 'Prescription', 20, '360.00', 5001);
INSERT INTO purchasehistory VALUES(2002, 1002, 4001, 7001, '2023-01-01', 'Prescription', 20, '28.60', 5007);
INSERT INTO purchasehistory VALUES(2003, 1003, 4010, 7010, '2023-06-21', 'Prescription', 5, '62.25', 5004);
INSERT INTO purchasehistory VALUES(2004, 1004, 4011, 7011, '2023-04-14', 'Prescription', 10, '41.30', 5003);
INSERT INTO purchasehistory VALUES(2005, 1005, 4012, 7012, '2023-08-13', 'Prescription', 10, '50.00', 5002);
INSERT INTO purchasehistory VALUES(2006, 1006, 4015, 7015, '2023-10-10', 'Prescription', 10, '256.00', 5005);
INSERT INTO purchasehistory VALUES(2007, 1007, 4009, 7009, '2023-06-20', 'OTC', 25, '17.50', 5002);
INSERT INTO purchasehistory VALUES(2008, 1008, 4007, 7007, '2023-04-16', 'OTC', 30, '14.70', 5004);
INSERT INTO purchasehistory VALUES(2009, 1009, 4013, 7013, '2023-03-23', 'Prescription', 15, '150.00', 5004);
INSERT INTO purchasehistory VALUES(2010, 1010, 4005, 7005, '2023-09-25', 'Prescription', 10, '171.00', 5001);
INSERT INTO purchasehistory VALUES(2011, 1011, 4003, 7003, '2023-07-16', 'Prescription', 5, '56.50', 5002);
INSERT INTO purchasehistory VALUES(2012, 1012, 4015, 7015, '2023-02-12', 'Prescription', 5, '128.00', 5001);
INSERT INTO purchasehistory VALUES(2013, 1013, 4011, 7011, '2023-06-09', 'Prescription', 5, '20.65', 5006);
INSERT INTO purchasehistory VALUES(2014, 1014, 4006, 7006, '2023-11-03', 'Prescription', 15, '129.30', 5003);
INSERT INTO purchasehistory VALUES(2015, 1015, 4008, 7008, '2023-02-17', 'OTC', 20, '5.80', 5001);
INSERT INTO purchasehistory VALUES(2016, 1016, 4002, 7002, '2023-11-04', 'Prescription', 30, '19.20', 5004);
INSERT INTO purchasehistory VALUES(2017, 1017, 4009, 7009, '2023-11-14', 'OTC', 25, '17.50', 5003);
INSERT INTO purchasehistory VALUES(2018, 1018, 4004, 7004, '2023-03-29', 'Prescription', 5, '153.50', 5004);
INSERT INTO purchasehistory VALUES(2019, 1019, 4005, 7003, '2023-05-24', 'Prescription', 5, '56.50', 5003);
INSERT INTO purchasehistory VALUES(2020, 1020, 4015, 7015, '2023-10-26', 'Prescription', 5, '128.00', 5006);

-- Advanced Function
DELIMITER $$
CREATE TRIGGER Pharmacy.inventory_BEFORE_UPDATE BEFORE UPDATE ON inventory FOR EACH ROW
BEGIN
if new.Stock < 1 then
	set new.Deleted = 1;
    insert into inventory_out(inventoryID, BatchID)
    values(old.inventoryID, old.BatchID);
    
end if;
END$$
CREATE TRIGGER Pharmacy.purchasehistory_BEFORE_INSERT BEFORE INSERT ON purchasehistory FOR EACH ROW
BEGIN
if (select stock from inventory where inventoryID = new.inventoryID) - new.Quantity > -1 then
	update inventory set Stock = Stock - new.Quantity where inventoryID = new.inventoryID;
 else
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Not Enough medication in stock.';
end if;
END$$
CREATE TRIGGER Pharmacy.batchreport_After_Insert AFTER insert ON batchreports FOR EACH ROW
BEGIN
if new.BatchID then
if exists ((select SerialNumber from batchreports where SerialNumber = new.SerialNumber)) = (select SerialNumber from inventory where SerialNumber = new.SerialNumber) then
update inventory set Stock = Stock + Quantity where SerialNumber = new.SerialNumber;
else
insert into inventory(inventoryID, BatchID, Stock, SerialNumber) values (null, new.BatchID, new.Quantity, new.SerialNumber);
end if;
end if;
END$$
DELIMITER ;

CREATE EVENT inventorycleanup
    ON SCHEDULE EVERY 30 SECOND
    ON COMPLETION preserve
    DO
      delete from Pharmacy.inventory where Deleted = 1; 



-- SELECT * FROM patientlist;
-- SELECT * FROM employee;
-- SELECT * FROM manufacturer;
-- SELECT * FROM category;
-- SELECT * FROM medications;
-- SELECT * FROM batchreports;
-- SELECT * FROM inventory;
-- SELECT * FROM purchasehistory;