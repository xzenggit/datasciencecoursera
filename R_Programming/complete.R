complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
                    
		 # get file names with directory                                                                               
    	 file_names <- paste(directory,"/",formatC(id, width=3, flag="0"),'.csv', sep="")

		 # read file contents to a list
		 pollutant_list <- lapply(file_names, read.csv, header=TRUE)

		 # get complete cases
		 complete_cases <- lapply(pollutant_list, complete.cases)
		 
		 # get number of complete case
		 nobs <- sapply(complete_cases, sum)
		 
		 # combine all info together
		 as.data.frame(t(rbind(id,nobs)))
}
