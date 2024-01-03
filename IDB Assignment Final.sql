CREATE DATABASE eBookStore;

USE eBookStore;

--CREATE TABLE
CREATE TABLE Publisher
(PublisherID NVARCHAR(50) NOT NULL PRIMARY KEY, 
Name NVARCHAR(50) NOT NULL,
Address NVARCHAR(50) NOT NULL,
ContactNo NVARCHAR(50) NOT NULL);

CREATE TABLE Book
(BookID NVARCHAR(50) NOT NULL PRIMARY KEY, 
Name NVARCHAR(50) NOT NULL,
Author NVARCHAR(50),
Retail_Price DECIMAL(10,2) NOT NULL,
Genre NVARCHAR(50),
Stock INT NOT NULL,
PublisherID NVARCHAR(50) NOT NULL FOREIGN KEY REFERENCES Publisher(PublisherID));

CREATE TABLE Member
(MemID NVARCHAR(50) NOT NULL PRIMARY KEY, 
Name NVARCHAR(50) NOT NULL,
ContactNum NVARCHAR(50) NOT NULL,
Address NVARCHAR(50) NOT NULL,
Email NVARCHAR(50) NOT NULL,
Username NVARCHAR(50)NOT NULL,
Password NVARCHAR(50)NOT NULL);

INSERT INTO Member VALUES
('M001','Jane Loo','0102212345','Bukit Angsana','jane.loo@gmail.com','janeloo','password1'),
('M002','John Smith','0109876543','Lensen','john.smith@gmail.com','johnsmith','password2'),
('M003','Alice Johnson','0185551212','Parkhill','alice.johnson@gmail.com','alicejohnson','password3'),
('M004','Bob Williams','60111234567','Endah','bob.williams@gmail.com','bobwilliams','password4'),
('M005','Mcnish David','0167558850','Damai Perdana','mcnish.david@gmail.com','mcnishdavid','password5'),
('M006','Sarah Miera','0105566123','Bukit Bintang','sarah.miera@gmail.com','sarahmiera','password6'),
('M007','Parkson Will','0192229980','Lensen','parkson.will@gmail.com','parksonwill','password7'),
('M008','Peter Parker','0162226550','Damai Perdana','peter.parker@gmail.com','peterparker','password8'),
('M009','George Sam','0111223613','Endah','george.sam@gmail.com','georgesam','password9'),
('M010','Elise Raymond','0167577881','Damai Perdana','elise.raymond@gmail.com','eliseraymond','password0');



SELECT * FROM Member;

CREATE TABLE Shopping_Cart
(CartID NVARCHAR(50) NOT NULL PRIMARY KEY,
Last_Modified_Date DATE,
MemID NVARCHAR(50) NOT NULL FOREIGN KEY REFERENCES Member(MemID));

CREATE TABLE Cart_Detail
(CartDetail_ID NVARCHAR(50) NOT NULL PRIMARY KEY,
Check_Status NVARCHAR(50) NOT NULL,
BookID NVARCHAR(50) NOT NULL FOREIGN KEY REFERENCES Book(BookID),
CartID NVARCHAR(50) NOT NULL FOREIGN KEY REFERENCES Shopping_Cart(CartID));

CREATE TABLE Customer_Order
(CusOrderID NVARCHAR(50) NOT NULL PRIMARY KEY, 
Quantity INT NOT NULL,
SubTotal DECIMAL(10,2) NOT NULL,
Order_Date DATE NOT NULL,
MemID NVARCHAR(50) NOT NULL FOREIGN KEY REFERENCES Member(MemID),
CartDetail_ID NVARCHAR(50) NOT NULL FOREIGN KEY REFERENCES Cart_Detail(CartDetail_ID),
PaymentID NVARCHAR(50) NOT NULL FOREIGN KEY REFERENCES Payment(PaymentID));

