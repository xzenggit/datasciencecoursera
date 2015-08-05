rankall <- function (outcome, num = "best") {
	## R Programming, assigment 4, P3
	
	## Read data
	measure <- read.csv ("outcome-of-care-measures.csv", colClasses = "character")
	
	## get states
	state <- unique(measure$State)
	hospital <- lapply(state,rankhospital, outcome, num)
	
	tmp <- as.data.frame(cbind(hospital,state))
	rownames(tmp) <- state
	return(tmp)
}
