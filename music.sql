-- creating database schema 

DROP SCHEMA IF EXISTS music_player;
create schema music_player;
use music_player;


-- creating database tables 

CREATE TABLE MOVIE (
    Movie_id integer primary key,
    Movie_name char(200) not null,
    Director text,
    Release_date date
);

CREATE TABLE ALBUM (
    Album_id integer primary key,
    Album_name text not null,
    Release_date date
);

CREATE TABLE ARTIST (
    Artist_id integer primary key,
    Artist_name text not null
);

CREATE TABLE SONG_LANGUAGE (
    Language_id integer primary key,
    Language_name text not null
);

CREATE TABLE SONG_GENRE (
    Genre_id integer primary key,
    Genre_name text not null
);

CREATE TABLE SONG (
    Song_id integer primary key,
    Song_name char(200) not null,
    Song_duration float not null,
    Movie_id integer,
    Album_id integer,
    Artist_id integer,
    Language_id integer,
    Genre_id integer,
    foreign key (Movie_id) references MOVIE (Movie_id),
    foreign key (Album_id) references ALBUM (Album_id),
    -- foreign key (Artist_id) references ARTIST (Artist_id),
    foreign key (Language_id) references SONG_LANGUAGE (Language_id),
    foreign key (Genre_id) references SONG_GENRE (Genre_id)
);


CREATE TABLE SUNG_BY (
    Song_id integer,
    foreign key (Song_id) references SONG (Song_id),
    Artist_id integer,
    foreign key (Artist_id) references ARTIST (Artist_id)
);


-- inserting values into tables 

INSERT INTO SONG_LANGUAGE VALUES ('1', 'English');
INSERT INTO SONG_LANGUAGE VALUES ('2', 'Hindi');
INSERT INTO SONG_LANGUAGE VALUES ('3', 'Kannada');


INSERT INTO SONG_GENRE VALUES ('1', 'Electropop');
INSERT INTO SONG_GENRE VALUES ('2', 'Electro house');
INSERT INTO SONG_GENRE VALUES ('3', 'Indian Film Pop');
INSERT INTO SONG_GENRE VALUES ('4', 'Hip-Hop / Rap');
INSERT INTO SONG_GENRE VALUES ('5', 'Pop Rock');


INSERT INTO MOVIE VALUES ('1', 'Frozen', 'Jennifer Lee', '2013-11-29');
INSERT INTO MOVIE VALUES ('2', 'Kuch Kuch Hota Hai', 'Karan Johar', '1998-10-16');
INSERT INTO MOVIE VALUES ('3', 'Upendra', 'Upendra', '1999-10-22');
INSERT INTO MOVIE VALUES ('4', 'Moggina Manasu', 'Shashank', '2008-07-18');
INSERT INTO MOVIE VALUES ('5', 'Singh is Kinng', 'Anees Bazmee', '2008-08-08');
INSERT INTO MOVIE VALUES ('6', 'Ramleela', 'Sanjay Leela Bhansali', '2013-11-15');
INSERT INTO MOVIE VALUES ('7', 'The Mortal Instruments', 'Harald Zwart', '2013-08-21');
INSERT INTO MOVIE VALUES ('8', 'The Angry Birds Movie', 'Clay Kaytis', '2016-05-20');
INSERT INTO MOVIE VALUES ('9', 'Auto Shankar', 'R Rajendra Babu', '2005-09-09');


INSERT INTO ALBUM VALUES ('1', 'Different World', '2018-12-14');
INSERT INTO ALBUM VALUES ('2', 'Confident', '2015-10-15');
INSERT INTO ALBUM VALUES ('3', 'Back 2 Love', '2014-06-09');
INSERT INTO ALBUM VALUES ('4', 'Mac & Devin Go to High School', '2011-12-13');
INSERT INTO ALBUM VALUES ('5', 'Tha Last Meal', '2000-12-19');


