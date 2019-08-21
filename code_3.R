# Welcome back back

# Packages ----------------------------------------------------------------

install.packages("dplyr")

library(dplyr)

data("starwars")

?starwars # datasets have help pages too

head(starwars) # useful functions to look at data directly
View(starwars)

# Select: -----------------------------------------------------------
# keep/drop/reorder columns

?select

select(starwars, 1:3)
select(starwars, name:mass) # names of columns behave special in dplyr functions

select(starwars, -eye_color, -skin_color, -hair_color)
select(starwars, -(eye_color:hair_color))

?matches # select-helpers are nice if there are patterns of meaning in column names
select(starwars, -matches("color"))

smallwars <- select(starwars, name:mass, birth_year:species)

# Arrange: ------------------------------------------------------

?arrange()

arrange(smallwars)

arrange(smallwars, mass)

arrange(smallwars, mass, desc(height))

ranked_by_mass <- arrange(smallwars, desc(mass))

# Slice -------------------------------------------------------------------
# keep certain rows by index

slice(ranked_by_mass, 2)

slice(ranked_by_mass, 1:6) # aka head()

slice(ranked_by_mass, -1)

slice(ranked_by_mass, -(1:6))

# * Excersises ------------------------------------------------------------

# 1. Make a new data frame sorted by height, tallest first

# 2. Make a new data frame with only the top 10 shortest individuals

# Filter ------------------------------------------------------------------
# keep rows by conditional

?filter

humans <- filter(ranked_by_mass, species == "Human")

filter(humans, is.na(height))
humans <- filter(humans, !is.na(height))

filter(humans, height > 170)

filter(humans, height > 170, mass > 110)
filter(humans, height > 170 & mass > 110) # same as line65

filter(humans, height > 170 | mass > 110)

# Mutate ------------------------------------------------------------------

?mutate

mutate(humans, tallest_height = max(height))

mutate(humans, height_meters = height / 100)

mutate(humans, height = height / 100) # will overwrite existing columns

# Group By ----------------------------------------------------------------

?group_by

mutate(group_by(humans, homeworld), avg_planet_height = mean(height))

# %>% ---------------------------------------------------------------------

group_by(humans, homeworld) %>% 
  mutate(avg_planet_height = mean(height))

humans %>% 
  group_by(homeworld) %>% 
  mutate(avg_planet_height = mean(height))

# Summarise ---------------------------------------------------------------

humans %>% 
  group_by(homeworld) %>% 
  summarise(avg_planet_height = mean(height))

# * Exercises ---------------------------------------------------------------

# 1. Make a new data frame from `smallwars` with only the rows where homeworld is "Tatooine"

# 2. Add a new column with the average `birth_year` to `smallwars` (read ?mean to figure out what to do about NAs)

# 3. Calculate the average weight by species for the entire `starwars` data set

