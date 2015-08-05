pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files

    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the    
    ## mean; either "sulfate" or "nitrate". 
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    
    ## NOTE: Do not round the result!
    
    # get file names with directory
    file_names <- paste(directory,"/",formatC(id, width=3, flag="0"),'.csv', sep="")
		
	# read file contents to a list
	pollutant_list <- lapply(file_names, read.csv, header=TRUE)
	
	# convert list to data frame
	my_data_frame <- do.call(rbind, pollutant_list)
	
	# cacluate the mean of required column without NA
	mean(my_data_frame[,pollutant], na.rm=TRUE)

}
