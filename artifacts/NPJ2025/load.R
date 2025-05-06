words = read_csv('../../data/kidwords/kidwords.csv', col_names = c('word'))

# model summaries
model_summaries = read_csv('data/model_summaries.csv') %>% 
  pivot_longer(cols = accuracy_train:mse_holdout, names_to = "variable", values_to = "value") %>% 
  mutate(condition = case_when(str_detect(variable, "train") ~ "train",
                               str_detect(variable, "test") ~ "test",
                               str_detect(variable, "holdout") ~ "holdout"),
         metric = str_split(variable, "_", simplify = T)[,1]) %>% 
  filter(condition != "test") %>% 
  filter((hidden_units %in% c(20, 30, 40))) %>%
  dplyr::select(-variable)


model_summaries = model_summaries %>% 
  left_join(model_summaries %>% 
              group_by(condition, metric) %>% 
              summarise(M = mean(value),
                        SD = sd(value))) %>% 
  mutate(value_z = (value-M)/SD)