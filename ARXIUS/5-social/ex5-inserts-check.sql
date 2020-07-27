USE `ita-model-bbdd-ex5`;

INSERT INTO User (name, email, password) VALUES
("user1", "user1@mail.com", "SECRET1"),
("user2", "user2@mail.com", "SECRET2"),
("user3", "user3@mail.com", "SECRET3");

INSERT INTO Photo (address, url, userId) VALUES
("address1", "https://user1.photos.com/1", 1),
("address1", "https://user1.photos.com/2", 1),
("address1", "https://user1.photos.com/3", 1),
("address2", "https://user2.photos.com/1", 2),
("address3", "https://user2.photos.com/2", 2),
("address4", "https://user2.photos.com/3", 2),
("address4", "https://user2.photos.com/4", 2);

INSERT INTO Friend (userId, friendId, howMeet) VALUES
(1, 2, "blablabla"),
(1, 3, "blablabla"),
(2, 1, "blablabla"),
(3, 1, "blablabla");

INSERT INTO Friend (userId, friendId, howMeet) VALUES
(4, 1, "Hauria de donar error pq usuari 4 no existeix"); # error = OK

SELECT id, userId, friendId, howMeet FROM Friend
WHERE userId = 1;

