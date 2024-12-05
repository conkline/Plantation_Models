# this script takes bukoski's janky csvs and organises into tidy dataframes 

library(tidyverse)

#read in data (assumed you have data stored in a folder called 'inputs' in your r project)
df <- read.csv("inputs/bukoski_params.csv")

# Remove spaces and colons from all columns
df <- df %>%
  mutate(across(everything(), ~ str_replace_all(.x, "[ :]", ""))) %>%  
  pivot_wider(names_from = parametre, values_from = value)

write_csv
