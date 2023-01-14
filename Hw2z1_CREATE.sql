
drop table if exists tracks_collection_dep, singers_genres_dep, singers_albums_dep, singers, albums, genres, tracks, track_collections;


CREATE table if NOT exists singers (
    singer_id SERIAL PRIMARY KEY,
    name varchar(100),
    age integer
);

CREATE table if NOT exists genres (
    genre_id SERIAL PRIMARY KEY,
    name varchar(100) UNIQUE NOT NULL,
    description text
);

CREATE table if NOT exists albums (
    album_id SERIAL PRIMARY KEY,
    name varchar(100),
    year_div date
);

CREATE table if NOT exists tracks (
    track_id SERIAL PRIMARY KEY,
    album_id INTEGER REFERENCES albums(album_id),
    name varchar(100),
    year_div date,
    duration INTEGER
);

CREATE TABLE if NOT EXISTS track_collections (
    collection_id SERIAL PRIMARY KEY,
    name text,
    creation_year date
);

--- depency tables

CREATE table if NOT exists singers_genres_dep (
    singer_id integer NOT NULL REFERENCES singers(singer_id),
    genre_id integer NOT NULL REFERENCES genres(genre_id),
    CONSTRAINT sg_pk PRIMARY KEY (singer_id, genre_id)
);

CREATE table if NOT exists singers_albums_dep (
    singer_id integer NOT NULL REFERENCES singers(singer_id),
    album_id integer NOT NULL REFERENCES albums(album_id),
    CONSTRAINT sa_pk PRIMARY KEY (singer_id, album_id)
);

CREATE TABLE IF NOT EXISTS tracks_collection_dep (
    collection_id INTEGER NOT NULL REFERENCES track_collections(collection_id),
    track_id INTEGER NOT NULL REFERENCES tracks(track_id),
    CONSTRAINT tc_pk PRIMARY KEY (collection_id, track_id)
);


