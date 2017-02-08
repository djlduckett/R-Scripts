test_rwl <- read.rwl("007.1.00")



core_metadata <- function(project, location, PI, label){
  
  #Load required libraries
  library(dplR)
  
  #get all raw file names to run
  dat_files <- Sys.glob("*") #get all file names in directory
  rem_files <- dat_files[grep("*.xlsx$", dat_files)] #get file names to remove
  dat_files <- dat_files[!dat_files %in% rem_files] #remove those files with .xlsx
  
  #create df for all data
  df_final <- data.frame(stringsAsFactors = FALSE)
  #assign(label, df_name)
  
  f = 1
  for (y in 1:length(dat_files)){
    
    rwl_df <- read.rwl(dat_files[f]) #read in data
    
    i = 1
    for (z in 1:ncol(rwl_df)){ #for each sample
      
      #get sample name
      samp_name <- names(rwl_df[i])
      
      #get species name
      species_name <- gsub("\\d", "", samp_name) #replace digits
      
      #get start and end years
      no_na <- which(!is.na(rwl_df[,i]), arr.ind = TRUE) #get indices of rows without NA
      begin <- row.names(rwl_df)[no_na[1]] #get year of first datapoint
      end <- row.names(rwl_df)[no_na[length(no_na)]] #get year of last datapoint
      
      #combine data in single df
      data_list <- list(project, location, PI, samp_name, species_name, begin, end) #combine data in list
      df_final <- rbind(df_final, data_list, stringsAsFactors = FALSE) #add list as row
      
      i = i + 1
    }
    
    f = f + 1
  }
  
  colnames(df_final) <- c("Project", "Location", "PI", "Sample", "Species", "YR_Start", "YR_End") #rename columns
  return(df_final)
}


#get all raw file names to run
dat_files <- Sys.glob("*") #get all file names in directory
rem_files <- dat_files[grep("*.xlsx$", dat_files)] #get file names to remove
dat_files <- dat_files[!dat_files %in% rem_files] #remove those files with .xlsx

#create df for all data
df_final <- data.frame(stringsAsFactors = FALSE)




coredf_test <- core_metadata("INAI", "Ryerson", "Bob Fahey", "label")