INSERT INTO ARTIST VALUES ('1', 'Alan Walker');
INSERT INTO ARTIST VALUES ('2', 'Demi Lovato');
INSERT INTO ARTIST VALUES ('3', 'Rahat Fateh Ali Khan');
INSERT INTO ARTIST VALUES ('4', 'Upendra');
INSERT INTO ARTIST VALUES ('5', 'Udit Narayan');
INSERT INTO ARTIST VALUES ('6', 'Alka Yaagnik');
INSERT INTO ARTIST VALUES ('7', 'Shreya Ghoshal');
INSERT INTO ARTIST VALUES ('8', 'Snoop Dogg');
INSERT INTO ARTIST VALUES ('9', 'S Janaki');


-- trigger to check duplicate song names 
DELIMITER //

CREATE TRIGGER Before_Insert_Song
BEFORE INSERT ON SONG
FOR EACH ROW
BEGIN
  IF (EXISTS(SELECT 1 FROM SONG WHERE Song_name = NEW.Song_name)) THEN
    SIGNAL SQLSTATE VALUE '45000' SET MESSAGE_TEXT = 'INSERT failed due to duplicate name';
  END IF;
END //
DELIMITER ;


INSERT INTO SONG (Song_id, Song_name, Song_duration, Album_id, Language_id, Genre_id) 
VALUES ('1', 'All Falls Down', 3.19, '1', '1', '1');
INSERT INTO SUNG_BY VALUES ('1', '1');

INSERT INTO SONG (Song_id, Song_name, Song_duration, Album_id, Language_id, Genre_id) 
VALUES ('2', 'Faded', 3.30, '1', '1', '2');
INSERT INTO SUNG_BY VALUES ('2', '1');

INSERT INTO SONG (Song_id, Song_name, Song_duration, Album_id, Language_id, Genre_id) 
VALUES ('3', 'Darkside', 3.59, '1', '1', '2');
INSERT INTO SUNG_BY VALUES ('3', '1');

INSERT INTO SONG (Song_id, Song_name, Song_duration, Movie_id, Language_id, Genre_id) 
VALUES ('4', 'Let It Go', 3.45, '1', '1', '1');
INSERT INTO SUNG_BY VALUES ('4', '2');

INSERT INTO SONG (Song_id, Song_name, Song_duration, Movie_id, Language_id, Genre_id) 
VALUES ('5', 'Confident', 3.25, '1', '1', '1');
INSERT INTO SUNG_BY VALUES ('5', '2');

INSERT INTO SONG (Song_id, Song_name, Song_duration, Album_id, Language_id, Genre_id) 
VALUES ('6', 'Zaroori Tha', 5.42, '3', '2', '3');
INSERT INTO SUNG_BY VALUES ('6', '3');

INSERT INTO SONG (Song_id, Song_name, Song_duration, Album_id, Language_id, Genre_id) 
VALUES ('7', 'Rim Jhim', 4.30, '3', '2', '3');
INSERT INTO SUNG_BY VALUES ('7', '3');

INSERT INTO SONG (Song_id, Song_name, Song_duration, Movie_id, Language_id, Genre_id) 
VALUES ('8', 'Uppigintha Ruchi Bere Illa', 3.53, '3', '3', '1');
INSERT INTO SUNG_BY VALUES ('8', '4');

INSERT INTO SONG (Song_id, Song_name, Song_duration, Movie_id, Language_id, Genre_id) 
VALUES ('9', 'MTV Subbalakshmige', 4.30, '3', '3', '1');
INSERT INTO SUNG_BY VALUES ('9', '5');

INSERT INTO SONG (Song_id, Song_name, Song_duration, Movie_id, Language_id, Genre_id) 
VALUES ('10', 'Yeh Ladka Hai Deewana', 6.13, '2', '2', '1');
INSERT INTO SUNG_BY VALUES ('10', '5');

INSERT INTO SONG (Song_id, Song_name, Song_duration, Movie_id, Language_id, Genre_id) 
VALUES ('11', 'Tujhe Yaad Na Meri Aayi', 7.07, '2', '2', '1');
INSERT INTO SUNG_BY VALUES ('11', '6');

