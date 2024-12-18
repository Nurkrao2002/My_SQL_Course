use inclass;
select * from wine;

-- --------------------------------------------------------------
# Dataset Used: wine.csv
-- --------------------------------------------------------------

SELECT * FROM wine;

# Q1. Rank the winery according to the quality of the wine (points).-- Should use dense rank
select  *, dense_rank() over (order by points desc) as rank_points
from  wine;

# Q2. Give a dense rank to the wine varities on the basis of the price.
select  *, dense_rank() over (partition by variety order by price desc) as rank_points
from  wine;

# Q3. Use aggregate window functions to find the average of points for each row within its partition (country). 
-- -- Also arrange the result in the descending order by country.
select * , avg(points) over (partition by country )
from wine
order by country desc ;


-----------------------------------------------------------------
# Dataset Used: students.csv
-- --------------------------------------------------------------

# Q4. Rank the students on the basis of their marks subjectwise.
select * from students;
select *,rank() over ( partition by subject order by marks desc)
from students;
# Q5. Provide the new roll numbers to the students on the basis of their names alphabetically.
select *, row_number() over (order by name) as new_roll_numbers
from students;
# Q6. Use the aggregate window functions to display the sum of marks in each row within its partition (Subject).
select *, sum(marks) over(partition by subject) as agg
from students;

# Q7. Display the records from the students table where partition should be done 
-- on subjects and use sum as a window function on marks, 
-- -- arrange the rows in unbounded preceding manner.
select * ,sum(marks)  over(partition by subject rows unbounded preceding) from students;

# Q8. Find the dense rank of the students on the basis of their marks subjectwise. Store the result in a new table 'Students_Ranked'
create table student_ranked
as
select *,dense_rank() over (partition by subject order by marks)
from students;
select * from student_ranked;

-----------------------------------------------------------------
# Dataset Used: website_stats.csv and web.csv
-----------------------------------------------------------------
select * from website_stats;
select * from  web;
# Q9. Show day, number of users and the number of users the next day (for all days when the website was used)
select day,no_users, lead(no_users) over (partition by website_id) as web_part
from website_stats
order by day;


# Q10. Display the difference in ad_clicks between the current day and the next day for the website 'Olympus
select website_id,ad_clicks - lead(ad_clicks) over (partition by name)
from website_stats ws join web w
on ws.website_id = w.id
where name = 'olympus';
select * from website_stats;

# Q11. Write a query that displays the statistics for website_id = 3 such that for each row, show the day, 
# the number of users and the smallest number of users ever.
select * from website_stats;
select * from web;
select website_id, day, no_users, (select min(no_users) from website_stats)
from website_stats
where website_id = 3;

# Q12. Write a query that displays name of the website and it's launch date. 
#The query should also display the date of recently launched website in the third column.
select * from website_stats;
select * from web;
select name,launch_date,last_value(launch_date)over (order by name  ROWS BETWEEN UNBOUNDED preceding AND UNBOUNDED following)
 from web;




-----------------------------------------------------------------
# Dataset Used: play_store.csv and sale.csv
-----------------------------------------------------------------
select * from play_store;
select * from sale;
# Q13. Write a query thats orders games in the play store into three buckets as per editor ratings received  
SELECT *,NTILE(3) OVER (partition by editor_rating order by editor_rating) as bucket FROM play_store;

# Q14. Write a query that displays the name of the game, the price, the sale date and the 4th column should display 
# the sales consecutive number i.e. ranking of game as per the sale took place, 
#so that the latest game sold gets number 1. Order the result by editor's rating of the game
select ps.name, s.game_id,s.price,s.date,rank() over (partition by s.game_id order by editor_rating ) as rank_detail
from play_store ps join sale s on ps.id = s.id;

# Q15. Write a query to display games which were both recently released and recently updated. For each game, show name, 
#date of release and last update date, as well as their rank
#Hint: use ROW_NUMBER(), sort by release date and then by update date, both in the descending order
select * from play_store;
select * from sale;
select name,released,
row_number()over(order by released desc),
updated,row_number()over(order by updated desc) from play_store;




-----------------------------------------------------------------
# Dataset Used: movies.csv, customers.csv, ratings.csv, rent.csv
-----------------------------------------------------------------
select * from ratings;
select * from rent;
select * from customers_1;
select * from movies;
# Q16. Write a query that displays basic movie informations as well as the previous rating provided by customer for that same movie 
# make sure that the list is sorted by the id of the reviews.
select m.id, m. title, m.release_year,r.rating
from movies m join ratings r
on m.id = r.id
order by id ;

# Q17. For each movie, show the following information: title, genre, average user rating for that movie 
# and its rank in the respective genre based on that average rating in descending order (so that the best movies will be shown first).
select * from movies;
select * from ratings;
select title,genre,r.avg_rating, rank() over(partition by genre order by avg_rating desc)as ranking from movies m
join
(
select movie_id,avg(rating)as avg_rating
from ratings
group by movie_id
) r
on m.id =r.movie_id;




# Q18. For each rental date, show the rental_date, the sum of payment amounts (column name payment_amounts) from rent 
#on that day, the sum of payment_amounts on the previous day and the difference between these two values.
select *,prev_payment-payment
from
(select rental_date, payment, lag(payment) over (order by rental_Date) as prev_payment
from (
select str_to_Date(rental_date,'%d-%m-%YYYY')as  rental_date,sum(payment_amount) as payment  from rent
group by rental_date
) a
)b;
