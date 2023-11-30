CREATE DEFINER=`root`@`localhost` PROCEDURE `get_PurchaseHistoryBySerialID`(inputID int)
BEGIN
SELECT * FROM PurchaseHistory WHERE SerialID = inputID;
END