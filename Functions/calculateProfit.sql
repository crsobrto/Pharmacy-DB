CREATE FUNCTION calculateProfit(startingDate Date, endDate Date)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
	DECLARE totalBatch DECIMAL(10,2) DEFAULT 0.00;
	DECLARE totalPurchase DECIMAL(10,2) DEFAULT 0.00;
    DECLARE profit DECIMAL(10,2) DEFAULT 0.00;
    
	SET totalPurchase = (SELECT ROUND(SUM(TotalCost), 2) FROM purchaseHistory WHERE ConfirmationDate BETWEEN startingDate AND endDate);
    SET totalBatch = (SELECT ROUND(SUM(TotalCost), 2) FROM batchReports WHERE ConfirmationDate BETWEEN startingDate AND endDate);
    
    SET profit = (totalPurchase - totalBatch);
    
    RETURN profit;
END;

