SELECT  distinct top 50 sum_point, c.FirstName, c.LastName
  FROM
  (
  SELECT *, 
  SUM (point) OVER (PARTITION BY [SwimmerId]) as sum_point
  FROM
	(
	SELECT [SwimmerId],
	CASE
		WHEN swim_win = 1 THEN 3
		WHEN swim_win = 2 THEN 2
		WHEN swim_win = 3 THEN 1
	 END AS point
  FROM
  (
  SELECT *,
  RANK () OVER (PARTITION BY [CompID] ORDER BY [ResTime]) as swim_win
  FROM [dbo].[Competitions] a
  WHERE [ResTime] IS NOT NULL
  ) d --ORDER BY [SwimmerId]
  ) e
  ) f
  JOIN [dbo].[Swimmer] b ON f.SwimmerId =b.[SwimmerID]
  JOIN [dbo].[Trainer] c ON b.[TrainerID] =c.TrainerID
  ORDER BY sum_point DESC