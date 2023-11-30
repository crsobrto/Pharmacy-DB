-- Updating records

-- Update the shelf price of a medication
SELECT * FROM Medications WHERE SerialNumber = 7001;

UPDATE Medications
SET ShelfPrice = 12.00
WHERE SerialNumber = 7001; -- Updating Imitrex

-- Update a patient's address
SELECT * FROM PatientList WHERE PatientID = 1002;

UPDATE PatientList
SET Address = "451 Grant Drive"
WHERE PatientID = 1002;
SELECT * FROM PatientList;