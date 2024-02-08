# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
Movie.destroy_all
Actor.destroy_all
Studio.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.


# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.

# Studios
new_studio = Studio.new
new_studio["Name"] = "Warner Bros."
new_studio.save
warnerbros= Studio.find_by({"Name" => "Warner Bros."})
all_studios = Studio.all
#puts all_studios.inspect

# Movies

new_movie = Movie.new
new_movie["Name"] = "Batman Begins"
new_movie["Year_Released"] = "2005"
new_movie["Rating"] = "PG-13"
new_movie["studio_id"] = warnerbros["id"] 
new_movie.save
batman_begins = Movie.find_by({"Name" => "Batman Begins" })

new_movie = Movie.new
new_movie["Name"] = "The Dark Knight"
new_movie["Year_Released"] = "2008"
new_movie["Rating"] = "PG-13"
new_movie["studio_id"] = warnerbros["id"] 
new_movie.save
dark_knight = Movie.find_by({"Name" => "The Dark Knight" })

new_movie = Movie.new
new_movie["Name"] = "The Dark Knight Rises"
new_movie["Year_Released"] = "2012"
new_movie["Rating"] = "PG-13"
new_movie["studio_id"] = warnerbros["id"] 
new_movie.save
dark_knight_rises = Movie.find_by({"Name" => "The Dark Knight Rises"})

all_movies = Movie.all
#puts all_movies.inspect

# Actors

new_actor = Actor.new
new_actor["Name"] = "Christian Bale"
new_actor.save
christian_bale = Actor.find_by({"Name" => "Christian Bale" })

new_actor = Actor.new
new_actor["Name"] = "Michael Caine"
new_actor.save
michael_cane = Actor.find_by({"Name" => "Michael Caine" })

new_actor = Actor.new
new_actor["Name"] = "Liam Neeson"
new_actor.save
liam_neeson = Actor.find_by({"Name" => "Liam Neeson" })

new_actor = Actor.new
new_actor["Name"] = "Katie Holmes"
new_actor.save
katie_holmes = Actor.find_by({"Name" => "Katie Holmes" })

new_actor = Actor.new
new_actor["Name"] = "Gary Oldman"
new_actor.save
gary_oldman = Actor.find_by({"Name" => "Gary Oldman" })

new_actor = Actor.new
new_actor["Name"] = "Heath Ledger"
new_actor.save
heath_ledger = Actor.find_by({"Name" => "Heath Ledger" })

new_actor = Actor.new
new_actor["Name"] = "Aaron Eckhart"
new_actor.save
aaron_eckhart = Actor.find_by({"Name" => "Aaron Eckhart" })

new_actor = Actor.new
new_actor["Name"] = "Maggie Gyllenhaal"
new_actor.save
maggie_gyllenhaal = Actor.find_by({"Name" => "Maggie Gyllenhaal" })

new_actor = Actor.new
new_actor["Name"] = "Tom Hardy"
new_actor.save
tom_hardy = Actor.find_by({"Name" => "Tom Hardy"})

new_actor = Actor.new
new_actor["Name"] = "Joseph Gordon-Levitt"
new_actor.save
joseph_gordon_levitt = Actor.find_by({"Name" => "Joseph Gordon-Levitt" })


new_actor = Actor.new
new_actor["Name"] = "Anne Hathaway"
new_actor.save
anne_hathaway = Actor.find_by({"Name" => "Anne Hathaway" })

all_actors = Actor.all
puts all_actors.inspect

# Roles
new_role = Role.new
new_role["movie_id"] = batman_begins["id"]
new_role["actor_id"] = christian_bale["id"]
new_role["Character Name"] = "Bruce Wayne"
new_role.save

new_role = Role.new
new_role["movie_id"] = batman_begins["id"]
new_role["actor_id"] = michael_cane["id"]
new_role["Character Name"] = "Alfred"
new_role.save

new_role = Role.new
new_role["movie_id"] = batman_begins["id"]
new_role["actor_id"] = liam_neeson["id"]
new_role["Character Name"] = "Ra's Al Ghul"
new_role.save

new_role = Role.new
new_role["movie_id"] = batman_begins["id"]
new_role["actor_id"] = katie_holmes["id"]
new_role["Character Name"] = "Rachel Dawes"
new_role.save

new_role = Role.new
new_role["movie_id"] = batman_begins["id"]
new_role["actor_id"] = gary_oldman["id"]
new_role["Character Name"] = "Comissioner Gordon"
new_role.save

new_role = Role.new
new_role["movie_id"] =  dark_knight["id"]
new_role["actor_id"] = christian_bale["id"]
new_role["Character Name"] = "Bruce Wayne"
new_role.save

new_role = Role.new
new_role["movie_id"] =  dark_knight["id"]
new_role["actor_id"] = heath_ledger["id"]
new_role["Character Name"] = "Joker"
new_role.save

new_role = Role.new
new_role["movie_id"] = dark_knight["id"]
new_role["actor_id"] = aaron_eckhart["id"]
new_role["Character Name"] = "Harvey Dent"
new_role.save

new_role = Role.new
new_role["movie_id"] = dark_knight["id"]
new_role["actor_id"] = michael_cane["id"]
new_role["Character Name"] = "Alfred"
new_role.save

new_role = Role.new
new_role["movie_id"] = dark_knight["id"]
new_role["actor_id"] = maggie_gyllenhaal["id"]
new_role["Character Name"] = "Rachel Dawes"
new_role.save

new_role = Role.new
new_role["movie_id"] = dark_knight_rises["id"]
new_role["actor_id"] = christian_bale["id"]
new_role["Character Name"] = "Bruce Wayne"
new_role.save

new_role = Role.new
new_role["movie_id"] = dark_knight_rises["id"]
new_role["actor_id"] = gary_oldman["id"]
new_role["Character Name"] = "Commissioner Gordon"
new_role.save

new_role = Role.new
new_role["movie_id"] = dark_knight_rises["id"]
new_role["actor_id"] = tom_hardy["id"]
new_role["Character Name"] = "Bane"
new_role.save

new_role = Role.new
new_role["movie_id"] = dark_knight_rises["id"]
new_role["actor_id"] = joseph_gordon_levitt["id"]
new_role["Character Name"] = "John Blake"
new_role.save

new_role = Role.new
new_role["movie_id"] = dark_knight_rises["id"]
new_role["actor_id"] = anne_hathaway["id"]
new_role["Character Name"] = "Selina Kyle"
new_role.save

all_roles = Role.all
puts all_roles.inspect

# Check
puts all_movies.count
puts all_actors.count
puts all_studios.count
puts all_roles.count

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
for movie in all_movies
    movie_title = movie["Name"]
    year_released = movie["Year_Released"]
    rating = movie["Rating"]
    studio = Studio.find_by({"id" => movie["studio_id"]})
    studio_name= studio["Name"]
    puts "#{movie_title} |  #{year_released} | #{rating} | #{studio_name}"
end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
for role in all_roles
    movie = Movie.find_by({"id" => role["movie_id"]})
    #puts movie.inspect
    movie_title = movie["Name"]
    actor = Actor.find_by({"id" =>role["actor_id"] })
    actor_name = actor["Name"]
    #puts actor.inspect
    character_name = role["Character Name"]
    #puts role.inspect
    puts "#{movie_title}| #{actor_name} |#{character_name} "
end