CREATE TABLE Publisher_Order
(PubOrderID NVARCHAR(50) NOT NULL PRIMARY KEY, 
Quantity INT NOT NULL,
Cost_Price DECIMAL(10,2) NOT NULL,
BookID NVARCHAR(50) NOT NULL FOREIGN KEY REFERENCES Book(BookID),
PublisherID NVARCHAR(50) NOT NULL FOREIGN KEY REFERENCES Publisher(PublisherID));

CREATE TABLE Payment
(PaymentID NVARCHAR(50) NOT NULL PRIMARY KEY, 
Payment_Date DATE,
Payment_Status NVARCHAR(50) NOT NULL,
Grand_Total DECIMAL(10,2) NOT NULL,
DeliveryID NVARCHAR(50) NOT NULL FOREIGN KEY REFERENCES Delivery(DeliveryID));

CREATE TABLE Delivery
(DeliveryID NVARCHAR(50) NOT NULL PRIMARY KEY,
Delivery_Date DATE NOT NULL,
Delivery_Status NVARCHAR(50) NOT NULL);

CREATE TABLE Review
(RatingID NVARCHAR(50) NOT NULL PRIMARY KEY,
Score DECIMAL,
TextReview NVARCHAR(100),
MemID NVARCHAR(50) NOT NULL FOREIGN KEY REFERENCES Member(MemID),
BookID NVARCHAR(50) NOT NULL FOREIGN KEY REFERENCES Book(BookID));


--INSERT VALUES INTO EACH TABLE

INSERT INTO Member VALUES
('M001','Jane Loo','0102212345','Bukit Angsana','jane.loo@gmail.com','janeloo','password1'),
('M002','John Smith','0109876543','Lensen','john.smith@gmail.com','johnsmith','password2'),
('M003','Alice Johnson','0185551212','Parkhill','alice.johnson@gmail.com','alicejohnson','password3'),
('M004','Bob Williams','60111234567','Endah','bob.williams@gmail.com','bobwilliams','password4'),
('M005','Mcnish David','0167558850','Damai Perdana','mcnish.david@gmail.com','mcnishdavid','password5'),
('M006','Sarah Miera','0105566123','Bukit Bintang','sarah.miera@gmail.com','sarahmiera','password6'),
('M007','Parkson Will','0192229980','Lensen','parkson.will@gmail.com','parksonwill','password7'),
('M008','Peter Parker','0162226550','Damai Perdana','peter.parker@gmail.com','peterparker','password8'),
('M009','George Sam','0111223613','Endah','george.sam@gmail.com','georgesam','password9'),
('M010','Elise Raymond','0167577881','Damai Perdana','elise.raymond@gmail.com','eliseraymond','password0');

INSERT INTO Publisher(PublisherID,Name,Address,ContactNo) VALUES
('PB001','Zeri Book Store','Bukit Jalil','0390179218'),
('PB003','ABC Publishing','Bukit Bintang','0390179097'),
('PB005','Red ant Publishing','Taman Segar','0390179222'),
('PB006','Sapphire Books','Kota Damansara','0390179118'),
('PB007','Midnight Publishing','Klang Valley','0390178890');

INSERT INTO Book(BookID,Name,Author,Retail_Price,Genre,Stock,PublisherID) VALUES
('B001','Smile Changes Everything','Jessica Lee',20.00,'Fiction',50,'PB001'),
('B002','Power of Belief','Howard Chen',35.00,'Self-help',20,'PB006'),
('B003','Rabbit and Dragon','Samuel Ng',10.00,'Children',10,'PB006'),
('B004','Fantasy and Reality','Jason Lim',25.00,'Fantasy',30,'PB003'),
('B005','The Earth and The Universe','Emily Yap',47.25,'Science',100,'PB003'),
('B006','The Last Star','Samantha Jameson',15.00,'Science',90,'PB007'),
('B007','The Shadow Garden','Evelyn Blackwood',50.00,'Mystery',70,'PB007'),
('B008','Forgotten Echoes','Vincent Tan',20.50,'Fantasy',110,'PB007'),
('B009','The Lost Crown','Harper Rayne',17.00,'Adventure',30,'PB007'),
('B010','The Crimson Isle','Isla Jones',55.00,'Fantasy',50,'PB006');


