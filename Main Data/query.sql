Select count (movie_demographic.genre), movie_demographic.genre, sum (movie_demographic.votes), ratings.weighted_average_vote, movie_demographic.Year_Published		
From movie_demographic join ratings on (movie_demographic.imdb_title_id = ratings.imdb_title_id)
where ratings.weighted_average_vote > 9 
Group by movie_demographic.genre Order By ratings.weighted_average_vote desc;

select movie.title, movie.genre, ratings.weighted_average_vote, movie.votes /* which movie had the highest rating regardless of the genre. */
from movie join ratings on(movie.imdb_title_id = ratings.imdb_title_id)
where movie.votes > 20000 Order by ratings.weighted_average_vote desc, movie.votes desc;

select movie_demographic.title,movie_demographic.genre,avg(ratings.weighted_average_vote) from 
movie_demographic inner join ratings 
on (movie_demographic.imdb_title_id = ratings.imdb_title_id)
where movie_demographic.Year_Published='2018'
group by(movie_demographic.genre,movie_demographic.title)

order by avg(ratings.weighted_average_vote) desc;/* which age and gender group likes what genre of movies based off of ratings. */

select movie_demographic.genre,avg(ratings.allgenders_18age_avg_vote),count(ratings.allgenders_18age_avg_vote)
from ratings inner join movie_demographic
on (movie_demographic.imdb_title_id = ratings.imdb_title_id)
group by (ratings.allgenders_18age_avg_vote,movie_demographic.genre)
order by count(ratings.allgenders_18age_avg_vote) desc;

select distinct(movie_demographic.genre),count(ratings.allgenders_30age_avg_vote),ratings.allgenders_30age_avg_vote
from ratings inner join movie_demographic
on (movie_demographic.imdb_title_id = ratings.imdb_title_id)
where(movie_demographic.Year_Published='2010' )
group by (ratings.allgenders_30age_avg_vote,(movie_demographic.genre)
order by (count(ratings.allgenders_30age_avg_vote)),ratings.allgenders_30age_avg_vote desc;



select count(title) 
from movie
where actors like '%Humphrey Bogart%';

select /* which directors, writers, actors participated in the highest number of the movies. */
from 
where