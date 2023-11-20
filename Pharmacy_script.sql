DROP DATABASE Pharmacy;
CREATE DATABASE Pharmacy;
USE Pharmacy;


-- Creating tables
CREATE TABLE `employee` (
  `employeeID` INTEGER NOT NULL,
  `FirstName` varchar(10) DEFAULT NULL,
  `LastName` varchar(10) DEFAULT NULL,
  `Sex` varchar(1) DEFAULT NULL,
  `Age` INTEGER DEFAULT NULL,
  `DOB` varchar(10) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`employeeID`)
)  ;

CREATE TABLE `manufacturer` (
  `manufacturerID` INTEGER NOT NULL,
  `manufacturerName` varchar(20) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`manufacturerID`)
)  ;

CREATE TABLE `category` (
  `categoryID` INTEGER NOT NULL,
  `categoryName` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`categoryID`)
)  ;

CREATE TABLE `medications` (
  `SerialNumber` INTEGER NOT NULL,
  `manufacturerID` INTEGER DEFAULT NULL,
  `MedicationName` varchar(10) DEFAULT NULL,
  `GenericName` varchar(25) DEFAULT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `Strength` varchar(5) DEFAULT NULL,
  `ShelfPrice` varchar(10) DEFAULT NULL,
  `manufacturerPrice` varchar(10) DEFAULT NULL,
  `categoryID` INTEGER DEFAULT NULL,
  PRIMARY KEY (`SerialNumber`),
  KEY `manufacturerID_idx` (`manufacturerID`),
  KEY `manufacturerIDNum_idx` (`manufacturerID`),
  KEY `categoryID_idx` (`categoryID`),
  CONSTRAINT `categoryID` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`),
  CONSTRAINT `manufacturerIDNum` FOREIGN KEY (`manufacturerID`) REFERENCES `manufacturer` (`manufacturerID`)
)  ;

CREATE TABLE `batchreports` (
  `BatchID` INTEGER NOT NULL,
  `manufacturerID` INTEGER DEFAULT NULL,
  `SerialNumber` INTEGER DEFAULT NULL,
  `Time` varchar(5) DEFAULT NULL,
  `Date` varchar(10) DEFAULT NULL,
  `Quantity` INTEGER DEFAULT NULL,
  `TotalCost` varchar(10) DEFAULT NULL,
  `ExpirationDate` varchar(7) DEFAULT NULL,
  `employeeID` INTEGER DEFAULT NULL,
  PRIMARY KEY (`BatchID`),
  KEY `manufacturerID_idx` (`manufacturerID`),
  KEY `SerialNum_idx` (`SerialNumber`),
  KEY `employeeID_idx` (`employeeID`),
  CONSTRAINT `employeeID` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`),
  CONSTRAINT `manufacturerID` FOREIGN KEY (`manufacturerID`) REFERENCES `manufacturer` (`manufacturerID`),
  CONSTRAINT `SerialNum` FOREIGN KEY (`SerialNumber`) REFERENCES `medications` (`SerialNumber`)
)  ;

CREATE TABLE `inventory` (
  `inventoryID` INTEGER NOT NULL,
  `BatchID` INTEGER DEFAULT NULL,
  `Stock` INTEGER DEFAULT NULL,
  `Deleted` bit default 0,
  PRIMARY KEY (`inventoryID`),
  KEY `BatchID_idx` (`BatchID`),
  CONSTRAINT `BatchID` FOREIGN KEY (`BatchID`) REFERENCES `batchreports` (`BatchID`)
)  ;

CREATE TABLE `inventory_out` (
  `inventoryID` INTEGER NOT NULL,
  `BatchID` INTEGER DEFAULT NULL,
  PRIMARY KEY (`inventoryID`),
  KEY `BatchID_idx` (`BatchID`),
  CONSTRAINT `BatchReportID` FOREIGN KEY (`BatchID`) REFERENCES `batchreports` (`BatchID`)
)  ;

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
)  ;

