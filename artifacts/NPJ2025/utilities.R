require(car)


leveneTestPairwise =  function(data, y, x) {
  levels <- unique(data[[x]])
  results <- list()
  
  for (i in 1:(length(levels) - 1)) {
    for (j in (i + 1):length(levels)) {
      level1 <- levels[i]
      level2 <- levels[j]
      
      subset_data <- data[data[[x]] %in% c(level1, level2), ]
      test_result <- leveneTest(as.formula(paste(y, "~", x)), data = subset_data)
      
      results[[paste(level1, "vs", level2)]] <- test_result
    }
  }
  
  return(results)
}
