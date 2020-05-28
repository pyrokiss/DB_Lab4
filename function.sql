-- CREATE VIEW GamesPublishersViews --
CREATE OR REPLACE VIEW GamesPublishersViews AS
SELECT Games.gname, GamesPublishers.release_date
FROM Games
LEFT JOIN GamesPublishers
ON Games.gname = GamesPublishers.gname
ORDER BY Games.gname;

-- CREATE OBJECT --
CREATE OR REPLACE TYPE GenrePlatformRow IS OBJECT
    (platform VARCHAR2(50 CHAR), genre VARCHAR2(50 CHAR), publisher VARCHAR2(50 CHAR));

/
CREATE OR REPLACE TYPE GenrePlatform IS
TABLE OF GenrePlatformRow;
/

-- CREATE FUNCTION Get_GenrePlatform --
CREATE OR REPLACE FUNCTION Get_GenrePlatform (
    par_platform Platforms.platform % TYPE,
    par_publisher Publishers.publisher % TYPE
)
RETURN GenrePlatform PIPELINED
AS CURSOR GenrePlatformCursor IS
        SELECT platform_platform as Platforms, publisher_publisher as Publishers, genre_genre AS Genres
        FROM GamesPublishersViews
            LEFT JOIN GamesPlatforms
                ON GamesPublishersViews.gname = GamesPlatforms.gname
            LEFT JOIN GamesGenres
                ON GamesPublishersViews.gname = GamesGenres.gname
        GROUP BY pltform_platform, genre_genre, publisher_publisher
        HAVING platform_platform = par_platform
        AND publisher_publisher = par_publisher
        AND genre_genre != 'Delete';
BEGIN
    FOR ROW IN GenrePlatformCursor
    LOOP
       PIPE ROW ( GenrePlatformRow( row.Platforms, row.Genres, row.Publishers));
    END LOOP;
END;
/