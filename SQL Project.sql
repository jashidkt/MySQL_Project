create database Library;
use Library;

CREATE TABLE Branch (
    Branch_No INT PRIMARY KEY,
    Manager_ID INT,
    Branch_Address VARCHAR(255),
    Contact_No BIGINT
);

CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(255),
    Position VARCHAR(255),
    Salary DECIMAL (10, 2) CHECK (Salary >= 0),
    Branch_No INT
);

CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(255),
    Customer_Address VARCHAR(255),
    Reg_Date DATE
);

CREATE TABLE IssueStatus (
    Issue_ID INT PRIMARY KEY,
    Issued_Cust INT,
    Issued_Book_Name VARCHAR(255),
    Issued_Date DATE,
    Isbn_Book BIGINT,
    FOREIGN KEY (Issued_Cust) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Isbn_Book) REFERENCES Books(ISBN)
);

CREATE TABLE ReturnStatus (
    Return_ID INT PRIMARY KEY,
    Return_Cust INT,
    Return_Book_Name VARCHAR(255),
    Return_Date DATE,
    Isbn_Book2 BIGINT,
    FOREIGN KEY (Isbn_Book2) REFERENCES Books(ISBN)
);

CREATE TABLE Books (
    ISBN BIGINT PRIMARY KEY,
    Books_Title VARCHAR(255),
    Category VARCHAR(255),
    Rental_Price DECIMAL (10, 2) CHECK (Rental_Price >= 0),
    Status VARCHAR(255),
    Author VARCHAR(255),
    Publisher VARCHAR(255)
);

INSERT INTO Books (ISBN, Books_Title, Category, Rental_price, Status, Author, Publisher) VALUES
(9780439785969, 'Harry Potter and the Half-Blood Prince', 'Fantasy', 1000.50,'Available', 'J.K. Rowling', 'Scholastic Inc'),
(9780517226957,'The Ultimate Hitchhiker Guide: Five Complete Novels and One Story','Fantasy',968.50,'Available','Douglas Adams','Gramercy Books'),
(9780767908184, 'A Short History of Nearly Everything', 'Travel', 740.00,'Available', 'Bill Bryson', 'Broadway Books'),
(9780618517657, 'The Lord of the Rings', 'Fiction', 876.00,'Available', 'Bill Bryson','Houghton Mifflin Harcourt'),
(9780141312620, 'The Changeling Sea', 'Adventure', 550.00,'Available', 'Patricia A. McKillip','Firebird'),
(9780061159176, 'The Known World', 'Travel', 510.00,'Available', 'Edward P. Jones','Amistad'),
(9780374280390, 'Uncommon Carriers', 'Adventure', 320.00,'Not Available', 'John McPhee','Farrar Straus Giroux'),
(9780441294671, 'God Emperor of Dune', 'Fantasy', 320.00,'Not Available', 'Frank Herbert','Ace Books'),
(9780679767473, 'The Untouchable', 'History', 450.00,'Not Available', 'John Banville','Vintage'),
(9780802130167, 'Quiet Days in Clichy', 'Fiction', 700.00,'Not Available', 'Henry Miller','Grove Press'),
(9781565842212, 'The War', 'History', 700.00,'Not Available', 'Marguerite Duras','The New Press'),
(9781402714573, 'Treasure Island', 'Travel', 290.00,'Available', 'Robert Louis Stevenson','Sterling Children Books');

INSERT INTO Branch ( Branch_No,Manager_ID,Branch_Address,Contact_No) VALUES
('1000','1001','Trivandrum','8111111112'),
('2000','2001','Kochin','8111111113'),
('3000','3001','Kottayam','8111111114'),
('4000','4001','Thrissur','8111111115'),
('5000','5001','Calicut','8111111116'),
('6000','6001','Kannur','8111111117');

INSERT INTO Customer ( Customer_ID, Customer_Name, Customer_Address, Reg_Date) VALUES 
(100001,'Joseph','Kochi','2021-12-23'),
(100002,'Satya','Aluva','2020-06-15'),
(100003,'Manoj','Iringalakuda','2022-06-11'),
(100004,'John','Nilambur','2022-08-02'),
(100005,'Arif','Manjeri','2021-11-29'),
(100006,'Adam','Kochi','2021-10-30'),
(100007,'Bala','Alappuzha','2022-03-25'),
(100008,'Faizal','Kottayam','2022-04-23'),
(100009,'Rashi','Malappuram','2021-04-20'),
(100010,'Abraham','Kalpatta','2021-05-13'),
(100011,'Soumya','Trivandrum','2021-06-07'),
(100012,'Saranya','Kollam','2021-08-22'),
(100013,'Arya','Pathanamthitta','2021-09-28'),
(100014,'Haya','Trivandrum','2021-10-23');

