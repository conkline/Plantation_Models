# this script takes bukoski's janky csvs and organises into tidy dataframes 

library(tidyverse)

#read in data (assumed you have data stored in a folder called 'inputs' in your r project)
df <- read.csv("inputs/bukoski_params.csv")

df <- df %>%
  # Remove spaces and colons from all columns
  mutate(across(everything(), ~ str_replace_all(.x, "[ :]", ""))) %>%  
  pivot_wider(names_from = parametre, values_from = value) %>%  
  #make all data numeric
  mutate(across(everything(), ~ as.numeric(str_remove(.x, "[^0-9.]+"))))

#save clean df output 
write_csv(df, "inputs/cleandf_params.csv")
