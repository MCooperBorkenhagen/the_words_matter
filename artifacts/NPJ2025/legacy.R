

require(car)

get_Fs = function(l){
  
  Fs = c()
  
  for (test in names(l)){
    
    Fs = c(Fs, l[[test]][[2]][[1]])
    
  }
  
  
  
  
}

test_of_unequal_variances = model_summaries %>% 
  filter(metric == "mse" & condition == "holdout") %>% 
  mutate(hidden_units = factor(hidden_units)) %>% 
  leveneTestPairwise("value", "hidden_units")

tibble(Test = names(test_of_unequal_variances),
)

model_summaries %>% 
  filter(metric == "mse" & condition == "holdout") %>% 
  mutate(hidden_units = factor(hidden_units)) %>% 
  leveneTest(value_z ~ hidden_units, data = .)

#leveneTest(mse ~ factor(hidden), data = twm)



