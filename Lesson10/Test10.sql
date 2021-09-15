/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [BusinessEntityID]
      ,[PhoneNumber]
      ,[PhoneNumberTypeID]
      ,[ModifiedDate]
  FROM [AdventureWorks2017].[Person].[PersonPhone]
  --1
  SELECT a.[BusinessEntityID], b.[PhoneNumber]
  FROM [Person].[Person] a
  JOIN [Person].[PersonPhone] b
  ON a.[BusinessEntityID] =b.BusinessEntityID
  WHERE [PhoneNumber] LIKE '4%5';

  --2 ќтнести каждого человека из [HumanResources].[Employee] в свою возрастную категорию:
--Adolescence: 17-20
--Adults: 21-59
--Elderly: 60-75
--Senile: 76-90

SELECT 
	CASE WHEN (DATEPART (year,[BirthDate]) - (DATEPART (year,GETDATE())) BETWEEN 17 AND 20 THEN 'Adolescence: 17-20'
	CASE WHEN (DATEPART (year,[BirthDate]) - (DATEPART (year,GETDATE())) BETWEEN 21 AND 59 THEN 'Adults: 21-59'
		 --  THEN 'Elderly: 60-75'
		 --  THEN 'Senile: 76-90'
	
	END Category
FROM [HumanResources].[Employee]; 

3. ¬ывести самый дорогой продукт дл€ каждого цвета из [Production].[Product]

 
SELECT DISTINCT [Color],
    MAX ([StandardCost]) OVER(PARTITION BY [Color]) AS MaxCost	
FROM [Production].[Product]