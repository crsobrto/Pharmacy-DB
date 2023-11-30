CREATE DEFINER=`root`@`localhost` PROCEDURE `get_PatientsMedHistory`()
BEGIN
-- Get patient names, the dates they have purchased medication, what medication they purchased, and how much they spent
SELECT PatientList.FirstName AS PatientFirstName, PatientList.LastName AS PatientLastName, PurchaseHistory.ConfirmationDate AS PurchaseDate, PurchaseHistory.TotalCost,
Medications.MedicationName
FROM PatientList
INNER JOIN PurchaseHistory ON PatientList.PatientID = PurchaseHistory.PatientID
INNER JOIN Medications ON PurchaseHistory.SerialID = Medications.SerialNumber
ORDER BY PurchaseDate;
END