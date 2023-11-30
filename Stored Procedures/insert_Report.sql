CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_Report`(manufacturerID INT, serialNumber INT, TimeAdded varchar(5), confirmationDate Date, quantity INT, expirationDate Date, employeeID INT)
BEGIN
	DECLARE newTotalCost DECIMAL(10,2);
    SET newTotalCost = (SELECT manufacturerPrice FROM medications WHERE medications.SerialNumber = serialNumber) * quantity;
    
    INSERT INTO batchreports(ManufacturerID, SerialNumber, TimeAdded, confirmationDate, Quantity, TotalCost, ExpirationDate, EmployeeID)
    Values(manufacturerID, serialNumber, TimeAdded, confirmationDate, quantity, newTotalCost, expirationDate, employeeID);
END