# Welcome back

# Packages ----------------------------------------------------------------

install.packages("readxl") # get functions from the internet

library(readxl) # load the functions, so you can use them

# Excel data ----------------------------------------------------------

?read_excel # always skim help page first

assay_file <-"data/assay.xlsx" # if you use it more than once, make a variable

read_excel(path = assay_file)
read_excel(assay_file) # argument assumed to be in order

assay <- read_excel(assay_file)

class(assay) # classes in herit from the right tbl_df>>>tbl>>>data.frame(OG)

colnames(assay) # names are important bc thats you refer to things

read_excel(assay_file, col_names = FALSE) # default is TRUE

# * By rows ----------------------------------------------------------------

read_excel(assay_file, range = cell_rows(c(9, 10, 11))) # first row is colnames...
read_excel(assay_file, range = cell_rows(9:11))

batch1 <- read_excel(assay_file, range = cell_rows(1:9))

batch2 <- read_excel(assay_file,
                     range = cell_rows(c(10, NA)), # 10th row until end
                     col_names = colnames(batch1))

# * By sheet --------------------------------------------------------------

?excel_sheets

excel_sheets(assay_file)

read_excel(assay_file, sheet = 2) # reference by index
read_excel(assay_file, 2) # no need for names if order matches ?read_excel

read_excel(assay_file, "Sheet2") # can reference by name too

# ** Excercises --------------------------------------------------------------

# 1. Use the function `cell_cols()` to select only the second and third column
#    from `assay_file`'s first sheet

# 2. Read in the data from batch three and batch four separately and save
#    as a new variables

# Plots- ----------------------------------------------------------

install.packages("ggplot2") # get more functions from the internet

library(ggplot2)

# * Base layer ---------------------------------------------------------------

?ggplot()

ggplot(assay)

ggplot(assay, aes(x = treatment, y = value)) # sets up the coordinate reference system

ggplot(assay, aes(treatment, value)) # always X,Y

# * Geom layers -------------------------------------------------------------------

?geom_point

ggplot(assay, aes(treatment, value)) +
  geom_point()

ggplot(assay, aes(treatment, value)) +
  geom_point(size = 5) # changes all points

ggplot(assay, aes(treatment, value)) +
  geom_point(size = 5, alpha = .5)

ggplot(assay, aes(treatment, value)) +
  geom_point(size = 5, alpha = .5, color = "red")

ggplot(assay, aes(treatment, value)) +
  geom_point(aes(color = batch), # changes points based on column
             size = 5, alpha = .5)

class(assay$batch) # classes matter for generating scale/legend

assay$batch <- as.character(assay$batch) # characters are always discrete

ggplot(assay, aes(treatment, value)) +
  geom_point(aes(color = batch), size = 5, alpha = .5)

class(assay$treatment) # character are always in alphabetical order

assay$treatment <- factor(x = assay$treatment, levels = c("vehicle", "compound"))
# the levels of a factor set a specific order

ggplot(assay, aes(treatment, value)) +
  geom_point(aes(color = batch), size = 5, alpha = .5)

# * Stat layers -------------------------------------------------------------------

?stat_summary

ggplot(assay, aes(treatment, value)) +
  stat_summary()

ggplot(assay, aes(treatment, value)) +
  stat_summary(geom = "crossbar") # change out for another 3-value geom

ggplot(assay, aes(treatment, value)) +
  stat_summary(geom = "crossbar",
               fun.data = "mean_cl_normal") # another 3-value summary function

ggplot(assay, aes(treatment, value)) +
  geom_boxplot() # this is a special stat_layer; not all stat_layers are called stat_something

# * Labelling --------------------------------------------------------------------

?labs()

ggplot(assay, aes(treatment, value)) +
  geom_boxplot() +
  labs(title = "Accurate Assay", y = "pg / mL")

# ** Excercises -----------------------------------------------------------

# 1. Create a plot that combines the summary readults from `mean_cl_normal()` 
#    and all of the individual data points. All points should be visable

# 2. Create a boxplots colored by `batch` where the x-axis is `treatment` and
#    the y-axis is `value`

# 3. Use the labs() call from above to add a plot title and new y-axis title, but
#    remove the x-axis title.


