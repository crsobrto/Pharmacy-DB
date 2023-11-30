-- DELETING RECORDS (uses ON DELETE SET NULL to avoid Foreign Key violations)
USE Pharmacy;

-- Delete a patient from the database
SELECT * FROM PatientList WHERE PatientID = 1003;
SELECT * FROM PurchaseHistory
ORDER BY PatientID;

DELETE FROM PatientList
WHERE PatientID = 1003;


-- Delete an employee from the database
SELECT * FROM Employee WHERE employeeID = 5006;
SELECT * FROM BatchReports
ORDER BY employeeID;

DELETE FROM Employee
WHERE employeeID = 5006;


-- Delete a medication from the database
SELECT * FROM Medications WHERE SerialNumber = 7002; 
SELECT * FROM PurchaseHistory
ORDER BY SerialNumber;

DELETE FROM Medications
WHERE SerialNumber = 7002;


-- Delete a manufacturer from the database
SELECT * FROM Manufacturer WHERE manufacturerID = 9005;
SELECT * FROM BatchReports
ORDER BY manufacturerID;

DELETE FROM Manufacturer
WHERE manufacturerID = 9005;