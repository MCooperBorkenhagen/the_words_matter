

require(tidyverse)

dolch = read_csv("../special_words/data/all_lists_v2.csv") %>% 
  filter(source == "dolch") %>% 
  pull(word)


fry = read_csv("../special_words/data/all_lists_v2.csv") %>% 
  filter(source == "fry") %>% 
  pull(word)


length(intersect(fry, dolch))/ length(unique(c(dolch, fry)))
