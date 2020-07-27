USE `ita-model-bbdd-ex3`;

INSERT INTO User (email, password) VALUES
("user1@mail.com", "secret"), ("user2@mail.com", "secret");

INSERT INTO Video (title, url, videoId, userId, description) VALUES
("video1", "https://user1.stube.com", "lkge9lkd", 1, "blablabla"),
("video2", "https://user1.stube.com", "kjhs03m", 2, "blablabla"),
("video3", "https://user2.stube.com", "pqa9m3", 1, "blablabla");

SELECT User.email, COUNT(Video.userId) AS VIDEOS FROM Video
JOIN User ON (User.id = Video.userId)
GROUP BY (Video.userId);