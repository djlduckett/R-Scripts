test_rwl <- read.rwl("007.1.00")


core_metadata <- function(file_name, project, location, PI, label){
  
  #Load required libraries
  library(dplR)
  
  rwl_df <- read.rwl(file_name) #read in data
  
  #create data frame for data
  df_name <- data.frame(stringsAsFactors = FALSE)
  #assign(label, df_name)
  
  i = 1
  for (i in 1:ncol(rwl_df)){ #for each sample
    
    #get sample name
    samp_name <- names(rwl_df[i])
    
    #get species name
    species_name <- gsub("\\d", "", samp_name) #replace digits
    
    #get start and end years
    no_na <- which(!is.na(rwl_df[,i]), arr.ind = TRUE) #get indices of rows without NA
    begin <- row.names(rwl_df[no_na[1],]) #get year of first datapoint
    end <- row.names(rwl_df[no_na[length(no_na)],]) #get year of last datapoint
    
    #combine data in single df
    data_list <- list(project, location, PI, samp_name, species_name, begin, end) #combine data in list
    df_name <- rbind(df_name, data_list, stringsAsFactors = FALSE) #add list as row
    
    i = i + 1
  }
  colnames(df_name) <- c("Project", "Location", "PI", "Sample", "Species", "YR_Start", "YR_End") #rename columns
  return(df_name)
}


#get all raw file names to run
dat_files <- Sys.glob("*") #get all file names in directory
rem_files <- dat_files[grep("*.xlsx$", dat_files)] #get file names to remove
dat_files <- dat_files[!dat_files %in% rem_files] #remove those files with .xlsx




core_metadata("007.1.00", "Project", "Location", "PI", "label")


