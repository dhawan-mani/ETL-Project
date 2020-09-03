/*How many movies did Humphrey Bogart act in?*/
select count(title) from movies
where actors LIKE '%Humphrey Bogart%';


/*50 Highest Rated Movies with more than 2000 votes.*/
select m.title, m.director, max(r.weighted_average_vote )
from movies as m 
inner join ratings as r on m.imdb_title_id = r.imdb_title_id
where r.total_votes >= 2000
group by m.title, m.director
order by max(r.weighted_average_vote) desc limit 50;
/*check this out*/


select movie.title, movie.genre, ratings.weighted_average_vote, movie.votes /* which movie had the highest rating regardless of the genre. */
from movie join ratings on(movie.imdb_title_id = ratings.imdb_title_id)
where movie.votes > 20000 Order by ratings.weighted_average_vote desc, movie.votes desc;



/*Most active writer*/
select writer, count(writer) 
from movies
group by writer
order by count(writer) desc limit 1;

/*top 10 years with most movies made*/
select year_published, count(year_published)
from movies
group by year_published
order by count(year_published) desc limit 10;

/*acted and directed by same person*/
select title, director, actors
from movies
where actors like director;

/*acted and written by same person*/
select title, writer, actors
from movies
where actors like writer;

/*acted, written, directed by same person*/
select title, director, writer, actors
from movies
where director like writer and director like actors;

/*both genders, age 30 ratings for movie genre */
select movie_demo.genre, avg(ratings.allgenders_30age_avg_vote), count(ratings.allgenders_30age_avg_vote)
from ratings inner join movie_demo on ratings.imdb_title_id=movie_demo.imdb_title_id
where movie_demo.votes >= 600
group by movie_demo.genre
order by count(ratings.allgenders_30age_avg_vote)desc, avg(ratings.allgenders_30age_avg_vote) desc;


