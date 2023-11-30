-- Deleting records (uses ON DELETE CASCADE to avoid Foreign Key violations)

-- Delete a patient from the database
SELECT * FROM PatientList WHERE PatientID = 1003;

DELETE FROM PatientList
WHERE PatientID = 1003;



-- Delete a medication from the database
SELECT * FROM Medications WHERE SerialNumber = 7002; 
SELECT * FROM PurchaseHistory WHERE SerialID = 7002;

DELETE FROM Medications
WHERE SerialNumber = 7002;