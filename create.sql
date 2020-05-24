DROP TABLE Games;
DROP TABLE Genres;
DROP TABLE Platforms;
DROP TABLE Publishers;
DROP TABLE Humans;
DROP TABLE GamesGenres;
DROP TABLE GamesPlatforms;
DROP TABLE GamesPublishers;
DROP TABLE GameTime;

CREATE TABLE Games (
    gname VARCHAR2(150) NOT NULL
);
ALTER TABLE Games ADD CONSTRAINT games_pk PRIMARY KEY ( gname );

CREATE TABLE Genres (
    genre VARCHAR2(50) NOT NULL
);
ALTER TABLE Genres ADD CONSTRAINT genres_pk PRIMARY KEY ( genre );

CREATE TABLE Platforms (
    platform VARCHAR2(50) NOT NULL
);
ALTER TABLE Platforms ADD CONSTRAINT platforms_pk PRIMARY KEY ( platform );

CREATE TABLE Publishers (
    publisher VARCHAR2(75) NOT NULL
);
ALTER TABLE Publishers ADD CONSTRAINT publishers_pk PRIMARY KEY ( publisher );

CREATE TABLE Humans (
    human_name VARCHAR2(75) NOT NULL
);
ALTER TABLE Humans ADD CONSTRAINT humans_pk PRIMARY KEY ( human_name );

CREATE TABLE GamesGenres (
    gname VARCHAR2(150) NOT NULL,
    genre VARCHAR2(50) NOT NULL
);  
ALTER TABLE GamesGenres ADD CONSTRAINT gamesgenres_pk PRIMARY KEY ( gname, genre );

CREATE TABLE GamesPlatforms (
    gname VARCHAR2(150) NOT NULL,
    platform VARCHAR2(50) NOT NULL
);
ALTER TABLE GamesPlatforms ADD CONSTRAINT gamesplatforms_pk PRIMARY KEY ( gname, platform );

CREATE TABLE GamesPublishers (
    gname VARCHAR2(150) NOT NULL,
    publisher VARCHAR2(75) NOT NULL,
    release_date VARCHAR2(20)
);
ALTER TABLE GamesPublishers ADD CONSTRAINT gamespublishers_pk PRIMARY KEY ( gname, publisher );

CREATE TABLE GameTime (
    player1 VARCHAR2(150) NOT NULL,
    player2 VARCHAR2(150) NOT NULL,
    gname VARCHAR2(150) NOT NULL,
    start_time VARCHAR2(20) NOT NULL,
    end_time VARCHAR2(20) NOT NULL
);
ALTER TABLE GameTime ADD CONSTRAINT gametime_pk PRIMARY KEY ( player1, player2, gname, start_time);

ALTER TABLE GamesGenres
    ADD CONSTRAINT gamesgenres_games_fk FOREIGN KEY ( gname )
        REFERENCES games ( gname );
ALTER TABLE GamesGenres
    ADD CONSTRAINT gamesgenres_genres_fk FOREIGN KEY ( genre )
        REFERENCES genres ( genre );

ALTER TABLE GamesPlatforms
    ADD CONSTRAINT gamesplatforms_games_fk FOREIGN KEY ( gname )
        REFERENCES games ( gname );
ALTER TABLE GamesPlatforms
    ADD CONSTRAINT gamesplatforms_platforms_fk FOREIGN KEY ( platform )
        REFERENCES platforms ( platform );
        
ALTER TABLE GamesPublishers
    ADD CONSTRAINT gamespublishers_games_fk FOREIGN KEY ( gname )
        REFERENCES games ( gname );
ALTER TABLE GamesPublishers
    ADD CONSTRAINT gamespublishers_publishers_fk FOREIGN KEY ( publisher )
        REFERENCES publishers ( publisher);

ALTER TABLE GameTime
    ADD CONSTRAINT gametime_games_fk FOREIGN KEY ( gname )
        REFERENCES games ( gname );
ALTER TABLE GameTime
    ADD CONSTRAINT gametime_humams_fk FOREIGN KEY ( player1 )
        REFERENCES humans ( human_name );
ALTER TABLE GameTime
    ADD CONSTRAINT gametime_humans_fk FOREIGN KEY ( player2 )
        REFERENCES humans ( human_name );