INSERT INTO SONG (Song_id, Song_name, Song_duration, Movie_id, Language_id, Genre_id) 
VALUES ('12', 'Saajan Ji Ghar Aaye', 6.55, '2', '2', '1');
INSERT INTO SUNG_BY VALUES ('12', '6');

INSERT INTO SONG (Song_id, Song_name, Song_duration, Movie_id, Language_id, Genre_id) 
VALUES ('13', 'Moggina Manasali', 3.53, '4', '3', '1');
INSERT INTO SUNG_BY VALUES ('13', '7');

INSERT INTO SONG (Song_id, Song_name, Song_duration, Movie_id, Language_id, Genre_id) 
VALUES ('14', 'Teri Ore', 5.38, '5', '2', '1');
INSERT INTO SUNG_BY VALUES ('14', '7');

INSERT INTO SONG (Song_id, Song_name, Song_duration, Album_id, Language_id, Genre_id) 
VALUES ('15', 'French Inhale', 2.55, '4', '1', '4');
INSERT INTO SUNG_BY VALUES ('15', '8');

INSERT INTO SONG (Song_id, Song_name, Song_duration, Movie_id, Language_id, Genre_id) 
VALUES ('16', 'Singh is Kinng', 4.56, '5', '2', '3');
INSERT INTO SUNG_BY VALUES ('16', '8');

INSERT INTO SONG (Song_id, Song_name, Song_duration, Album_id, Language_id, Genre_id) 
VALUES ('17', 'True Lies', 4.01, '5', '1', '4');
INSERT INTO SUNG_BY VALUES ('17', '8');

INSERT INTO SONG (Song_id, Song_name, Song_duration, Movie_id, Language_id, Genre_id) 
VALUES ('18', 'Nagada Sang Dhol', 4.34, '6', '2', '3');
INSERT INTO SUNG_BY VALUES ('18', '7');

INSERT INTO SONG (Song_id, Song_name, Song_duration, Movie_id, Language_id, Genre_id) 
VALUES ('19', 'Heart by Heart', 3.43, '7', '1', '5');
INSERT INTO SUNG_BY VALUES ('19', '2');

INSERT INTO SONG (Song_id, Song_name, Song_duration, Movie_id, Language_id, Genre_id) 
VALUES ('20', 'I Will Survive', 4.56, '8', '1', '5');
INSERT INTO SUNG_BY VALUES ('20', '2');

INSERT INTO SONG (Song_id, Song_name, Song_duration, Movie_id, Language_id, Genre_id) 
VALUES ('21', 'Raja Muddu Raja', 3.55, '9', '3', '3');
INSERT INTO SUNG_BY VALUES ('21', '9');


-- show all songs with movies and albums  
SELECT Song_name, Movie_name, Album_name, Artist_name, Language_name, Genre_name
FROM SONG
LEFT JOIN MOVIE ON SONG.Movie_id = MOVIE.Movie_id
LEFT JOIN ALBUM ON SONG.Album_id = ALBUM.Album_id
LEFT JOIN SUNG_BY ON SONG.Song_id = SUNG_BY.Song_id
LEFT JOIN ARTIST ON SUNG_BY.Artist_id = ARTIST.Artist_id
LEFT JOIN SONG_LANGUAGE ON SONG.Language_id = SONG_LANGUAGE.Language_id
LEFT JOIN SONG_GENRE ON SONG.Genre_id = SONG_GENRE.Genre_id
ORDER BY SONG.Language_id;


-- display songs in ascending order of duration
SELECT Song_name, Song_duration FROM SONG
ORDER BY Song_duration;


-- show english album songs
SELECT Song_id, Song_name, Album_name, Language_name
FROM SONG 
LEFT JOIN ALBUM ON SONG.Album_id = ALBUM.Album_id
LEFT JOIN SONG_LANGUAGE ON SONG.Language_id = SONG_LANGUAGE.Language_id
WHERE SONG_LANGUAGE.Language_name = 'English' AND SONG.Album_id is not null;


