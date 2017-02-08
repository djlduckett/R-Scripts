test_rwl <- read.rwl("007.1.00")



core_years <- function(rwl_df){
  
  #Load required libraries
  library(dplR)
  
  yr_range <- list()
  i = 1
  for (i in 1:ncol(rwl_df)){
    no_na <- which(!is.na(rwl_df[,i]), arr.ind = TRUE) #get indices of rows without NA
    begin <- row.names(rwl_df[no_na[1],]) #get year of first datapoint
    end <- row.names(rwl_df[length(no_na),]) #get year of last datapoint
    
    range_list <- list()
    range_list <- append(range_list, begin, after = length(range_list))
    range_list <- append(range_list, end, after = length(range_list))
    yr_range <- append(yr_range, range_list, after = length(yr_range))
    
    i = i + 1
  }
  return(yr_range)
}

core_years(test_rwl)