INSERT INTO Review(RatingID,Score,TextReview,MemID,BookID) VALUES
('R001',4,'I enjoyed this book very much.','M001','B010'),
('R002',5,'This book exceeded my expectations.','M010','B010'),
('R003',3,'It was okay, but not my favourite.','M003','B010'),
('R004',5,'I absolutely loved this book!','M007','B003'),
('R005',2,'I think the storyline of this book is bad.','M005','B007'),
('R006',5,'Good story, my son loves it!','M005','B003'),
('R007',5,'Receive in time, and nice story plot too!','M001','B007'),
('R008',4,'Overall is a good story','M007','B003'),
('R009',3,'Receive late, and decent storyline','M005','B010'),
('R010',1,'Terrible storybook! ','M001','B003');

INSERT INTO Shopping_Cart(CartID,MemID,Last_Modified_Date) VALUES
('S001','M001','4 February 2023'),
('S002','M002','7 February 2023'),
('S003','M003','6 January 2023'),
('S004','M004','20 January 2023'),
('S005','M005','15 February 2023'),
('S006','M006','21 January 2023'),
('S007','M007','6 February 2023'),
('S008','M008','11 February 2023'),
('S009','M009','12 February 2023'),
('S010','M010','18 February 2023');

INSERT INTO Delivery(DeliveryID,Delivery_Date,Delivery_Status) VALUES
('D001','9 February 2023','In progress'),
('D002','8 February 2023','Delivered'),
('D004','28 January 2023','Delivered'),
('D006','24 January 2023','Delivered'),
('D009','28 February 2023','In progress');


INSERT INTO Payment(PaymentID,Payment_Date,Payment_Status,Grand_Total,DeliveryID) VALUES
('P001','6 February 2023','Successful',40,'D001'),
('P002','8 February 2023','Successful',35,'D002'),
('P004','23 January 2023','Successful',100,'D004'),
('P007','9 February 2023','Successful',100,'D006'),
('P009','14 February 2023','Successful',51,'D009');

INSERT INTO Cart_Detail(CartDetail_ID,Check_Status,BookID,CartID) VALUES
('CD0001','Check Out','B001','S008'),
('CD0002','Check In','B003','S005'),
('CD0003','Check Out','B003','S004'),
('CD0004','Check Out','B002','S004'),
('CD0005','Check In','B005','S005'),
('CD0006','Check In','B006','S006'),
('CD0007','Check Out','B010','S007'),
('CD0008','Check In','B008','S001'),
('CD0009','Check Out','B009','S009'),
('CD0010','Check In','B003','S002');

INSERT INTO Customer_Order(CusOrderID,Quantity,Subtotal,Order_Date,MemID,CartDetail_ID,PaymentID) VALUES
('C0001',2,40.00,'6 February 2023','M008','CD0001','P001'),
('C0002',1,35.00,'8 February 2023','M004','CD0003','P002'),
('C0003',4,100.00,'23 January 2023','M004','CD0004','P004'),
('C0004',3,141.75,'15 February 2023','M007','CD0007','P007'),
('C0005',3,51.00,'14 February 2023','M009','CD0009','P009');

INSERT INTO Publisher_Order(PubOrderID,Quantity,Cost_Price,BookID,PublisherID) VALUES
('PBOR0001',100,10.00,'B001','PB001'),
('PBOR0002',50,25.00,'B002','PB006'),
('PBOR0003',200,5.00,'B003','PB006'),
('PBOR0004',40,20.00,'B004','PB003'),
('PBOR0005',120,35.00,'B005','PB003'),
('PBOR0006',100,10.00,'B006','PB007'),
('PBOR0007',200,40.00,'B007','PB005'),
('PBOR0008',110,10.00,'B008','PB007'),
('PBOR0009',120,10.00,'B009','PB007'),
('PBOR0010',130,45.00,'B010','PB006');


