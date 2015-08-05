best <- function(state, outcome) {
	## R Programming, assigment 3, P2
	
	## Read outcome data
	measure <- read.csv ("outcome-of-care-measures.csv", colClasses = "character")
	## Check that state and outcome are valid
	arg2 <- c("heart failure", "heart attack", "pneumonia")
	if (!(state %in% measure$State)) {
		stop("invalid state")
	} else if (!(outcome %in% arg2)) {
		stop("invalid outcome")
	} else {
	## Return hospital name in that state with lowest 30-day death rate
		measure <- subset(measure, measure$State == state)
		if (outcome == arg2[1]) {
			hpname <- subset(measure$Hospital.Name, 
			measure$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure 
			== min(measure$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, na.rm = TRUE))
			hpname[order(hpname)][1]
		} else if (outcome == arg2[2]) {
			hpname <- subset(measure$Hospital.Name, 
			measure$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack 
			== min(measure$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, na.rm = TRUE))
			hpname[order(hpname)][1]
		} else if (outcome == arg2[3]) {
			hpname <- subset(measure$Hospital.Name, 
			measure$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
			== min(measure$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, na.rm = TRUE))
			hpname[order(hpname)][1]
		}
	}
	
}