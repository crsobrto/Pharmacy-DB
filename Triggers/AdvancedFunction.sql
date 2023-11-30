-- Advanced Function
DELIMITER $$
CREATE TRIGGER Pharmacy.inventory_BEFORE_UPDATE BEFORE UPDATE ON inventory FOR EACH ROW
BEGIN
if new.Stock < 1 then
	set new.Deleted = 1;
    insert into inventory_out(inventoryID, BatchID)
    values(old.inventoryID, old.BatchID);
    
end if;
END$$
CREATE TRIGGER Pharmacy.purchasehistory_BEFORE_INSERT BEFORE INSERT ON purchasehistory FOR EACH ROW
BEGIN
if (select stock from inventory where inventoryID = new.inventoryID) - new.Quantity > -1 then
	update inventory set Stock = Stock - new.Quantity where inventoryID = new.inventoryID;
 else
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Not Enough medication in stock.';
end if;
END$$
CREATE TRIGGER Pharmacy.batchreport_After_Insert AFTER insert ON batchreports FOR EACH ROW
BEGIN
if new.BatchID then
insert into inventory(inventoryID, BatchID, Stock) values (null, new.BatchID, new.Quantity);
end if;
END$$
DELIMITER ;