-- UPDATING RECORDS
USE Pharmacy;

-- Update a patient's address
SELECT * FROM PatientList WHERE PatientID = 1002; -- Example patient

UPDATE PatientList
SET Address = "451 Grant Drive"
WHERE PatientID = 1002;


-- Update a patient's phone number
SELECT * FROM PatientList WHERE PatientID = 1016; -- Example patient

UPDATE PatientList
SET PhoneNumber = "(470) 844-2639"
WHERE PatientID = 1016;


-- Update the shelf price of a medication
SELECT * FROM Medications WHERE SerialNumber = 7001; -- Example medication

UPDATE Medications
SET ShelfPrice = 12.00
WHERE SerialNumber = 7001;


-- Update the manufacturer price of a medication
SELECT * FROM Medications WHERE SerialNumber = 7003; -- Example medication

UPDATE Medications
SET manufacturerPrice = 105.00
WHERE SerialNumber = 7003;