--MODIFY TABLE
ALTER TABLE  Publisher_Order DROP COLUMN OrderDate;

--RENAME COLUMN/TABLE
EXEC sp_rename 'Customer_Order.OrderDate','Order_Date','COLUMN';
EXEC sp_rename 'Publisher_Order.Cost-Price','Cost_Price','COLUMN'; 

--SELECT ENTIRE TABLE
SELECT * FROM Book;
SELECT * FROM Publisher;
SELECT * FROM Member;
SELECT * FROM Delivery;
SELECT * FROM Shopping_Cart;
SELECT * FROM Payment;
SELECT * FROM Review;
SELECT * FROM Customer_Order;
SELECT * FROM Cart_Detail;
SELECT * FROM Publisher_Order;

-- DROP TABLE
DROP TABLE Payment;


--QUESTION 1 ~ 12
--i
SELECT	Publisher.PublisherID, 
		Publisher.Name		AS Publisher_Name,
		COUNT(Book.BookID)	AS NumBook 
FROM	Book
FULL OUTER JOIN Publisher ON Book.PublisherID=Publisher.PublisherID 
GROUP BY Publisher.PublisherID, Publisher.Name
HAVING COUNT(Book.BookID)>0;

--ii
SELECT Cart_Detail.CartDetail_ID,Member.Name AS Mem_Name,book.Name AS Book_Name,Cart_Detail.Check_Status 
FROM Shopping_Cart
FULL OUTER JOIN Cart_Detail ON Shopping_Cart.CartID=Cart_Detail.CartID
FULL OUTER JOIN Member ON Shopping_Cart.MemID=Member.MemID
FULL OUTER JOIN Book ON Book.BookID= Cart_Detail.BookID
WHERE Cart_Detail.Check_Status='Check In';

--iii
SELECT Book.BookID,Book.Name AS Book_Name ,Highest_Avg_rate
FROM BooK 
INNER JOIN(
	SELECT Review.BookID, AVG(score) AS Highest_Avg_rate
	FROM Review GROUP BY BookID
) AS book_ratings
ON book_ratings.BookID=Book.BookID

INNER JOIN (
	SELECT MAX(Avg_rate) AS Highest_Rate
	FROM (
		SELECT Review.BookID, AVG(score) AS Avg_rate
		FROM Review GROUP BY BookID
		) AS TABLE_01
	) AS TABLE_02
ON book_ratings.Highest_Avg_rate=TABLE_02.Highest_Rate;

/*
SELECT TOP 1 Book.BookID,Book.name,AVG(review.Score) AS Average
FROM Book INNER JOIN Review ON Book.BookID=Review.BookID
GROUP BY Book.BookID,Book.Name
ORDER BY Average DESC;
*/

--iv
SELECT Member.MemID,Member.Name AS Mem_Name,COUNT(Review.MemID) AS Number_of_feedback 
FROM Review 
FULL OUTER JOIN Member 
ON Review.MemID=Member.MemID
GROUP BY Member.MemID,Member.Name
HAVING COUNT(Review.MemID) <> 0
ORDER BY Number_of_feedback DESC;

--v 
SELECT Publisher.PublisherID,Name AS Publisher_Name, Most_Num_Book
FROM Publisher
FULL OUTER JOIN(
	SELECT PublisherID,COUNT(PublisherID) AS Most_Num_Book
	FROM Book  
	GROUP BY PublisherID
) TABLE_01
ON Publisher.PublisherID=TABLE_01.PublisherID
INNER JOIN(
	SELECT MAX(Num_Pub) AS Most_Pub
	FROM 
		(
		SELECT COUNT(PublisherID) AS Num_Pub
		FROM Book
		GROUP BY PublisherID
		) TABLE_02
	)TABLE_03
