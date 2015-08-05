corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations
        ## NOTE: Do not round the result!
        
        # get the number of complete obervations
        complete_obs <- complete(directory)
        
        # read the files whose complete_obs > threshold
        id <- subset(complete_obs$id, complete_obs$nobs > threshold)
        if (length(id) > 0) {
        	file_names <- paste(directory,"/",formatC(id, width=3, flag="0"),'.csv', sep="")
        	# read files
        	pollutant_list <- lapply(file_names, read.csv, header=TRUE)
         # calcuale correlation
         coef <- rep(0, length(id))
         for (i in 1:length(id)) {
         		coef[i] <- cor(pollutant_list[[i]][2:3], use="complete.obs")[2]
         }
     	return(coef)
        } else{
        	return(id)
        }
        
}
