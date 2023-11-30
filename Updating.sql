-- Updating records

-- Update the shelf price of a medication
SELECT * FROM Medications;
UPDATE Medications
SET ShelfPrice = 12.00
WHERE SerialNumber = 7001; -- Updating Imitrex
SELECT * FROM Medications;

-- Update a patient's address
SELECT * FROM PatientList;
UPDATE PatientList
SET Address = "451 Grant Drive"
WHERE PatientID = 1002;
SELECT * FROM PatientList;