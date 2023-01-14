
INSERT INTO genres(genre_id, name, description)
    VALUES
        (1, 'jazz', 'jazz baby'),
        (2, 'pop', 'sa'),
        (3, 'rock', 'yea'),
        (4, 'genre4', 'just 4rd genre'),
        (5, 'last', 'last genre');

INSERT INTO singers(singer_id, name, age)
    VALUES
        (1, 'singer1', 35),
        (2, 'singer2 x', 36),
        (3, 'singer3 x a', 37),
        (4, 'singer4 x b', 38),
        (5, 'singer5 xxx', 39),
        (6, 'singer6 xbx', 40),
        (7, 'singer7 x x x', 41),
        (8, 'singer8 e e e ', 42);

INSERT INTO albums(album_id, name, year_div)
    VALUES
        (1, 'jazzpop1', '2000-03-21'),
        (2, 'album2', '2000-03-21'),
        (3, 'album3', '2018-02-01'),
        (4, 'album4', '2000-03-02'),
        (5, 'album5', '2019-04-03'),
        (6, 'album6', '2018-05-04'),
        (7, 'album7', '2020-06-10'),
        (8, 'album8', '2020-07-11');

INSERT INTO tracks(track_id, album_id, name, year_div, duration)
    VALUES
        (1, 3, 'song1', '1999-02-05', 1),
        (2, 1, 'song2', '1999-02-06', 1),
        (3, 5, 'song3 my', '1999-02-07', 2),
        (4, 7, 'song4 mymy', '1999-02-08', 3),
        (5, 8, 'song5 me my', '1999-02-09', 4),
        (6, 6, 'song6', '1999-02-01', 51),
        (7, 5, 'song7 x', '1999-02-02', 52),
        (8, 4, 'song8 xv', '1999-02-03', 53),
        (9, 3, 'song9 sdjwo', '1999-02-04', 54),
        (10, 2, 'song10 song 10', '1999-02-05', 60),
        (11, 1, 'song11 emyear', '1999-02-04', 61),
        (12, 1, 'song12 zzz', '1999-02-05', 56),
        (13, 2, 'song13', '1999-02-06', 61),
        (14, 5, 'song14', '1999-02-07', 63),
        (15, 7, 'song15', '1999-02-09', 63);

INSERT INTO track_collections(collection_id, name, creation_year)
    VALUES
        (1, 'coll1', '2017-12-15'),
        (2, 'coll2', '2018-12-16'),
        (3, 'coll3', '2019-12-17'),
        (4, 'coll4', '2020-12-18'),
        (5, 'coll5', '2021-12-19'),
        (6, 'coll6', '2022-12-22'),
        (7, 'coll7', '2023-12-23'),
        (8, 'coll8', '2032-12-24');


INSERT INTO singers_genres_dep(singer_id, genre_id)
    VALUES
        (1, 1),
        (1, 3),
        (2, 5),
        (3, 4),
        (4, 1),
        (5, 3),
        (6, 2),
        (7, 1),
        (8, 3),
        (8, 1);

INSERT INTO singers_albums_dep(singer_id, album_id)
    VALUES
        (1, 8),
        (2, 7),
        (3, 6),
        (4, 5),
        (5, 4),
        (6, 3),
        (7, 2),
        (8, 1),
        (8, 2),
        (8, 3);

INSERT INTO tracks_collection_dep(collection_id, track_id)
    VALUES
        (7, 1),
        (7, 2),
        (7, 3),
        (5, 1),
        (5, 3),
        (5, 5);
