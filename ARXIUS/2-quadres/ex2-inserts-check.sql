
INSERT INTO Buyer (name, lastName, dni) VALUES
("Nom1", "Cognom1", "11111111A"),
("Nom2", "Cognom2", "2222222B");

INSERT INTO Painting (price, author) VALUES
("2000", "Autor1"),
("1500", "Autor2"),
("3000.5", "Autor3");

INSERT INTO Sale (buyerId, paintingId) VALUES
(1, 1), (1, 3), (2, 2);

# hauria de donar error perquè el quadre 1 ja està venut:
INSERT INTO Sale (buyerId, paintingId) VALUES
(2, 1);
# error = ok