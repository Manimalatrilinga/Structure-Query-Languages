/*****************************************************************************
* FileName: Create Library Management System Database.sql
*
* Summary: Creates a Library Management System database for tracking
* books, members, loans, reservations, and fines.
*
* Date: October 27, 2023
*
* SQL Versions:
* MySQL, PostgreSQL, SQL Server (Adjust syntax as needed)
*
******************************************************************************
* Copyright (C) 2023 [Your Name/Organization], [Your Website/GitHub]
* All rights reserved.
*
* For more scripts and sample code, check out
* [Your Website/GitHub]
*
* You may alter this code for your own *non-commercial* purposes. You may
* republish altered code as long as you include this copyright and give
* due credit.
*
*
* THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF
* ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED
* TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
* PARTICULAR PURPOSE.
*
******************************************************************************/

-- Database Creation (if needed)
CREATE DATABASE LibraryManagementSystem;
USE LibraryManagementSystem;

-- 1. Books Table
CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    ISBN VARCHAR(20) UNIQUE,
    PublicationYear INT,
    CategoryID INT, -- Foreign Key to Categories table
    AvailableCopies INT NOT NULL DEFAULT 1,
    TotalCopies INT NOT NULL DEFAULT 1
);

-- 2. Categories Table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(100) UNIQUE NOT NULL
);

-- 3. Members Table
CREATE TABLE Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Address VARCHAR(255),
    PhoneNumber VARCHAR(20),
    Email VARCHAR(255) UNIQUE
);

-- 4. Loans Table
CREATE TABLE Loans (
    LoanID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT, -- Foreign Key to Books table
    MemberID INT, -- Foreign Key to Members table
    LoanDate DATE NOT NULL,
    ReturnDueDate DATE NOT NULL,
    ReturnDate DATE, -- Null if not returned
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- 5. Reservations Table.
CREATE TABLE Reservations (
    ReservationID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    MemberID INT,
    ReservationDate DATE NOT NULL,
    ReservationExpiryDate DATE, -- Null if not expired
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- 6. Fines Table
CREATE TABLE Fines (
    FineID INT PRIMARY KEY AUTO_INCREMENT,
    LoanID INT,
    FineAmount DECIMAL(10, 2) NOT NULL,
    PaymentDate DATE, -- Null if not paid
    FOREIGN KEY (LoanID) REFERENCES Loans(LoanID)
);

-- Example Data Insertion (Optional)

-- Categories
INSERT INTO Categories (CategoryName) VALUES ('Fiction'), ('Non-Fiction'), ('Science Fiction'), ('Mystery'), ('Biography');

-- Books
INSERT INTO Books (Title, Author, ISBN, PublicationYear, CategoryID, TotalCopies, AvailableCopies) VALUES
('The Hobbit', 'J.R.R. Tolkien', '978-0-261-10221-7', 1937, 1, 3, 3),
('Sapiens', 'Yuval Noah Harari', '978-0-06-231621-3', 2014, 2, 2, 2),
('Dune', 'Frank Herbert', '978-0-441-17271-9', 1965, 3, 1, 1),
('The Girl with the Dragon Tattoo', 'Stieg Larsson', '978-0-307-26975-1', 2005, 4, 2, 2),
('Steve Jobs', 'Walter Isaacson', '978-1-4516-4853-9', 2011, 5, 1, 1);

-- Members
INSERT INTO Members (FirstName, LastName, Address, PhoneNumber, Email) VALUES
('John', 'Doe', '123 Main St', '555-1234', 'john.doe@example.com'),
('Jane', 'Smith', '456 Oak Ave', '555-5678', 'jane.smith@example.com');

-- Loans (Example, adjust dates as needed)
INSERT INTO Loans (BookID, MemberID, LoanDate, ReturnDueDate) VALUES
(1, 1, '2023-10-26', '2023-11-09');

-- Reservations (Example, adjust dates as needed)
INSERT INTO Reservations (BookID, MemberID, ReservationDate, ReservationExpiryDate) VALUES
(3, 2, '2023-10-27', '2023-11-03');