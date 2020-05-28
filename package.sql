CREATE OR REPLACE PACKAGE PackageQuery
AS
    FUNCTION Get_GenrePlatform (
    par_platform Platforms.platform % TYPE,
    par_publisher Publishers.publisher % TYPE
    )
    RETURN GenrePlatform PIPELINED;

    PROCEDURE game_procedure( game_name varchar, genre_name varchar);
END PackageQuery;

CREATE OR REPLACE PACKAGE BODY
PackageQuery
AS
    FUNCTION Get_GenrePlatform (
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


    PROCEDURE game_procedure( game_name varchar, genre_name varchar) AS GameStatus number;
                                                                                      GenreStatus number;
                                                                                      data_exception exception;
    BEGIN
        SELECT COUNT(*) INTO GameStatus
        FROM GamesGenres
        WHERE genre = genre_name;
    
        SELECT COUNT(*) INTO Genrestatus
        FROM GamesGenres
        WHERE gname = game_name;
        IF (GameStatus = 1) AND (GenreStatus = 1) THEN
        UPDATE GamesGenres
            SET genre = genre_name
            WHERE genre = genre_name;
        ELSE raise data_exception;
        END IF;
    exception
        WHEN data_exception THEN
            dbms_output.put_line('Game or Genre not found...');
    END;  

END PackageQuery;