-- show songs in movie Kuch Kuch Hota Hai
SELECT Song_id, Song_name, Movie_name 
FROM SONG
LEFT JOIN MOVIE ON SONG.Movie_id = MOVIE.Movie_id
WHERE Movie_name = "Kuch Kuch Hota Hai";


-- correlated query
-- display the various genres
SELECT Genre_id, Genre_name FROM SONG_GENRE
WHERE EXISTS
(SELECT Song_id FROM SONG WHERE SONG.Genre_id = SONG_GENRE.Genre_id);


-- show songs by artist Alan Walker 
SELECT SONG.Song_id, SONG.Song_name, Artist_name 
FROM SONG
LEFT JOIN SUNG_BY ON SUNG_BY.Song_id = SONG.Song_id
LEFT JOIN ARTIST ON SUNG_BY.Artist_id = ARTIST.Artist_id
WHERE Artist_name = "Alan Walker";


-- stored procedure to list movies of a particular language 
DELIMITER //
CREATE PROCEDURE MoviesOfLanguage (IN Lang varchar(30))
BEGIN    
    SELECT Movie_id, Movie_name FROM MOVIE
    WHERE EXISTS
    (SELECT Song_id FROM SONG WHERE Language_id = Lang and SONG.Movie_id = MOVIE.Movie_id);
END //
DELIMITER ;
CALL MoviesOfLanguage ('1'); 


-- show english albums and movies with songs
SELECT Album_name AS English FROM ALBUM
WHERE EXISTS
(SELECT Song_id FROM SONG WHERE Language_id = '1' and SONG.Album_id = ALBUM.Album_id)
UNION ALL
SELECT Movie_name FROM MOVIE
WHERE EXISTS
(SELECT Song_id FROM SONG WHERE Language_id = '1' and SONG.Movie_id = MOVIE.Movie_id);

 
-- aggregate query using group by
-- count number of songs per genre
SELECT Genre_name, COUNT(*) AS Count FROM SONG  
LEFT JOIN SONG_GENRE ON SONG.Genre_id = SONG_GENRE.Genre_id
GROUP BY SONG.Genre_id;


-- aggregate query using group by
-- count number of songs by each artist
SELECT Artist_name, COUNT(*) AS Count FROM SONG  
LEFT JOIN SUNG_BY ON SONG.Song_id = SUNG_BY.Song_id
LEFT JOIN ARTIST ON SUNG_BY.Artist_id = ARTIST.Artist_id
GROUP BY SUNG_BY.Artist_id;


-- show songs other than English by Snoop Dogg
SELECT SONG.Song_id, SONG.Song_name, Artist_name 
FROM SONG
LEFT JOIN SUNG_BY ON SUNG_BY.Song_id = SONG.Song_id
LEFT JOIN ARTIST ON SUNG_BY.Artist_id = ARTIST.Artist_id
LEFT JOIN SONG_LANGUAGE ON SONG.Language_id = SONG_LANGUAGE.Language_id
WHERE ARTIST.Artist_name = "Snoop Dogg" 

EXCEPT

SELECT SONG.Song_id, SONG.Song_name, Artist_name 
FROM SONG
LEFT JOIN SUNG_BY ON SUNG_BY.Song_id = SONG.Song_id
LEFT JOIN ARTIST ON SUNG_BY.Artist_id = ARTIST.Artist_id
LEFT JOIN SONG_LANGUAGE ON SONG.Language_id = SONG_LANGUAGE.Language_id
WHERE ARTIST.Artist_name = "Snoop Dogg" AND SONG_LANGUAGE.Language_name = 'English';


-- show all artists who have sung more than 2 songs
SELECT Artist_name, COUNT(SUNG_BY.Song_id) AS Count
FROM ARTIST
LEFT JOIN SUNG_BY ON SUNG_BY.Artist_id = ARTIST.Artist_id
GROUP BY SUNG_BY.Artist_id
HAVING COUNT(SUNG_BY.Song_id) > 2
ORDER BY Count;