ON TABLE_03.Most_Pub=TABLE_01.Most_Num_Book;

--vi
SELECT PublisherID,SUM(Quantity) AS Total_Book_Ordered FROM Publisher_Order
GROUP BY PublisherID
HAVING SUM(Quantity)>0;


--vii
SELECT Genre, Most_Stock
FROM(
	SELECT Genre, SUM(Stock) AS Most_Stock
	FROM Book
	GROUP BY Genre
	) TABLE_01
WHERE Most_Stock=(
			SELECT MAX(Sum_Stock) AS Max_Stock
			FROM(
				SELECT SUM(Stock) AS Sum_Stock
				FROM Book
				GROUP BY Genre
				)SUM_TABLE
			);



--viii
SELECT Book.BookID,Book.Name AS Book_Name , Best_Selling
FROM BooK 
INNER JOIN(
	SELECT Cart_Detail.BookID, SUM(Quantity) AS Best_Selling
	FROM Customer_Order
	INNER JOIN Cart_Detail ON Cart_Detail.CartDetail_ID=Customer_Order.CartDetail_ID
	GROUP BY Cart_Detail.BookID
) AS TABLE_01
ON TABLE_01.BookID=Book.BookID

INNER JOIN (
	SELECT MAX(Sum_Quantity) AS Max_Sum
	FROM (
		SELECT Cart_Detail.BookID, SUM(Quantity) AS Sum_Quantity
		FROM Customer_Order 
		INNER JOIN Cart_Detail ON Cart_Detail.CartDetail_ID=Customer_Order.CartDetail_ID
		GROUP BY Cart_Detail.BookID
		) AS TABLE_02
	) AS TABLE_03
ON TABLE_01.Best_Selling=TABLE_03.Max_Sum;

DROP DATABASE GRP11;

SELECT * FROM Book 
WHERE Name LIKE 'S%';
 

--ix
SELECT Table_1.MemID, Table_1.Name AS Mem_Name,Total_Spent
FROM(
	SELECT Customer_Order.MemID,Member.Name,SUM(Customer_Order.SubTotal) AS Total_Spent 
	FROM Customer_Order
	INNER JOIN Member 
	ON Member.MemID=Customer_Order.MemID
	GROUP BY Customer_Order.MemID,Member.Name
	) Table_1
WHERE Total_Spent=(
	SELECT MAX(Total_Spent) AS Most_Spent
	FROM(
		SELECT Customer_Order.MemID,Member.Name,SUM(Customer_Order.SubTotal) AS Total_Spent 
		FROM Customer_Order
		INNER JOIN Member 
		ON Member.MemID=Customer_Order.MemID
		GROUP BY Customer_Order.MemID,Member.Name
		) Table_2
);


--x
SELECT Member.MemID, Member.Name
FROM Member
LEFT JOIN Customer_Order
ON Member.MemID = Customer_Order.MemID
WHERE Customer_Order.CusOrderID IS NULL;

--xi

SELECT Customer_Order.CusOrderID,Book.BookID,Book.Name AS Book_Name,Cart_Detail.Check_Status,Payment.Payment_Status,Delivery.DeliveryID,Delivery.Delivery_Status
FROM Book
INNER JOIN Cart_Detail ON Cart_Detail.BookID=Book.BookID
INNER JOIN Customer_Order ON Customer_Order.CartDetail_ID=Cart_Detail.CartDetail_ID
INNER JOIN Payment ON Payment.PaymentID=Customer_Order.PaymentID
INNER JOIN Delivery ON Delivery.DeliveryID=Payment.DeliveryID
WHERE Delivery.Delivery_Status = 'In progress';

--xii
SELECT Member.MemID,Member.Name AS Mem_Name,COUNT(CusOrderID) AS Order_num
FROM Customer_Order
INNER JOIN Member ON Member.MemID=Customer_Order.MemID
GROUP BY Member.MemID,Member.Name
HAVING COUNT(CusOrderID)>2;




