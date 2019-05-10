--1.Creating a table with an ID and a Name
CREATE TABLE BOOKSHELVES (id SERIAL PRIMARY KEY, name VARCHAR(255));

--2.Inserting data into the bookshelf database from the books database
INSERT INTO bookshelves(name) SELECT DISTINCT bookshelf FROM books;

--3. Adding bookshelf ID column to books table
ALTER TABLE books ADD COLUMN bookshelf_id INT;

--4. setting the bookshelf_id  to the correct shelf_id 
UPDATE books SET bookshelf_id=shelf.id FROM (SELECT * FROM bookshelves) AS shelf WHERE books.bookshelf = shelf.name;

--5. Dropping the bookshelf column from the books table.
ALTER TABLE books DROP COLUMN bookshelf;

--6. connecting the forgien key constraint of bookshelf_id to the primary key of bookshelf table.
ALTER TABLE books ADD CONSTRAINT fk_bookshelves FOREIGN KEY (bookshelf_id) REFERENCES bookshelves(id);