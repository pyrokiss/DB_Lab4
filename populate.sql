INSERT INTO Games
VALUES ('Undertale');
INSERT INTO Games
VALUES ('Hollow Knight');
INSERT INTO Games
VALUES ('Celeste');

INSERT INTO Genres
VALUES ('Role-Playing');
INSERT INTO Genres
VALUES ('Action Adventure');
INSERT INTO Genres
VALUES ('Action');

INSERT INTO GamesGenres
VALUES ('Undertale', 'Role-Playing');
INSERT INTO GamesGenres
VALUES ('Hollow Knight', 'Action Adventure');
INSERT INTO GamesGenres
VALUES ('Celeste', 'Action');

INSERT INTO Publishers
VALUES ('tobyfox');
INSERT INTO Publishers
VALUES ('Team Cherry');
INSERT INTO Publishers
VALUES ('Matt Makes Games Inc.');

INSERT INTO GamesPublishers
VALUES ('Undertale', 'tobyfox', 'Sep.15,2015');
INSERT INTO GamesPublishers
VALUES ('Hollow Knight', 'Team Cherry', 'Feb.24,2017');
INSERT INTO GamesPublishers
VALUES ('Celeste', 'Matt Makes Games Inc.', 'Jan.26,2018');

INSERT INTO Platforms
VALUES ('PC');
INSERT INTO Platforms
VALUES ('PS4');
INSERT INTO Platforms
VALUES ('Xbox');

INSERT INTO GamesPlatforms
VALUES ('Undertale', 'PC');
INSERT INTO GamesPlatforms
VALUES ('Undertale', 'Xbox');
INSERT INTO GamesPlatforms
VALUES ('Hollow Knight', 'PC');
INSERT INTO GamesPlatforms
VALUES ('Celeste', 'PS4');

INSERT INTO Humans
VALUES ('Bob');
INSERT INTO Humans
VALUES ('Boba');

INSERT INTO GameTime
VALUES ('Bob', 'Boba', 'Undertale', '17:00', '21:30');

