/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [IrinaPashkovich]
      ,[Darya]
      ,[Ekaterina]
      ,[IrinaSelyutina]
      ,[Viktor]
      ,[Dmitriy]
      ,[Svetlana]
      ,[VikaVoronchuk]
      ,[VikaOstopchuk]
  FROM [draft].[dbo].[data_for_merge]

  SELECT TOP (1000) [Function_name]
      ,[Function_count]
  FROM [draft].[dbo].[hw_merge]



--1
MERGE [dbo].[hw_merge] target
USING [dbo].[data_for_merge] source ON target.[Function_name]=source.[VikaOstopchuk]
WHEN MATCHED AND source.[VikaOstopchuk] IS NOT NULL THEN UPDATE SET target.[Function_count] =  target.[Function_count]+1 

WHEN NOT MATCHED   BY TARGET AND source.[VikaOstopchuk] IS NOT NULL
	THEN INSERT ([Function_name], [Function_count])
	VALUES (source.[VikaOstopchuk],1);

--TRUNCATE TABLE 	[dbo].[hw_merge]
--2	
GO
MERGE [dbo].[hw_merge] target
USING [dbo].[data_for_merge] source ON target.[Function_name]=source.[VikaVoronchuk]
WHEN MATCHED AND source.[VikaVoronchuk] IS NOT NULL THEN UPDATE SET target.[Function_count] = target.[Function_count]+1  

WHEN NOT MATCHED   BY TARGET AND source.[VikaVoronchuk] IS NOT NULL
	THEN INSERT ([Function_name], [Function_count])
	VALUES (source.[VikaVoronchuk],1);

--3
GO
MERGE [dbo].[hw_merge] target
USING [dbo].[data_for_merge] source ON target.[Function_name]=source.[Svetlana]
WHEN MATCHED AND source.[Svetlana] IS NOT NULL THEN UPDATE SET target.[Function_count] = target.[Function_count]+1  

WHEN NOT MATCHED   BY TARGET AND source.[Svetlana] IS NOT NULL
	THEN INSERT ([Function_name], [Function_count])
	VALUES (source.[Svetlana],1);

--4
GO
MERGE [dbo].[hw_merge] target
USING [dbo].[data_for_merge] source ON target.[Function_name]=source.[Dmitriy]
WHEN MATCHED AND source.[Dmitriy] IS NOT NULL THEN UPDATE SET target.[Function_count] = target.[Function_count]+1  

WHEN NOT MATCHED   BY TARGET AND source.[Dmitriy] IS NOT NULL
	THEN INSERT ([Function_name], [Function_count])
	VALUES (source.[Dmitriy],1);

--5
GO
MERGE [dbo].[hw_merge] target
USING [dbo].[data_for_merge] source ON target.[Function_name]=source.[Viktor]
WHEN MATCHED AND source.[Viktor] IS NOT NULL THEN UPDATE SET target.[Function_count] = target.[Function_count]+1  

WHEN NOT MATCHED   BY TARGET AND source.[Viktor] IS NOT NULL
	THEN INSERT ([Function_name], [Function_count])
	VALUES (source.[Viktor],1);

--6
GO
MERGE [dbo].[hw_merge] target
USING [dbo].[data_for_merge] source ON target.[Function_name]=source.[IrinaSelyutina]
WHEN MATCHED AND source.[IrinaSelyutina] IS NOT NULL THEN UPDATE SET target.[Function_count] = target.[Function_count]+1  

WHEN NOT MATCHED   BY TARGET AND source.[IrinaSelyutina] IS NOT NULL
	THEN INSERT ([Function_name], [Function_count])
	VALUES (source.[IrinaSelyutina],1);

SELECT *
  FROM [draft].[dbo].[hw_merge]

--7
GO
MERGE [dbo].[hw_merge] target
USING [dbo].[data_for_merge] source ON target.[Function_name]=source.[Ekaterina]
WHEN MATCHED AND source.[Ekaterina] IS NOT NULL THEN UPDATE SET target.[Function_count] = target.[Function_count]+1  

WHEN NOT MATCHED   BY TARGET AND source.[Ekaterina] IS NOT NULL
	THEN INSERT ([Function_name], [Function_count])
	VALUES (source.[Ekaterina],1);

--8
GO
MERGE [dbo].[hw_merge] target
USING [dbo].[data_for_merge] source ON target.[Function_name]=source.[Darya]
WHEN MATCHED AND source.[Darya] IS NOT NULL THEN UPDATE SET target.[Function_count] = target.[Function_count]+1  

WHEN NOT MATCHED   BY TARGET AND source.[Darya] IS NOT NULL
	THEN INSERT ([Function_name], [Function_count])
	VALUES (source.[Darya],1);

--9
GO
MERGE [dbo].[hw_merge] target
USING [dbo].[data_for_merge] source ON target.[Function_name]=source.[IrinaPashkovich]
WHEN MATCHED AND source.[IrinaPashkovich] IS NOT NULL THEN UPDATE SET target.[Function_count] = target.[Function_count]+1  

WHEN NOT MATCHED   BY TARGET AND source.[IrinaPashkovich] IS NOT NULL
	THEN INSERT ([Function_name], [Function_count])
	VALUES (source.[IrinaPashkovich],1);

SELECT *
  FROM [draft].[dbo].[hw_merge]
  ORDER BY [Function_count] DESC
