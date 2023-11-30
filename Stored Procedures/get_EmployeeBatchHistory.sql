CREATE DEFINER=`root`@`localhost` PROCEDURE `get_EmployeeBatchHistory`()
BEGIN
-- Get employee names and their batch report details
SELECT Employee.FirstName AS EmployeeFirstName, Employee.LastName AS EmployeeLastName, BatchReports.BatchID, BatchReports.ConfirmationDate, BatchReports.Time,
Manufacturer.manufacturerName AS ManufacturerName, Medications.MedicationName, BatchReports.Quantity, BatchReports.TotalCost, BatchReports.ExpirationDate
FROM Employee
INNER JOIN BatchReports ON Employee.employeeID = BatchReports.employeeID
INNER JOIN Medications ON BatchReports.SerialNumber = Medications.SerialNumber
INNER JOIN Manufacturer ON BatchReports.manufacturerID = Manufacturer.manufacturerID
ORDER BY ConfirmationDate;
END