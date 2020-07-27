USE `ita-model-bbdd-ex6`;

INSERT INTO Supplier (name, street, streetNumber, floor, door, city, postalCode, phone, fax, nif) VALUES
("Distribuïdor1", "street1", 10, 1, 1, "city1", "11111", "+11 111 11 11", "+11 111 11 11", "11111111A"),
("Distribuïdor2", "street2", 20, 2, 2, "city2", "22222", "+22 222 22 22", "+22 222 22 22", "2222222B"),
("Distribuïdor3", "street3", 30, 2, 3, "city3", "33333", "+33 333 33 33", "+33 333 33 33", "33333333C");

INSERT INTO Customer (name, address, phone, email) VALUES
("Comprador1", "address1", "+11 111 11 11", "curstomer1@mail.com"),
("Comprador2", "address2", "+22 222 22 22", "curstomer2@mail.com"),
("Comprador3", "address3", "+33 333 33 33", "curstomr3@mail.com");

INSERT INTO Employee (name) VALUES
("Treballador1"), ("Treballador2"), ("Treballador3");

INSERT INTO Mark (supplierId, name) VALUES
(1, "Marca1"), (1, "Marca2"), (1, "Marca3"),
(2, "Marca4"), (2, "Marca5"), (2, "Marca6"),
(3, "Marca7"), (3, "Marca8"), (3, "Marca9");

INSERT INTO Glasses (markId, gradeLeft, gradeRight, frameType, frameColor, leftColor, rightColor) VALUES
(4, "+1.2", "-0.75", "Pasta", "Negre", "Transparent", "Transparent"),
(3, "-0.5", "-0.5", "Flotant", "Blau", "Blau", "Blau"),
(1, "+1", "+2", "Metàl·lica", "Blanc", "Transparent", "Transparent");

INSERT INTO Sale (glassesId, customerId, employeeId) VALUES
(1, 1, 3), (2, 1, 2), (1, 2, 1), (3, 2, 1);

SELECT Sale.id AS COMPRA, glassesId AS ULLERES, Customer.name AS "COMPRAT PER", Employee.name AS "VENUT PER"
FROM Sale
JOIN Customer
ON Sale.customerId = Customer.id
JOIN Employee
ON Sale.employeeId = Employee.id;

SELECT Sale.id AS Compra, Glasses.id AS Ulleres, Mark.name AS Marca, Supplier.name AS "Distribuït per", Customer.name AS "Comprat per", Employee.name AS "Venut per"
FROM Sale, Glasses, Mark, Supplier, Customer, Employee
WHERE Sale.glassesId = Glasses.id AND Glasses.markId = Mark.id AND Mark.supplierId = Supplier.id AND Sale.customerId = Customer.id AND Sale.employeeId = Employee.id
ORDER BY Sale.id;

# hauria de donar error pq valorde frameType no és cap dels 3 acceptats:
INSERT INTO Glasses (markId, gradeLeft, gradeRight, frameType, frameColor, leftColor, rightColor) VALUES
(9, "`+2", "+4", "Ampolla", "Lila", "Verd", "Verd"); # error = ok!

UPDATE Customer SET recommendedByCustomerId = 1 WHERE id = 2;

# Hauria de donar error pq customer 4 no existeix:
UPDATE Customer SET recommendedByCustomerId = 4 WHERE id = 2; # error = ok!

