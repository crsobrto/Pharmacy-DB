CREATE PROCEDURE `get_Profit` (startingDate Date, endDate Date)
BEGIN
	SELECT calculateProfit(startingDate, endDate) AS Profit;
END
