# Assginment 2 for Explortonary Data Analysis in Coursera
# X. Zeng

# load library and data
library(ggplot2)
library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI <- merge(NEI, SCC, by="SCC")

coal <- grepl("coal", NEI$Short.Name, ignore.case=TRUE)
sub_NEI <- NEI[coal,]

syear <- c(1999, 2002, 2005, 2008)
sub_NEI <- subset(sub_NEI, sub_NEI$year %in% syear)

sub_NEI <- aggregate(Emissions~year, sub_NEI, sum)

# plot pm2.5
png("plot4.png", width=480, height=480, units="px")
f <- ggplot(sub_NEI, aes(year, Emissions))
f <- f + geom_point() + xlab ("Year") + ylab ("Total PM2.5 Emissions")+
  ggtitle("PM2.5 related to coals")
print(f)
dev.off()