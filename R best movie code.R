#My First program in R
download.file("https://ibm.box.com/shared/static/n5ay5qadfe7e1nnsv5s01oe1x62mq51j.csv", destfile="movies-db.csv")
#Read the CSV File , set headers
movies_data <- read.csv("movies-db.csv", header=TRUE, sep=",")
#view data 6 rows
head(movies_data)
#get recent populat movies 
recent_pop_movies=subset(movies_data,average_rating > 8 & year > 2010)
#get recent populat movie names
recent_pop_movies=recent_pop_movies[,1]
# Function, loop , condition 
# get the  est /popular movie in a genre
best_movie_in_genre=function(genre_name){
  movies_genre=subset(movies_data,genre==genre_name & average_rating > 0)
  print(movies_genre)
  best_rating = 1
  for (i in 1:nrow(movies_genre)){
    print(i)
    rating = movies_genre[i,5]
        if (rating > best_rating) {
        best_movie=movies_genre[i,1] 
        best_rating = rating
    }
    
  }
    return(best_movie)
}
#test the function
movie=best_movie_in_genre('Crime')

