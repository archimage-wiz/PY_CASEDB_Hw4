


--количество исполнителей в каждом жанре;
SELECT genre_id, COUNT(*) FROM singers_genres_dep
GROUP BY genre_id;

--количество треков, вошедших в альбомы 2019-2020 годов;
SELECT a.album_id, a.name, a.year_div, count(t.track_id) as TrackCount FROM albums AS a
JOIN tracks AS t ON t.album_id = a.album_id
WHERE date_part('year', a.year_div) BETWEEN 2019 AND 2020
GROUP BY a.name, a.album_id;

--средняя продолжительность треков по каждому альбому;
SELECT a.album_id, a.name, avg(t.duration) as AvgTrackDuration FROM albums as a
JOIN tracks as t ON t.album_id = a.album_id
GROUP BY a.album_id;

--все исполнители, которые не выпустили альбомы в 2020 году;
SELECT sa.singer_id AS NotIn2020, s.name, a.album_id, a.year_div, count(*) FROM singers_albums_dep as sa
JOIN singers as s ON s.singer_id = sa.singer_id
JOIN albums as a ON sa.album_id = a.album_id
WHERE date_part('year', a.year_div) <> 2020
GROUP BY a.album_id, sa.singer_id, s.name;

--названия сборников, в которых присутствует конкретный исполнитель (выберите сами);
SELECT tcd.collection_id, tcd.track_id, tc.name, t.name, s.name FROM tracks_collection_dep as tcd
JOIN track_collections as tc ON tc.collection_id = tcd.collection_id
JOIN tracks as t ON t.track_id = tcd.track_id
JOIN singers_albums_dep as sad ON sad.album_id = t.album_id
JOIN singers as s ON s.singer_id = sad.singer_id
WHERE s.singer_id = 4;

--название альбомов, в которых присутствуют исполнители более 1 жанра;
SELECT tmp.singer_id, a.name FROM (
    SELECT sgd.singer_id, COUNT(singer_id) as cnt FROM singers_genres_dep as sgd
    GROUP BY sgd.singer_id
    HAVING COUNT(singer_id) > 1
    ) as tmp
JOIN singers_albums_dep as sad ON sad.singer_id = tmp.singer_id
JOIN albums as a ON a.album_id = sad.album_id;

--наименование треков, которые не входят в сборники;
SELECT t.name FROM (
    SELECT track_id FROM tracks
    EXCEPT SELECT track_id FROM tracks_collection_dep
) as tmp
JOIN tracks as t on t.track_id = tmp.track_id;

--исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);
SELECT tmp.album_id, s.name FROM (
    SELECT album_id, duration FROM tracks as t
    WHERE duration = (
        SELECT MIN(duration) FROM tracks
    )
) as tmp
JOIN singers_albums_dep as sad ON sad.album_id = tmp.album_id
JOIN singers as s ON s.singer_id = sad.singer_id;

--название альбомов, содержащих наименьшее количество треков.
SELECT tmp2.album_id, a.name FROM (
    SELECT t.album_id, count(*) as cnt2 FROM tracks as t
    GROUP BY t.album_id
) as tmp2
JOIN albums as a ON a.album_id = tmp2.album_id
WHERE cnt2 = (
    SELECT MIN(cnt) FROM (
        SELECT t.album_id, count(*) as cnt FROM tracks as t
        GROUP BY t.album_id
    ) as tmp
)
GROUP BY a.name;

SELECT t.album_id, a.name, count(*) as cnt2 FROM tracks as t
JOIN albums as a ON a.album_id = t.album_id
GROUP BY t.album_id, a.name
HAVING count(*) = (
    SELECT MIN(cnt) FROM (
        SELECT t.album_id, count(*) as cnt FROM tracks as t
        GROUP BY t.album_id
    ) as tmp 
);