INSERT INTO Employee ( Emp_ID, Emp_Name, Position, Salary, Branch_No ) VALUES 
(1001,'Akhil','Manager',80000.00, 1000),
(1002,'Hiba','Librarian',45000.00,2000),
(1003,'Sarath','Adminstrator',53000.00,3000),
(1004,'Nirav','Clerk',48000.00,4000),
(1005,'Manjusha','Librarian',45000.00,1000),
(1007,'Salam','Clerk',48000.00,5000),
(1008,'Ashraf','Manager',78000.00,6000),
(1009,'Justin','Adminstrator',51000.00,2000),
(1010,'Hareesh','Clerk',48000.00,1000);

INSERT INTO IssueStatus ( Issue_ID, Issued_Cust, Issued_Book_Name, Issued_Date, Isbn_Book ) VALUES 
(300001,100005,'Harry Potter and the Half-Blood Prince', '2022-11-20', 9780439785969 ),
(300002,100011,'God Emperor of Dune', '2022-11-22', 9780441294671 ),
(300003,100003,'A Short History of Nearly Everything', '2022-11-27', 9780767908184 ),
(300004,100012,'Treasure Island', '2022-11-30', 9781402714573 ),
(300005,100001,'The Untouchable', '2022-12-07', 9780679767473 ),
(300006,100004,'Quiet Days in Clichy', '2023-06-07', 9780802130167 ),
(300007,100002,'The Known World', '2023-06-16', 9780061159176 );

INSERT INTO ReturnStatus (Return_ID, Return_Cust, Return_Book_Name, Return_Date, Isbn_Book2 ) VALUES
(300001,100005,'Harry Potter and the Half-Blood Prince', '2022-12-20', 9780439785969 ),
(300002,100011,'God Emperor of Dune', '2022-12-22', 9780441294671 ),
(300003,100003,'A Short History of Nearly Everything', '2022-12-27', 9780767908184 ),
(300004,100012,'Treasure Island', '2022-12-30', 9781402714573 ),
(300005,100002,'The Untouchable', '2022-12-26', 9780679767473 );

-- Retrieve the book title, category, and rental price of all available books
SELECT Books_Title, Category, Rental_price FROM Books;

-- List the employee names and their respective salaries in descending order of salary
SELECT  Emp_Name, Salary FROM Employee ORDER BY Salary;

-- Retrieve the book titles and the corresponding customers who have issued those books
SELECT IssueStatus.Issued_Book_Name, Customer.Customer_Name FROM IssueStatus INNER JOIN Customer ON IssueStatus.Issued_Cust = Customer.Customer_ID;

-- Display the total count of books in each category
SELECT COUNT(Books_Title), Category FROM Books GROUP BY Category;

-- Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000
SELECT Emp_Name, Position FROM Employee WHERE Salary >= 50000;

-- List the customer names who registered before 2022-01-01 and have not issued any books yet
SELECT  Customer_Name,Reg_Date FROM Customer WHERE Reg_Date < '2022-01-01' AND Customer_ID NOT IN ( SELECT Issued_Cust FROM IssueStatus);

-- Display the branch numbers and the total count of employees in each branch
SELECT Branch_No, COUNT(Emp_ID) AS Total_Employees FROM Employee GROUP BY Branch_No;

-- Display the names of customers who have issued books in the month of June 2023
SELECT Customer_Name FROM Customer WHERE Customer_ID IN (SELECT Issued_Cust FROM IssueStatus WHERE Issued_Date BETWEEN '2023-06-01' AND '2023-06-30');

-- Retrieve book_title from book table containing history
SELECT Books_Title FROM Books WHERE Books_Title LIKE '%history%';

-- Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
SELECT Branch_No, COUNT(Emp_ID) FROM Employee GROUP BY Branch_No HAVING COUNT(Emp_ID) >5 ;
