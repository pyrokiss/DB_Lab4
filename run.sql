DECLARE
BEGIN
    game_procedure('Hollow Knight', 'Action');
    game_procedure('1', 'aaaa');
    game_procedure('aaaa', '1');
END;

/

DELETE FROM gameview WHERE gname = 'Undertale';
DELETE FROM gameview WHERE gname = 'Hollow Knight'