/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [ProductID]
      ,[BusinessEntityID]
      ,[AverageLeadTime]
      ,[StandardPrice]
      ,[LastReceiptCost]
      ,[LastReceiptDate]
      ,[MinOrderQty]
      ,[MaxOrderQty]
      ,[OnOrderQty]
      ,[UnitMeasureCode]
      ,[ModifiedDate]
  FROM [AdventureWorks2017].[Purchasing].[ProductVendor]


-- 1 find all BusinessEntityID who had LastReceiptDate on friday 

SELECT DISTINCT BusinessEntityID,  
	DATENAME(dw, (LastReceiptDate)) 
FROM [AdventureWorks2017].[Purchasing].[ProductVendor]
WHERE DATENAME(dw, (LastReceiptDate))  = 'Friday';

-- 2 find all BusinessEntityID who hasn't LastReceiptDate in 2011

SELECT DISTINCT BusinessEntityID,  
	DATENAME(year, (LastReceiptDate)) 
FROM [AdventureWorks2017].[Purchasing].[ProductVendor]
WHERE DATENAME(YEAR, (LastReceiptDate))  != '2011';

-- 3 Return a  value of LastReceiptCost, rounded to 2.

SELECT ROUND(LastReceiptCost, 2) AS RoundLastReceiptCost  	
FROM [AdventureWorks2017].[Purchasing].[ProductVendor];

-- 4 Return the smallest integer of LastReceiptCost.

SELECT CEILING (LastReceiptCost) AS IntLastReceiptCost  	
FROM [AdventureWorks2017].[Purchasing].[ProductVendor];

-- 5 Return the largest integer of LastReceiptCost.

SELECT FLOOR (LastReceiptCost) AS IntLastReceiptCost  	
FROM [AdventureWorks2017].[Purchasing].[ProductVendor];


-- 6 return the current value of the first expression [OnOrderQty], 
--[MinOrderQty], [MaxOrderQty] from that initially doesn't evaluate to NULL.

SELECT [OnOrderQty], [MinOrderQty], [MaxOrderQty],
	COALESCE([OnOrderQty], [MinOrderQty], [MaxOrderQty]) newCOALESCE
FROM [AdventureWorks2017].[Purchasing].[ProductVendor];


--7 convert an expression of data type of [StandardPrice] to DECIMAL.

SELECT [StandardPrice],
	CAST([StandardPrice] AS DECIMAL)
FROM [AdventureWorks2017].[Purchasing].[ProductVendor];

	