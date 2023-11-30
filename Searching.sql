-- Searching records
USE Pharmacy;

-- Search PurchaseHistroy by serialID
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
INNER JOIN Medications ON PurchaseHistory.SerialID = Medications.SerialNumber;