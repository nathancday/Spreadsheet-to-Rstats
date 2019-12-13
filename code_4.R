# Welcome to the finale


# Packages ----------------------------------------------------------------

library(readxl)
library(ggplot2)
library(dplyr)

# Read In -----------------------------------------------------------------
# collect and homogenize data from
curveball_file <- "data/curveball.xlsx"

# get all of the sheets out of curveball
?excel_sheets

# read each sheet in separately as 'dat1', 'dat2' and 'dat3'
?read_excel

# sync the columns so they all match
?names
?rename

# stack the sheets together into one long data frame
?bind_rows

# See it -----------------------------------------------------------------
# exploratory viz and tables

# make a plot comparing treatments, show all data points
?ggplot
?geom_point

# remove two outlier rows/observations
?filter

# plot again and add a summary crossbar geom onto original
?stat_summary

# calculate a summary table with: n, average, standard deviation for each group
?group_by
?summarise

# Test it ----------------------------------------------------------------
# How confident are we in that difference?

# perform a 2-sample T-test (unpaired) using the formula argument
?t.test

# construct a linear model called 'mod' using the formula argument again
?lm

# explore 'mod' for insights
?summary