CREATE TABLE `purchasehistory` (
  `PurchaseID` INTEGER NOT NULL,
  `PatientID` INTEGER DEFAULT NULL,
  `inventoryID` INTEGER DEFAULT NULL,
  `SerialID` INTEGER DEFAULT NULL,
  `Date` varchar(10) DEFAULT NULL,
  `TypeOfOrder` varchar(12) DEFAULT NULL,
  `Quantity` INTEGER DEFAULT NULL,
  `TotalCost` varchar(10) DEFAULT NULL,
  `employeeID` INTEGER DEFAULT NULL,
  PRIMARY KEY (`PurchaseId`),
  KEY `PatientID_idx` (`PatientID`),
  KEY `inventoryID_idx` (`inventoryID`),
  KEY `SerialID_idx` (`SerialID`),
  KEY `WorkerID_idx` (`employeeID`),
  -- CONSTRAINT `inventoryID` FOREIGN KEY (`inventoryID`) REFERENCES `inventory` (`inventoryID`),
  CONSTRAINT `PatientID` FOREIGN KEY (`PatientID`) REFERENCES `patientlist` (`PatientID`),
  CONSTRAINT `SerialID` FOREIGN KEY (`SerialID`) REFERENCES `medications` (`SerialNumber`),
  CONSTRAINT `WorkerID` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`)
)  ;





-- Adding data to tables
INSERT INTO patientlist VALUES(1020, 'John', 'Freeman', 'M', 36, '02/15/1987', '(470) 965-3841', '141 East Cherry Street', '670-54-2946');
INSERT INTO patientlist VALUES(1036, 'Jackie', 'Moon', 'F', 42, '05/22/1981', '(470) 365-4817', '236 Sunset Boulevard', '452-98-1679');
INSERT INTO patientlist VALUES(1145, 'Charles', 'Fletcher', 'M', 65, '07/16/1958', '(470) 293-5465', '741 Adams Road', '125-32-0163');
INSERT INTO patientlist VALUES(1063, 'Mary', 'Smith', 'F', 70, '01/23/1953', '(470) 526-4820', '101 Rivocean Drive', '510-63-5819');
INSERT INTO patientlist VALUES(1042, 'Ellie', 'Jenkins', 'F', 24, '08/21/1999', '(470) 328-9816', '430 Mark Lane', '250-58-3169');
INSERT INTO patientlist VALUES(1326, 'Frank', 'Bazemore', 'M', 39, '04/02/1984', '(470) 710-3942', '1140 Larrytown Road', '432-12-9647');
INSERT INTO patientlist VALUES(1080, 'Gustavo', 'Escuela', 'M', 20, '06/25/2003', '(470) 538-6185', '645 Atlantic Avenue', '481-20-5346');
INSERT INTO patientlist VALUES(1247, 'Steve', 'Williams', 'M', 50, '09/14/1973', '(470) 515-7290', '102 Hillshire Drive', '323-14-0517');
INSERT INTO patientlist VALUES(1202, 'Bill', 'Upton', 'M', 55, '03/18/1968', '(470) 326-7158', '780 Main Street', '167-65-4352');
INSERT INTO patientlist VALUES(1018, 'Denise', 'McReary', 'F', 21, '08/25/2002', '(470) 585-1492', '140 Clinton Boulevard', '435-62-4780');
INSERT INTO patientlist VALUES(1312, 'Kiki', 'Daniels', 'F', 32, '11/17/1991', '(470) 565-8123', '3016 Wallace Way', '601-54-2593');
INSERT INTO patientlist VALUES(1425, 'Carmen', 'Ortiz', 'F', 46, '09/08/1977', '(470) 740-1683', '850 Henry Road', '712-64-2461');
INSERT INTO patientlist VALUES(1067, 'Nathan', 'Sullivan', 'M', 67, '06/24/1956', '(470) 985-6216', '613 Old Street', '582-34-7161');
INSERT INTO patientlist VALUES(1027, 'Jerry', 'Fillmore', 'M', 53, '10/10/1970', '(470) 245-7363', '716 Grand Lane', '510-31-6257');
INSERT INTO patientlist VALUES(1443, 'Greg', 'Daniels', 'M', 44, '12/30/1979', '(470) 656-4137', '360 Bull Avenue', '467-52-1675');
INSERT INTO patientlist VALUES(1572, 'Hugo', 'Johnson', 'M', 38, '03/28/1985', '(470) 948-2638', '289 Circuit Street', '493-05-5681');
INSERT INTO patientlist VALUES(1362, 'Donna', 'Summers', 'F', 26, '07/25/1997', '(470) 859-7619', '217 Worth Circle', '301-23-4768');
INSERT INTO patientlist VALUES(1245, 'Rachel', 'Ray', 'F', 41, '04/12/1982', '(470) 320-1767', '921 Lot Avenue', '164-93-4285');
INSERT INTO patientlist VALUES(1205, 'Katelyn', 'Marsh', 'F', 23, '02/18/2000', '(470) 949-5369', '2014 Angle Road', '760-14-6813');
INSERT INTO patientlist VALUES(1345, 'Sarah', 'Monroe', 'F', 48, '06/29/1975', '(470) 510-6472', '460 Play Street', '842-35-4073');

INSERT INTO employee VALUES(5001, 'Marcus', 'Lightfoot', 'M', 25, '03/03/1998', '240 Marilyn Drive');
INSERT INTO employee VALUES(5008, 'Carrie', 'Blunt', 'F', 18, '12/28/2005', '701 Kane Street');
INSERT INTO employee VALUES(5016, 'Henry', 'Jarrolds', 'M', 32, '05/17/1991', '630 Roy Avenue');
INSERT INTO employee VALUES(5024, 'Greg', 'Bryant', 'M', 34, '10/15/1989', '425 East Crane Avenue');
INSERT INTO employee VALUES(5005, 'Vera', 'Scott', 'F', 21, '01/23/2002', '356 Jane Drive');
INSERT INTO employee VALUES(5061, 'Jasmine', 'Miles', 'F', 35, '04/21/1988', '101 Lock Boulevard');
INSERT INTO employee VALUES(5053, 'Elizabeth', 'Pines', 'F', 26, '09/14/1997', '264 Grant Drive');
INSERT INTO employee VALUES(5041, 'Hope', 'Redmond', 'F', 36, '08/30/1987', '945 Dogwood Circle');
INSERT INTO employee VALUES(5072, 'Desmond', 'Phillips', 'M', 40, '01/25/1983', '360 Battle Drive');
INSERT INTO employee VALUES(5036, 'Ned', 'Walker', 'M', 45, '06/13/1978', '890 Yellow Road');

INSERT INTO manufacturer VALUES(9044, 'GlaxoSmithKline', '410 Blackwell Street', '(800) 245-1041');
INSERT INTO manufacturer VALUES(9037, 'Organon & Co.', '30 Hudson Street', '(551) 430-6000');
INSERT INTO manufacturer VALUES(9042, 'Amneal', '400 Crossing Boulevard', '(908) 947-3120');
INSERT INTO manufacturer VALUES(9055, 'Validus', '90 East Halsey Road', '(866) 982-5438');
INSERT INTO manufacturer VALUES(9033, 'Parke-Davis', '870 Parkdale Road', '(201) 540-2000');
INSERT INTO manufacturer VALUES(9158, 'Concordia', '612 Southeast 5th Avenue', '(954) 320-9990');
INSERT INTO manufacturer VALUES(9321, 'USAntibiotics', '201 Industrial Drive', '(423) 274-3300');
INSERT INTO manufacturer VALUES(9426, 'Pfizer', '66 Hudson Boulevard', '(800) 879-3477');
INSERT INTO manufacturer VALUES(9165, 'Bayer', '100 Bayer Boulevard', '(862) 404-3000');
INSERT INTO manufacturer VALUES(9618, 'Sun', '1 Western Express Highway', '(741) 564-9820');
INSERT INTO manufacturer VALUES(9572, 'Otsuka', '508 Carnegie Center Drive', '(609) 524-6788');
INSERT INTO manufacturer VALUES(9730, 'Allergan', '5 Giralda Farms', '(862) 261-8700');
INSERT INTO manufacturer VALUES(9846, 'Vanda', '2200 Pennsylvania Avenue Northwest', '(202) 734-3400');

INSERT INTO category VALUES(8010, 'Antimigraine Agents');
INSERT INTO category VALUES(8045, 'Antidepressants');
INSERT INTO category VALUES(8073, 'Cardiovascular Agents');
INSERT INTO category VALUES(8023, 'Antibacterials');
INSERT INTO category VALUES(8066, 'Bipolar Agents');

INSERT INTO medications VALUES(7356, 9044, 'Imitrex', 'Sumatriptan', 'For acute treatment of migraines/cluster headaches. | For use by patients 18 years of age and older.', '20MG', '$14.30', '$12.00', 8010);
INSERT INTO medications VALUES(7341, 9037, 'Maxalt', 'Rizatriptan', 'For acute treatment of migraines (not for cluster headaches). | For use by adults and children 6-17 years of age.', '10MG', '$6.40', '$5.00', 8010);
INSERT INTO medications VALUES(7398, 9042, 'Zomig', 'Zolmitriptan', 'For treating migraines and reducing substances that trigger headache pain. | For use by adults.', '5MG', '$113.00', '$110.00', 8010);
INSERT INTO medications VALUES(7841, 9055, 'Marplan', 'Isocarboxazid', 'For treating depression. Not for newly diagnosed patients of depression. | For use by patients 16 years or older.', '10MG', '$307.00', '$304.00', 8045);
INSERT INTO medications VALUES(7865, 9033, 'Nardil', 'Phenelzine', 'For treating depression in patients who have tried other medications unsuccessfully. | For use by patients 16 years and older.', '15MG', '$171.00', '$167.00', 8045);
INSERT INTO medications VALUES(7832, 9158, 'Parnate', 'Tranylcypromine', 'For treating certain types of depression. | For use by patients 18 years and older.', '10MG', '$86.20', '$84.00', 8045);
INSERT INTO medications VALUES(7429, 9321, 'Amoxil', 'Amoxicillin', 'For treating bacterial infections like chest infections and dental abscesses. | For use by adults, teenagers, and children.', '125MG', '$4.90', '$3.50', 8023);
INSERT INTO medications VALUES(7486, 9426, 'Flagyl', 'Metronidazole', 'For treating bacterial and parasitic infections. | For use by teenagers and adults.', '250MG', '$2.90', '$2.00', 8023);
INSERT INTO medications VALUES(7477, 9165, 'Cipro', 'Ciprofloxacin', 'For killing and preventing the growth of bacteria. | For use by patients aged 1 year and older.', '500MG', '$7.00', '$6.00', 8023);
INSERT INTO medications VALUES(7942, 9426, 'Norpace', 'Disopyramide', 'For treating certain types of serious irregular heartbeats and restore normal heartbeats. | For use by adults.', '600MG', '$124.50', '$122.00', 8073);
INSERT INTO medications VALUES(7901, 9044, 'Rythmol', 'Propafenone', 'For preventing atrial fibrillation in patientwho suffer from episodic atrial fibrillation who do not have heart disease. | For use by children and adults.', '150MG', '$41.30', '$39.00', 8073);
INSERT INTO medications VALUES(7963, 9618, 'Ethmozine', 'Moricizine Hydrochloride', 'For suppressing nonmalignant ventricular arrhythmias. | For use by patients 18 years of age and older.', '250MG', '$50.00', '$48.50', 8073);
INSERT INTO medications VALUES(7041, 9572, 'Abilify', 'Aripiprazole', 'For treating several types of mental health conditions, including schizophrenia, bipolar I disorder, autism, and Tourette syndrome. | For use by adults and children 6 years of age and older.', '20MG', '$100.00', '$98.00', 8066);
INSERT INTO medications VALUES(7053, 9730, 'Saphris', 'Asenapine', 'For treating schizophrenia. | For use by adults.', '10MG', '$180.00', '$178.00', 8066);
INSERT INTO medications VALUES(7088, 9846, 'Fanapt', 'Iloperidone', 'For treating mental/mood disorders, including schizophrenia. | For use by adults.', '8MG', '$256.00', '$254.00', 8066);

INSERT INTO batchreports VALUES(6326, 9044, 7356, '08:30', '01/12/2023', 200, '$240.00', '06/2024', 5036);
INSERT INTO batchreports VALUES(6975, 9037, 7341, '10:10', '01/04/2023', 300, '$150.00', '08/2024', 5072);
INSERT INTO batchreports VALUES(6014, 9042, 7398, '09:15', '04/07/2023', 100, '$1100.00', '01/2025', 5041);
INSERT INTO batchreports VALUES(6528, 9055, 7841, '13:15', '07/06/2023', 50, '$1520.00', '04/2024', 5061);
INSERT INTO batchreports VALUES(6374, 9033, 7865, '14:30', '05/21/2023', 50, '$835.00', '07/2025', 5072);
INSERT INTO batchreports VALUES(6832, 9158, 7832, '14:20', '05/18/2023', 130, '$1092.00', '08/2025', 5036);
INSERT INTO batchreports VALUES(6147, 9321, 7429, '11:30', '06/28/2023', 280, '$98.00', '01/2026', 5072);
INSERT INTO batchreports VALUES(6428, 9426, 7486, '13:35', '11/17/2023', 250, '$50.00', '05/2025', 5041);
INSERT INTO batchreports VALUES(6385, 9165, 7477, '15:40', '03/27/2023', 300, '$180.00', '11/2025', 5041);
INSERT INTO batchreports VALUES(6995, 9426, 7942, '10:40', '02/16/2023', 100, '$1220.00', '11/2024', 5061);
INSERT INTO batchreports VALUES(6727, 9044, 7901, '15:00', '04/21/2023', 340, '$1326.00', '12/2024', 5036);
INSERT INTO batchreports VALUES(6234, 9618, 7963, '11:45', '09/14/2023', 280, '$1358.00', '02/2026', 5072);
INSERT INTO batchreports VALUES(6518, 9572, 7041, '13:30', '08/24/2023', 100, '$980.00', '03/2025', 5036);
INSERT INTO batchreports VALUES(6925, 9730, 7053, '14:25', '05/19/2023', 50, '$890.00', '07/2025', 5072);
INSERT INTO batchreports VALUES(6073, 9846, 7088, '09:50', '10/17/2023', 50, '$1270.00', '08/2024', 5072);

INSERT INTO inventory VALUES(4087, 6326, 1000, 0);
INSERT INTO inventory VALUES(4690, 6975, 2000, 0);
INSERT INTO inventory VALUES(4325, 6014, 500, 0);
INSERT INTO inventory VALUES(4461, 6528, 250, 0);
INSERT INTO inventory VALUES(4135, 6374, 300, 0);
INSERT INTO inventory VALUES(4168, 6832, 350, 0);
INSERT INTO inventory VALUES(4901, 6147, 2500, 0);
INSERT INTO inventory VALUES(4365, 6428, 3000, 0);
INSERT INTO inventory VALUES(4430, 6385, 1400, 0);
INSERT INTO inventory VALUES(4917, 6995, 800, 0);
INSERT INTO inventory VALUES(4434, 6727, 1000, 0);
INSERT INTO inventory VALUES(4187, 6234, 1200, 0);
INSERT INTO inventory VALUES(4205, 6518, 1100, 0);
INSERT INTO inventory VALUES(4836, 6925, 700, 0);
INSERT INTO inventory VALUES(4157, 6073, 400, 0);

INSERT INTO purchasehistory VALUES(2674, 1020, 4836, 7053, '08/14/2023', 'Prescription', 20, '$360.00', 5001);
INSERT INTO purchasehistory VALUES(2901, 1036, 4087, 7356, '01/01/2023', 'Prescription', 20, '$28.60', 5053);
INSERT INTO purchasehistory VALUES(2145, 1145, 4917, 7942, '06/21/2023', 'Prescription', 5, '$62.25', 5024);
INSERT INTO purchasehistory VALUES(2035, 1063, 4434, 7901, '04/14/2023', 'Prescription', 10, '$41.30', 5016);
INSERT INTO purchasehistory VALUES(2468, 1042, 4187, 7963, '08/13/2023', 'Prescription', 10, '$50.00', 5008);
INSERT INTO purchasehistory VALUES(2716, 1326, 4157, 7088, '10/10/2023', 'Prescription', 10, '$256.00', 5005);
INSERT INTO purchasehistory VALUES(2447, 1080, 4430, 7477, '06/20/2023', 'OTC', 25, '$17.50', 5008);
INSERT INTO purchasehistory VALUES(2681, 1247, 4901, 7429, '04/16/2023', 'OTC', 30, '$14.70', 5024);
INSERT INTO purchasehistory VALUES(2342, 1202, 4205, 7041, '03/23/2023', 'Prescription', 15, '$150.00', 5024);
INSERT INTO purchasehistory VALUES(2166, 1018, 4135, 7865, '09/25/2023', 'Prescription', 10, '$171.00', 5001);
INSERT INTO purchasehistory VALUES(2695, 1312, 4325, 7398, '07/16/2023', 'Prescription', 5, '$56.50', 5008);
INSERT INTO purchasehistory VALUES(2940, 1425, 4157, 7088, '02/12/2023', 'Prescription', 5, '$128.00', 5001);
INSERT INTO purchasehistory VALUES(2717, 1067, 4434, 7901, '06/09/2023', 'Prescription', 5, '$20.65', 5053);
INSERT INTO purchasehistory VALUES(2843, 1027, 4168, 7832, '11/03/2023', 'Prescription', 15, '$129.30', 5016);
INSERT INTO purchasehistory VALUES(2241, 1443, 4365, 7486, '02/17/2023', 'OTC', 20, '$5.80', 5001);
INSERT INTO purchasehistory VALUES(2588, 1572, 4690, 7341, '11/04/2023', 'Prescription', 30, '$19.20', 5024);
INSERT INTO purchasehistory VALUES(2974, 1362, 4430, 7477, '11/14/2023', 'OTC', 25, '$17.50', 5016);
INSERT INTO purchasehistory VALUES(2341, 1245, 4461, 7841, '03/29/2023', 'Prescription', 5, '$153.50', 5024);
INSERT INTO purchasehistory VALUES(2141, 1205, 4325, 7398, '05/24/2023', 'Prescription', 5, '$56.50', 5016);
INSERT INTO purchasehistory VALUES(2050, 1345, 4157, 7088, '10/26/2023', 'Prescription', 5, '$128.00', 5053);

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
	update inventory set Stock = Stock - new.Quantity;
    
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

