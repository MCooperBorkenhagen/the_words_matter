words = read_csv('../../data/kidwords/kidwords.csv', col_names = c('word'))

# model summaries
model_summaries = read_csv('data/model_summaries.csv') %>% 
  pivot_longer(cols = accuracy_train:mse_holdout, names_to = "variable", values_to = "value") %>% 
  mutate(condition = case_when(str_detect(variable, "train") ~ "train",
                               str_detect(variable, "test") ~ "test",
                               str_detect(variable, "holdout") ~ "holdout"),
         metric = str_split(variable, "_", simplify = T)[,1]) %>% 
  filter(condition != "test") %>% 
  dplyr::select(-variable)

SD_of_generalization_set = model_summaries %>% 
  filter(condition == "holdout") %>% 
  filter(metric == "mse") %>% 
  summarise(SD = sd(value)) %>% 
  pull(SD)

M_of_generalization_set = model_summaries %>% 
  filter(condition == "holdout") %>% 
  filter(metric == "mse") %>% 
  summarise(M = mean(value)) %>% 
  pull(M)  


model_summaries = model_summaries %>% 
  mutate(value_z = (value-M_of_generalization_set)/SD_of_generalization_set)
