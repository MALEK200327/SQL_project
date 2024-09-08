/*
Title : COM2008 Tutorial 02
Description : Example Database Operations on  table.
Author : Ayeshmantha Wijayagunethilake
*/


#########################  Creating New Tables  #########################

# This command is used to create a new table called  in the database called Authors.

CREATE TABLE Authors (
  author_id INT NOT NULL,
  full_name VARCHAR(100) NULL,
  date_of_birth DATE NULL,
  PRIMARY KEY (author_id)
);

# This command is used to create a new table called  in the database called Books.

CREATE TABLE Books (
  isbn CHAR(13) NOT NULL,
  title VARCHAR(100) NULL,
  author_id INT NULL,
  publication_year INT NULL,
  genre VARCHAR(30) NULL,
  copies_available INT NULL,
  price DECIMAL(8,2) NULL,
  PRIMARY KEY (isbn),
  FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

#########################  Inserting data into tables  #########################

# This command inserts 1 record into the Authors table.

INSERT INTO Authors (author_id, full_name, date_of_birth) 
VALUES (1, 'Harper Lee', '1926-04-28');

# This command inserts 9 records into the Authors table.

INSERT INTO Authors (author_id, full_name, date_of_birth) 
VALUES (2, 'George Orwell', '1903-06-25'),
(3, 'Jane Austen', '1775-12-16'),
(4, 'F. Scott Fitzgerald', '1896-09-24'),
(5, 'J.D. Salinger', '1919-01-01'),
(6, 'William Golding', '1911-09-19'),
(7, 'J.R.R. Tolkien', '1892-01-03'),
(8, 'Charles Dickens', '1812-02-07'),
(9, 'J.K. Rowling', '1965-07-31'),
(10, 'Dan Brown', '1964-06-22');

# This command inserts 10 records into the Books table.

INSERT INTO Books (isbn,title,author_id,publication_year,genre,copies_available,price)
VALUES('9780099549482', 'To Kill a Mockingbird', 1 , 1960 , 'Fiction ', 5, 12.99),
  ('9780198185215', '1984', 2, 1949, 'Science Fiction', 8, 9.99),
  ('9783458751403', 'Pride and Prejudice', 3, 1813, 'Romance', 3, 8.49),
  ('9780023381201', 'The Great Gatsby', 4, 1925, 'Fiction', 4, 10.99),
  ('9780140237504', 'The Catcher in the Rye', 5, 1951, 'Fiction', 7, 11.49),
  ('9780571056866', 'Lord of the Flies', 6, 1954, 'Adventure', 3, 9.99),
  ('9780044403371', 'The Hobbit', 7, 1937, 'Fantasy', 6, 12.99),
  ('9780582400115', 'A Tale of Two Cities', 8, 1859, 'Historical Fiction', 2, 7.99),
  ('9780545582889', 'Harry Potter and the Sorcerer''s Stone', 9, 1997, 'Fantasy', 10, 14.99),
  ('9780385513227', 'The Da Vinci Code', 10, 2003, 'Mystery', 5, 11.99);

#########################  Retreiving Data from the New Tables  #########################

# This command retreives all the records in the Authors table.

SELECT * FROM Authors;

# This command retreives all the records in the Books table.

SELECT * FROM Books;

#########################  Describing the Books table.  #########################

# This command provides a brief overview of the table structure.

DESCRIBE Books;

#########################  Selecting specific data from the table.  #########################

# This command retrieves all the records from the Books table where the title is 'The Hobbit'.

SELECT * FROM Books
WHERE title = 'The Hobbit';

# This command retrieves all the records from the Books table where the publication year is 1951 and the genre is 'Fiction'

SELECT * FROM Books
WHERE publication_year = 1951 AND genre = 'Fiction';

# This command retrieves all the records from the Books table where the genre is 'Fantasy'.

SELECT * FROM Books
WHERE genre = 'Fantasy';

# This command retrieves all the records from the Books table where the publication_year is greater than 2000.

SELECT * FROM Books
WHERE publication_year > 2000;

# This command retrieves all the records from the Books table and orders the data by publication_year descending.

SELECT * FROM Books
ORDER BY publication_year DESC;

# This command retrieves the title and authors columns from the Books table where the genre is 'Fiction'.

SELECT title, author_id FROM Books
WHERE genre = 'Fiction';

# This command calculates the average value of the price column.

SELECT AVG(price)
FROM Books;

# This command retrieves the top 5 rows of the Books table.

SELECT * FROM Books
LIMIT 5;

# This command retrieves the rows where the publication_year is greater than 2000 and the genre is either 'Fantasy' or 'Mystery'.

SELECT * FROM Books
WHERE publication_year > 2000
AND (genre = 'Fantasy' OR genre = 'Mystery');

#########################  Updating data in the table.  #########################

#################################################################################

# Checking the book in the beginning. The price should be 10.99.

SELECT * FROM Books WHERE isbn = '9780023381201';

# This command updates the price of the row where the isbn is 9780023381201.

UPDATE Books
SET price = 12.99
WHERE isbn = '9780023381201';

# Checking after updating the book. The price should be 12.99.

SELECT * FROM Books WHERE isbn = '9780023381201';

#################################################################################

# Checking the book in the beginning. The number of copies should be 5.

SELECT * FROM Books WHERE isbn = '9780385513227';

# This command updates the number of copies available of the row where the isbn is 9780385513227.

UPDATE Books
SET copies_available = copies_available + 2
WHERE isbn = '9780385513227';

# Checking after updating the book. The number of copies should be 7.

SELECT * FROM Books WHERE isbn = '9780385513227';

#################################################################################

# Checking the genre of the book before updating. The genre should be Mystery.

SELECT * FROM Books WHERE isbn = '9780385513227';

# This command updates the genre of the row where the isbn is 9780385513227.

UPDATE Books
SET genre = 'Thriller'
WHERE isbn = '9780385513227';

# Checking the genre of the book after updating. The genre should be Thriller.

SELECT * FROM Books WHERE isbn = '9780385513227';

#######################################################################################

#########################  Deleting data in the Books table.  #########################

#######################################################################################

# Viewing the Books table before deleting a book.

SELECT * FROM Books;

# This command deletes the row where the isbn is 9783458751403(Pride and Prejudice).

DELETE FROM Books
WHERE isbn = '9783458751403';

# Viewing the Books table after deleting a book.

SELECT * FROM Books;

#######################################################################################

# Viewing the Books table before deleting a book.

SELECT * FROM Books;

# This query deletes the row(s) where the publication_year is greater than 2000 (The Da Vinci Code).

DELETE FROM Books
WHERE publication_year > 2000;

# Viewing the Books table after deleting a book.

SELECT * FROM Books;

#######################################################################################

#########################  Deleting the two tables.  ##################################

# This command deletes both the tables we created.
# We must delete the books table before we delete the author table because of the foreign key that is used by the books table.

DROP TABLE Books; 

DROP TABLE Authors; 
