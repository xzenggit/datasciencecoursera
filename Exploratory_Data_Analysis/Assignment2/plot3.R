# Assginment 2 for Explortonary Data Analysis in Coursera
# X. Zeng

# load library and data
library(ggplot2)
library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI <- subset(NEI, NEI$fips=="24510")
syear <- c(1999, 2002, 2005, 2008)
NEI <- subset(NEI, NEI$year %in% syear)

new_NEI <- aggregate(Emissions~year+type, NEI, sum)

# plot pm2.5
png("plot3.png", width=480, height=480, units="px")
f <- ggplot(new_NEI, aes(year, Emissions, color=type))
f <- f + geom_point() + xlab ("Year") + ylab ("Total PM2.5 Emissions")+
  ggtitle("PM2.5 of different types")
dev.off()