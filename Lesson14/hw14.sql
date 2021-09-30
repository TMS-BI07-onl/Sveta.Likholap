 
 --��� ��� � ����� ������������� ��� ����: 1 ������ - ������, ������ ��� ������ �� ��� ����������� ��������� �����. �������� ������ �� �������,
 --��� ���� ���������. � �������, � ���� � �� �������� ���� ����� ������� ��������� ������. 
 
 
 CREATE VIEW dbo.topTrainers AS
  SELECT TOP 50 b.[FirstName] AS FirstName_Trainer, b.[LastName] AS LastName_Trainer, count_win
  FROM
  (SELECT  [SwimmerId], count_win,
  ROW_NUMBER () OVER (PARTITION BY [SwimmerId] ORDER BY count_win) AS wins -- ��� ������ ����������� 
  FROM
  (SELECT [SwimmerId],  
  COUNT([ResTime]) OVER (PARTITION BY [SwimmerId] ) AS count_win -- ��������� ������ ��� ������� ������
  FROM [dbo].[Competitions]
  WHERE [ResTime] IS NOT NULL
  ) a
  ) d
  JOIN [dbo].[Swimmer] b ON  d.SwimmerId=b.[SwimmerID]
  JOIN [dbo].[Trainer] c ON b.[TrainerID] =c.TrainerID
  WHERE wins = 1
  ORDER BY count_win DESC;