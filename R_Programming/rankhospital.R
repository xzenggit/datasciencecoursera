rankhospital <- function (state, outcome, num = "best") {
	## R Programming, assigment 4, P2
	
	## Read outcome data
	measure <- read.csv ("outcome-of-care-measures.csv", colClasses = "character")
	
	## Check that state and outcome are valid
	arg2 <- c("heart failure", "heart attack", "pneumonia")
	if (!(state %in% measure$State)) {
		stop("invalid state")
	} else if (!(outcome %in% arg2)) {
		stop("invalid outcome")
	} else {
	## Return hospital name in that state with the given rank 30-day death rate
	   ## get the state
	   measure <- subset(measure, measure$State == state)
	   
	   ## if else for the outcome
		if (outcome == arg2[1]) {
			# rank the rate
			hp_rank <- na.omit(measure[order(measure$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, measure$Hospital.Name),])
			# if else for the num
			if (num == "best") {
				hpname <- subset(hp_rank,
				hp_rank$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure 
				== hp_rank$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure[1])
				
				rhp <- hpname$Hospital.Name[1]
			} else if (num == "worst") {
				hpname <- subset(hp_rank,
				hp_rank$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure 
				== tail(hp_rank$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, n=1))
				
				rhp <- tail(hpname$Hospital.Name, n=1)
			} else if (num > length(measure$State)) {
				return(NA)
			} else {
				
				rhp <- hp_rank$Hospital.Name[num]
			}
		} else if (outcome == arg2[2]) {
			hp_rank <- na.omit(measure[order(measure$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, measure$Hospital.Name),])
			if (num == "best") {
				hpname <- subset(hp_rank,
				hp_rank$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack 
				== hp_rank$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack[1])
				
				rhp <- hpname$Hospital.Name[1]
			} else if (num == "worst") {
				hpname <- subset(hp_rank,
				hp_rank$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack 
				== tail(hp_rank$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, n=1))
				
				rhp <- tail(hpname$Hospital.Name, n=1)
			} else if (num > length(measure$State)) {
				return(NA)
			} else {
				
				rhp <- hp_rank$Hospital.Name[num]
			}
		} else if (outcome == arg2[3]) {
			hp_rank <- na.omit(measure[order(measure$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, measure$Hospital.Name),])
			if (num == "best") {
				hpname <- subset(hp_rank,
				hp_rank$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia 
				== hp_rank$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia[1])
				rhp <- hpname$Hospital.Name[1]
			} else if (num == "worst") {
				hpname <- subset(hp_rank,
				hp_rank$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia 
				== tail(hp_rank$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, n=1))
				rhp <- tail(hpname$Hospital.Name, n=1)
			} else if (num > length(measure$State)) {
				return(NA)
			} else {
				rhp <- hp_rank$Hospital.Name[num]
			}
		}
	}
}
