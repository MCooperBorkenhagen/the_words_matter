require(purrr)


runs_to_df = function(path, collapse_accuracies = TRUE, num_phon_features = 175){
  
  filenames <- list.files(path = path, pattern = "\\.csv$", full.names = TRUE)
  
  ld = list()
  
  for (filename in filenames) {
    
    seed <- sub(".*seed_([0-9]+).*", "\\1", filename)
    epoch <- sub(".*epoch_([0-9]+).*", "\\1", filename)
    
    df <- read.csv(filename) %>% 
      mutate(seed = seed,
             epoch = as.numeric(epoch))
    
    ld[[filename]] <- df
    
  }
  
  if (collapse_accuracies){
    
    return(list_rbind(ld) %>% 
      mutate(total = rowSums(select(., starts_with("X"))),
             accuracy = total/num_phon_features) %>% 
      select(epoch, word = words, sub_id = seed, condition = train_test, accuracy))
    
  }
  if (!collapse_accuracies){
    
    return(list_rbind(ld))
    
  }
  
  
  

  
  
  
}

brute_force_runs_to_df = function(path){
  
  filenames <- list.files(path = path, pattern = "\\.csv$", full.names = TRUE)
  
  out = list()
  
  for (filename in filenames) {
    
    sample <- sub(".*sample_([0-9]+).*", "\\1", filename)
    
    df <- read.csv(filename) %>% 
      mutate(sample = as.numeric(sample))
    
    out[[filename]] <- df
    
  }
  
    return(list_rbind(out) %>% 
             select(sample, everything()))}
