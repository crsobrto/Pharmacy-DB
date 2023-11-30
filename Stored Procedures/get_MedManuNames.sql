CREATE DEFINER=`root`@`localhost` PROCEDURE `get_MedManuNames`()
BEGIN
-- Get the medication names & their manufacturer's name
SELECT Medications.MedicationName, Manufacturer.manufacturerName
FROM Medications
INNER JOIN BatchReports ON Medications.SerialNumber = BatchReports.SerialNumber
INNER JOIN Manufacturer ON BatchReports.manufacturerID = Manufacturer.manufacturerID;
END