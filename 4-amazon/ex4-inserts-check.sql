USE `ita-model-bbdd-ex4`;

# usuaris
INSERT INTO User (name, email, password) VALUES
("user1", "mail1@mail.com", "SECRET1"), ("user2", "mail2@mail.com", "SECRET2");

# autors
INSERT INTO Author (address) VALUES
("Adreça1"), ("Adreça2");

# llibres
INSERT INTO Book (units, price, authorId) VALUES
(10, 10, 1),
(5, 20, 1),
(3, 14.5, 2),
(20, 30, 2);

# COMPRA 1 per usuari 1
INSERT INTO Sale (userId) VALUES
(1);

# llibres a compra 1
INSERT INTO BooksOnSale (saleId, bookId) VALUES
(1, 1), (1, 2);

# actualitza número d'unitats de llibres comprats
UPDATE Book SET units = units-1 WHERE id = 1;
UPDATE Book SET units = units-1 WHERE id = 2;

# Book 1 hauria de tenir 9 unitats:
SELECT units FROM Book WHERE id = 1;
# ok!

# i Book 2 n'hauria de tenir 4:
SELECT units FROM Book WHERE id = 2;
# ok!

# COMPRA 2 per usuari 1
INSERT INTO Sale (userId) VALUES
(1);

# llibres a compra 2
INSERT INTO BooksOnSale (saleId, bookId) VALUES
(2, 3), (2, 4), (2, 1);

# actualitza número d'unitats de llibres comprats
UPDATE Book SET units = units-1 WHERE id = 3;
UPDATE Book SET units = units-1 WHERE id = 4;
UPDATE Book SET units = units-1 WHERE id = 1;

# COMPRA 3 per usuari 2
INSERT INTO Sale (userId) VALUES
(2);

# llibres a compra 2
INSERT INTO BooksOnSale (saleId, bookId) VALUES
(3, 3);

# actualitza número d'unitats de llibres comprats
UPDATE Book SET units = units-1 WHERE id = 3;

# Book 3 hauria de donar 1
SELECT units FROM Book WHERE id = 3;
# ok!

SELECT * FROM Sale WHERE userId = 1;

SELECT * FROM BooksOnSale WHERE saleId = 2;

SELECT Sale.id AS SALE, User.name AS USER_NAME  FROM Sale 
JOIN User WHERE (User.id = Sale.userId);

SELECT saleId AS SALE, bookId AS BOOK, Author.id AS AUTHOR, Author.address
FROM BooksOnSale 
JOIN Book ON (BooksOnSale.bookId = Book.id) 
JOIN Author ON (Book.authorId = Author.id)
WHERE saleId = 3;