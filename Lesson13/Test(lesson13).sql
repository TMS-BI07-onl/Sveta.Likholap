--1.	�������� ������ �� ���������� � ������� manufacturer ������ ������������� HP �� �������.
INSERT INTO manufacturer (name, country_ID)
VALUES ('new_manufacturer', 4);

--2.	�������� ������, ��������� �������� ������� ������������ ������ � ������� user ���������� � 3 ����.
UPDATE user
SET age = 18/3
WHERE name = Andrey;

--3.	����� �������� �������� � ������������ �����.
SELECT	Name
FROM
(SELECT Name,
		RANK() OVER (GROUP BY Name ORDER BY price DESC) rank
FROM Product) a
WHERE rank=1

--4.	�������� ������ �� ������� ���� ������������� � ����������, ������������� �� 3 � 
--���������������� �� 4, ���� � ��������� > 35.
SELECT a.name
FROM user AS a
JOIN phone AS b
ON a.user_id=b.user_id
WHERE b.name LIKE '3%4' OR a.age > 35;


--5.	����� ��� 5 �������������, ��� ����� ������ ����� ���������.
SELECT TOP 5 c.name, c.amount
FROM
(SELECT b.name,
	COUNT(user_id) OVER (PARTITION BY name) AS amount
    FROM order a
	join user b
	on a.user_id=b.user_id) c
ORDER BY c.amount DESC

