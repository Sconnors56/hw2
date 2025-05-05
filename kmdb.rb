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
# - Note rubric explanation for appropriate use of external resources.

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
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

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
# 

# Generate models and tables, according to the domain model.
# TODO!

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

# Prints a header for the movies output
# Removed code so it wouldn't duplicate

# Query the movies data and loop through the results to display the movies output.
# TODO!

# Prints a header for the cast output
# Removed code so it wouldn't duplicate

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!

# FINAL SUBMISSION BELOW

# Delete existing data
Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

Rails.logger.info "------------------------"
Rails.logger.info "----- FRESH START! -----"
Rails.logger.info "------------------------"

# Generate models and tables (run these commands separately in terminal)
# rails generate model Studio name:string
# rails generate model Movie title:string year_released:integer rated:string studio:references
# rails generate model Actor name:string
# rails generate model Role movie:references actor:references character_name:string
# rails db:migrate

# Insert data into the database
warner_bros = Studio.new
warner_bros["name"] = "Warner Bros."
warner_bros.save

batman_begins = Movie.new
dark_knight = Movie.new
dark_knight_rises = Movie.new

batman_begins["title"] = "Batman Begins"
batman_begins["year_released"] = 2005
batman_begins["rated"] = "PG-13"
batman_begins["studio_id"] = warner_bros["id"]
batman_begins.save

dark_knight["title"] = "The Dark Knight"
dark_knight["year_released"] = 2008
dark_knight["rated"] = "PG-13"
dark_knight["studio_id"] = warner_bros["id"]
dark_knight.save

dark_knight_rises["title"] = "The Dark Knight Rises"
dark_knight_rises["year_released"] = 2012
dark_knight_rises["rated"] = "PG-13"
dark_knight_rises["studio_id"] = warner_bros["id"]
dark_knight_rises.save

actors = [
  {"name" => "Christian Bale"},
  {"name" => "Michael Caine"},
  {"name" => "Liam Neeson"},
  {"name" => "Katie Holmes"},
  {"name" => "Gary Oldman"},
  {"name" => "Heath Ledger"},
  {"name" => "Aaron Eckhart"},
  {"name" => "Maggie Gyllenhaal"},
  {"name" => "Tom Hardy"},
  {"name" => "Joseph Gordon-Levitt"},
  {"name" => "Anne Hathaway"}
]

actor_records = {}

actors.each do |actor|
  actor_record = Actor.new
  actor_record["name"] = actor["name"]
  actor_record.save
  actor_records[actor["name"]] = actor_record
end

roles_data = [
  { movie: batman_begins, actor: actor_records["Christian Bale"], character_name: "Bruce Wayne" },
  { movie: batman_begins, actor: actor_records["Michael Caine"], character_name: "Alfred" },
  { movie: batman_begins, actor: actor_records["Liam Neeson"], character_name: "Ra's Al Ghul" },
  { movie: batman_begins, actor: actor_records["Katie Holmes"], character_name: "Rachel Dawes" },
  { movie: batman_begins, actor: actor_records["Gary Oldman"], character_name: "Commissioner Gordon" },

  { movie: dark_knight, actor: actor_records["Christian Bale"], character_name: "Bruce Wayne" },
  { movie: dark_knight, actor: actor_records["Heath Ledger"], character_name: "Joker" },
  { movie: dark_knight, actor: actor_records["Aaron Eckhart"], character_name: "Harvey Dent" },
  { movie: dark_knight, actor: actor_records["Michael Caine"], character_name: "Alfred" },
  { movie: dark_knight, actor: actor_records["Maggie Gyllenhaal"], character_name: "Rachel Dawes" },

  { movie: dark_knight_rises, actor: actor_records["Christian Bale"], character_name: "Bruce Wayne" },
  { movie: dark_knight_rises, actor: actor_records["Gary Oldman"], character_name: "Commissioner Gordon" },
  { movie: dark_knight_rises, actor: actor_records["Tom Hardy"], character_name: "Bane" },
  { movie: dark_knight_rises, actor: actor_records["Joseph Gordon-Levitt"], character_name: "John Blake" },
  { movie: dark_knight_rises, actor: actor_records["Anne Hathaway"], character_name: "Selina Kyle" }
]

roles_data.each do |role|
  role_record = Role.new
  role_record["movie_id"] = role[:movie]["id"]
  role_record["actor_id"] = role[:actor]["id"]
  role_record["character_name"] = role[:character_name]
  role_record.save
end

# Output movies
puts "Movies"
puts "======"
puts ""

movies = Movie.all
movies.each do |movie|
  studio = Studio.find_by({ "id" => movie["studio_id"] })
  puts "#{movie["title"].ljust(24)} #{movie["year_released"].to_s.ljust(14)} #{movie["rated"].ljust(6)} #{studio["name"]}"
end

# Output top cast
puts ""
puts "Top Cast"
puts "========"
puts ""

roles = Role.all
roles.each do |role|
  movie = Movie.find_by({ "id" => role["movie_id"] })
  actor = Actor.find_by({ "id" => role["actor_id"] })
  puts "#{movie["title"].ljust(24)} #{actor["name"].ljust(20)} #{role["character_name"]}"
end

# Run rails runner kmdb.rb to execute this code