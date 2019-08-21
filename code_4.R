# Welcome to the finale


# Packages ----------------------------------------------------------------

library(readxl)
library(ggplot2)
library(dplyr)

# Read In -----------------------------------------------------------------
# collect and homogenize data

# get all of the sheets out of 'curveball.xlsx'

?excel_sheets

curveball_file <- "data/curveball.xlsx"

sheets <- excel_sheets(curveball_file)

?read_excel

dat <- read_excel(curveball_file)
dat2 <- read_excel(curveball_file, sheet = 2, col_names = colnames(dat))
dat3 <- read_excel(curveball_file, sheet = 3)

# make sure the column names match

?rename
names(dat3)
names(dat)
dat3 <- rename(dat3, device = device_id, tx_cmpd = tx_compound)

# stack together into one long data frame

?bind_rows
dat <- bind_rows(dat, dat2, dat3)

# See it -----------------------------------------------------------------
# exploratory viz and tables

# make a plot comparing treatments, show all data points

?ggplot

?geom_point

ggplot(dat, aes(tx_cmpd, value)) +
  geom_point(alpha = .25)

# remove outliers

?filter
dat <- filter(dat, value < 300)
dat <- filter(dat, value > 75)

# plot again and add a summary geom onto original

?stat_summary

ggplot(dat, aes(tx_cmpd, value)) +
  geom_point(alpha = .25) +
  stat_summary(geom = "crossbar", fun.data = mean_cl_normal)

# calculate a summary table with: n, average, standard deviation for each group

?group_by

?summarise

dat %>%
  group_by(tx_cmpd) %>% 
  summarise(n = n(),
            avg = mean(value),
            std_dev = sd(value))

# Test it ----------------------------------------------------------------
# Is there a difference between treatment groups

# perform a 2-sample unpaired T-test
?t.test

t.test(value ~ tx_cmpd, data = dat)

# construct a linear model
?lm
mod <- lm(value ~ tx_cmpd, data = dat)

# summarise the model
?summary
summary(mod)

# HSTX style -----------------------------------------------------------
# use model summary functions from our in-house R package

remotes::install_github("hemoshear/assayr2")
library(assayr2)

?make_stats

dat$tx_cmpd <- factor(dat$tx_cmpd, levels = c("vehicle", "compound"))

mod <- lm(value ~ 0 + tx_cmpd, data = dat)

stats <- make_stats(mod)

?geom_stat_crossbar
?geom_stat_label

ggplot(dat, aes(tx_cmpd, value)) +
  geom_point(alpha = .25) +
  geom_stat_crossbar(stats) +
  geom_stat_label(stats) +
  theme_assayr()



