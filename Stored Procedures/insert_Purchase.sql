CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_Purchase`(patientID int, inventoryID int, SerialID int, ConfirmationDate Date, TypeOfOrder varchar(12), Quantity int, employeeID int)
BEGIN
	DECLARE newTotal DECIMAL(10,2);
    SET newTotal = Quantity * (SELECT ShelfPrice FROM medications WHERE SerialNumber = SerialID) ;
    
    INSERT INTO purchasehistory(PatientID, inventoryID, serialID, ConfirmationDate, TypeOfOrder, Quantity, TotalCost, employeeID)
    VALUES(patientID, inventoryID, SerialID, ConfirmationDate, TypeOfOrder, Quantity, newTotal, employeeID);
END