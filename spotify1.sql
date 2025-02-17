use Spotify

select * from spotify

--EDA
Select count(*) from spotify

select count(distinct artist) from spotify

select count(distinct album) from spotify

select distinct album_type from spotify

select max(duration_min) from spotify

select min(duration_min) from spotify

select * from spotify 
where duration_min=0

delete from spotify
where duration_min=0

select * from spotify 
where duration_min=0

select distinct channel from spotify

select distinct most_playedon from spotify

--Data Analysis Easy Category

--retrieve the names of all tracks that have moren than 1 billion streams.

select track from spotify
where stream >= 1000000000


--list all albums along with their respectives artists.

select album,artist
from spotify

--get the total number of comments for tracks where licensed =true.


select sum(comments)as total_number from 
spotify where licensed =1

--find all the tracks that belong to the album type single

select * from spotify
where Album_type='single'

--count the total number of tracks by each artists

select count(track)as Count_of_track ,artist from spotify
group by Artist

-----------------------------------------------------

----Medium Level

-----------------------------------------------------

--calculate the average  danceability of tracks in each album

select AVG(danceability)as Avg_Danceability,album
from spotify
group by Album

--find the top 5 tracks with the highest energy values.

select top 5 track,max(energy) as highest_energy from spotify
group by track
order by highest_energy desc

select top 5 track,energy from(select top 5 track,energy from spotify order by Energy desc ) as highenergy order by Energy asc

--list all the tracks along with their views and likes where official video is true 

select track,sum(views)as total_views,sum(likes) as total_likes
from spotify 
where official_video =1
group by track
order by total_likes desc


----for each album ,calculate the total views of all associated tracks

select track,album,sum(views) as total_views from spotify
group by track,album 
order by total_views desc

--retrieve the track names that have been streamed on spotify more than youtubes

select * from
(select track,
coalesce(sum(case when most_playedon='Youtube' then stream end),0) as Streamed_on_youtube,
coalesce(sum(case when most_playedon='Spotify' then stream end),0) as Streamed_on_spotify
from spotify 
group by track
)as t1

where Streamed_on_spotify> Streamed_on_youtube
and 
Streamed_on_youtube <> 0

----other method

select track,
coalesce(sum(case when most_playedon='Youtube' then stream end),0) as Streamed_on_youtube,
coalesce(sum(case when most_playedon='Spotify' then stream end),0) as Streamed_on_spotify
from spotify
group by track
having coalesce(sum(case when most_playedon='Spotify' then stream end),0)>coalesce(sum(case when most_playedon='Youtube' then stream end),0)
and COALESCE(SUM(CASE WHEN most_playedon = 'Youtube' THEN stream END), 0) <> 0;
-------------------------------------------------------------------------
---Advance Problems
-------------------------------------------------------------------------

--find the top 3 most viewed tracks for each artist using window function

select *from (select *,DENSE_RANK() over (order by views desc) as dense_function from spotify)as ranktranks
where dense_function=3

with ranking_artist
as
(select track,artist,sum(views) as total_views,
DENSE_RANK()over(partition by artist order by sum(views) desc) as ranktrack 
from spotify 
group by track,artist
)
select * from ranking_artist
where ranktrack<=3 
order by artist,total_views desc

---write a query to find tracks where the liveness is above the average


select track,liveness
from spotify
where Liveness >(select AVG(liveness) from spotify) 
 
---use a with clause to calculate the difference between the highest and lowest energy values for track in each albums

with cte
as(
select album,max(energy) as highest_energy
,min(energy) as lowest_energy
from spotify
group by album
)

select album,highest_energy-lowest_energy as energy_difference
from cte
order by energy_difference desc

-- find tracks whee the energy to liveness ratiois greater than 1.2

select track,energy,liveness,(energy/liveness)as energy_liveness_ratio
from spotify
where  Liveness<>0 and (Energy/Liveness) >1.2


---other way using coalesce


select track,energy,liveness,(energy/coalesce(nullif(liveness,0),1)) as energy_liveness_ratio
from spotify
where (Energy/coalesce(nullif(liveness,0),1))>1.2


--calculate the cumulative sum of likes for tracks ordered by the numer of views ,using window function

SELECT 
    track,
    artist,
    views,
    likes,
    SUM(likes) OVER (ORDER BY views DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_likes
FROM spotify
ORDER BY views DESC;
