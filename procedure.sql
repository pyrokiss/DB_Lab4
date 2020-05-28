CREATE OR REPLACE PROCEDURE game_procedure( game_name varchar, genre_name varchar) AS GameStatus number;
                                                                                      GenreStatus number;
                                                                                      data_exception exception;
BEGIN
    SELECT COUNT(*)INTO GameStatus
    FROM GamesGenres
    WHERE genre = genre_name;
    
    SELECT COUNT(*)INTO Genrestatus
    FROM GamesGenres
    WHERE genre = genre_name;
    IF (game_name = 1) AND (genre_name = 1) THEN
    UPDATE GamesGenres
        SET genre = genre_name
        WHERE genre = genre_name;
    ELSE raise data_exception;
    END IF;
exception
    WHEN data_exception THEN
        dbms_output.put_line('Game or Genre not found...');
END;  