select * from Plane;
INSERT INTO Plane (capacity, model) VALUES
(3, "Triplane"), (5, "Penplane"), (1, "F1");

INSERT INTO Seat (planeId) VALUES
(1), (1), (1), (2), (2), (2), (2), (2), (3);

SELECT COUNT(*) FROM Seat WHERE planeID = 1;
SELECT COUNT(*) FROM Seat WHERE planeID = 2;
SELECT COUNT(*) FROM Seat WHERE planeID = 3;

SELECT *
FROM Plane 
INNER JOIN Seat
ON (Plane.id = Seat.planeId);

SELECT Plane.id, Plane.model, COUNT(Seat.planeId) AS planeCapacity
FROM Seat JOIN Plane
ON (Plane.id = Seat.planeId)
GROUP BY planeId 
ORDER BY planeCapacity DESC;
