
--�������� ������ ��� ����� OrderQty ��� ������� ���� � ������ ������� �� 
--Production.WorkOrder � ���� ����������������� �������


SELECT Year, [January], [February], [December]
FROM 
(SELECT DATENAME(year,[DueDate]) AS Year, DATENAME(month,[DueDate]) AS DD, [OrderQty]
    FROM [Production].[WorkOrder]) AS p
PIVOT
(
SUM ([OrderQty])
FOR DD IN 
([December], [January], [February])
)AS pvt
ORDER BY Year;



--��������
SELECT SUM ([OrderQty]) AS Dec2011
FROM [Production].[WorkOrder]
WHERE DATENAME(year,[DueDate]) = 2011 AND DATENAME(month,[DueDate]) = 'December'