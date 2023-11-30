-- SEARCHING RECORDS
USE Pharmacy;

-- Search PurchaseHistory by a medication's serialID
SELECT * FROM PurchaseHistory
WHERE serialID = 7015;

-- Get the medication names & their manufacturer's name
SELECT Medications.MedicationName, Manufacturer.manufacturerName
FROM Medications
INNER JOIN BatchReports ON Medications.SerialNumber = BatchReports.SerialNumber
INNER JOIN Manufacturer ON BatchReports.manufacturerID = Manufacturer.manufacturerID;

-- Get patient names, the dates they have purchased medication, what medication they purchased, and how much they spent
SELECT PatientList.FirstName AS PatientFirstName, PatientList.LastName AS PatientLastName, PurchaseHistory.ConfirmationDate AS PurchaseDate, PurchaseHistory.TotalCost,
Medications.MedicationName
FROM PatientList
INNER JOIN PurchaseHistory ON PatientList.PatientID = PurchaseHistory.PatientID
INNER JOIN Medications ON PurchaseHistory.SerialID = Medications.SerialNumber
ORDER BY PurchaseDate;

-- Get employee names and their batch report details
SELECT Employee.FirstName AS EmployeeFirstName, Employee.LastName AS EmployeeLastName, BatchReports.BatchID, BatchReports.ConfirmationDate, BatchReports.Time,
Manufacturer.manufacturerName AS ManufacturerName, Medications.MedicationName, BatchReports.Quantity, BatchReports.TotalCost, BatchReports.ExpirationDate
FROM Employee
INNER JOIN BatchReports ON Employee.employeeID = BatchReports.employeeID
INNER JOIN Medications ON BatchReports.SerialNumber = Medications.SerialNumber
INNER JOIN Manufacturer ON BatchReports.manufacturerID = Manufacturer.manufacturerID
ORDER BY ConfirmationDate;