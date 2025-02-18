# Spotify-Project-Using-SQL

## Project Overview:
The Spotify SQL Analysis project aims to explore and analyze key performance metrics of Spotify tracks, albums, and artists using SQL. The analysis is structured across three levels of complexity: Easy, Medium, and Advanced. Through this project, we will derive insights into streaming patterns, track popularity, and listener engagement metrics. The insights gathered will help in understanding music trends, artist performance, and factors contributing to track popularity.

## Objectives:

### Data Exploration and Basic Insights (Easy Level)

-Identify tracks with more than 1 billion streams.

-List all albums along with their respective artists.

-Calculate the total number of comments for tracks where licensing is true.

-Filter tracks that belong to the album type "Single."

-Count the total number of tracks produced by each artist.

### Intermediate Analysis for Deeper Insights (Medium Level)

-Calculate the average danceability of tracks in each album.

-Identify the top 5 tracks with the highest energy values.

-Retrieve tracks with views and likes where the official video is available.

-Calculate the total views of tracks for each album.

-Identify tracks streamed more on Spotify than on YouTube.

### Advanced Analytical Insights (Advanced Level)

-Use window functions to find the top 3 most-viewed tracks for each artist.

-Identify tracks where the liveness attribute exceeds the average.

-Apply a WITH clause to calculate the difference between the highest and lowest energy values within each album.

-Determine tracks with an energy-to-liveness ratio greater than 1.2.

-Calculate the cumulative sum of likes for tracks based on the order of views using window functions.

## DataSource

Dataset used for this project was taken from kaggle and Spotify Dataset:[Click Here](https://github.com/Zaki1203/Spotify-Project-Using-SQL/blob/main/spotify.xlsx)

## Tools and Techniques
Excel:

Data cleaning: Handling missing values, removing duplicates, and standardizing formats.

Data preparation: Structuring the dataset for SQL integration.

SQL Server:

Basic Queries: SELECT, WHERE, GROUP BY, ORDER BY.

Aggregation: COUNT, SUM, AVG, MAX, MIN.

Filtering: Using WHERE and HAVING clauses for conditional queries.

Advanced Techniques: Window functions (dense rank, RANK, OVER), subqueries, and WITH clauses for complex analysis

Conditional Expression:Nullif,Coalesce


## Key insights

1. Tracks like *Feel Good*, *Californication*, *Under the Bridge*, *In Da Club*, and others have surpassed 1 billion streams.  
2. There are *497,023,475* total comments on tracks where the license status is set to true.  
3. Most artists have released around *10 tracks*.  
4. *Gentle Piano Melodies*, *Rain and Thunderstorm, Pt. 3*, *Rain and Thunderstorm, Pt. 33*, *Rain and Thunderstorm, Pt. 4*, and *Rain and Thunderstorm, Pt. 6* are among the tracks with high energy levels.  
5. Albums and tracks with significant views include *VIDA* with *16,159,296,273* views, *See You Again (feat. Charlie Puth)* with *11,547,595,554* views, and *Peace Is The Mission (Extended)* with *9,974,504,694* views.  
6. *Old Town Road - Remix*, *Silence*, *Photograph*, *Stay*, and *Perfect Strangers* are among the tracks with more streams on Spotify compared to YouTube.
