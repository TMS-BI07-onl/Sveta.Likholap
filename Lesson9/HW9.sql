/****** Script for SelectTopNRows command from SSMS  ******/
--Возможно я поняла суть задания, но у меня так.. я даже табличку отдельно создала. Думала, что может SELF JOIN нужны. 
--Но к логическому решению так и не пришла. С моей табличкой работает просто SELECT )

  INSERT INTO [dbo].[people] ([id],[firstName],[ParentName],[LastName],[IDFather],[IDMother])
  VALUES (1, 'dmitriy', 'ivan', 'petrov', 2, 3),
  (2, 'dmitriy', 'oleg', 'ivanov', 4, 5),
  (3, 'sergey', 'ivan', 'petrov', 2, 3);


  SELECT [firstName], [ParentName], [LastName], [ParentName] AS FatherFirstName, [LastName] AS FatherLastName
  FROM [dbo].[people] 
  WHERE [firstName] = 'dmitriy' 
   