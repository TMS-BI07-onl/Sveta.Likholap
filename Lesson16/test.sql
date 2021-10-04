--1. ����� ProductSubcategoryID �� Production.Product, ��� ��� ��� ������ ProductSubcategoryID ������ 150.
SELECT [ProductSubcategoryID], MIN([Weight])
FROM [Production].[Product]
GROUP BY [ProductSubcategoryID]
HAVING MIN([Weight])>150

--2. ����� ����� ������� ������� (���� StandardCost) �� Production.Product. (4 �������)

SELECT [Name], [StandardCost]
FROM Production.Product
WHERE StandardCost=(SELECT MAX(StandardCost) FROM Production.Product)


SELECT	[Name], t.[StandardCost]
FROM
(SELECT [Name], [StandardCost],
		RANK() OVER (ORDER BY StandardCost DESC) rank
FROM Production.Product) t
WHERE rank=1



--3. ����� �������, ��� ������� �� ������ �������.

SELECT [CompID]
FROM [dbo].[Competitions] a
LEFT JOIN [dbo].[SwimPools] b ON a.[PoolID]=b.PoolID
WHERE a.[PoolID] IS NULL

--4. ����� ��� ������� ����� ���-�� ����������� �������� �� ��������� 15 ���.  (����� GROUP1)

SELECT JudgeID, COUNT (CompID)
FROM bridge_swim_judge a
JOIN Competitions b ON a.CompID=b.CompID
WHERE YEAR([Data]) BETWEEN YEAR(GETDATE())-15 AND YEAR(GETDATE())
GROUP BY JudgeID
 


--5. 
--Users (
    --id bigint NOT NULL,
   -- email varchar(255) NOT NULL
--);

--Notifications (
   -- id bigint NOT NULL,
    --user_id bigint NOT NULL,
    --category varchar(100),
    --is_read boolean DEFAULT false
--);

--����� ������ ��������� ��� ������������ alex@gmail.com, � ������� ����� 50 ������������� �����������


SELECT category, COUNT(is_read)
FROM Notifications a
JOIN Users b ON a.user_id = b.user_id
WHERE a.email = 'alex@gmail.com' AND b.is_read = 0
GROUP BY category
HAVING COUNT(is_read)>50

