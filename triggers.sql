CREATE OR REPLACE TRIGGER delete_genre 
    INSTEAD OF DELETE
        ON GameView 
    FOR EACH ROW
BEGIN
    IF game_delete THEN
        INSERT INTO GamesGanres(gname, genre)
        VALUES(:old.gname, 'DELETED');
    END IF;
    EXCEPTION
        WHEN OTHERS THEN
            IF ( substr(sqlerrm, 0, 9) = 'ORA-00001' ) THEN
                dbms_output.put_line('This game is already deleted! (has a "DELETED" category)');
            END IF;
END;