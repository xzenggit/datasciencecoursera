# This is for Statistical Inference Projcet2

# load libraries and data
library(ggplot2)
library(datasets)
head(ToothGrowth, 3)

# Exploratory data analysis
qplot(x=supp, y=len, color=dose, data=ToothGrowth)

# provide summary
summary(ToothGrowth)

# statistical inference: effect of VS and OJ
t.test(ToothGrowth$len~ToothGrowth$supp,
       paired=FALSE, var.equal=FALSE, conf.level=0.95)

# statistical inference: effect of dose
oneway.test(ToothGrowth$len~ToothGrowth$dose, var.equal = FALSE)


