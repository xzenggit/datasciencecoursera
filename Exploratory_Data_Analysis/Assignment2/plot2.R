# Assginment 2 for Explortonary Data Analysis in Coursera
# X. Zeng

# load library and data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI <- subset(NEI, NEI$fips=="24510")
syear <- c(1999, 2002, 2005, 2008)
pm25 <- c(1:4)
for (i in 1:length(year)) {
  pm25[i] <- with(NEI,sum(Emissions[year==syear[i]]))
}

# plot pm2.5
png("plot2.png", width=480, height=480, units="px")
plot(x=syear, y=pm25, xlab="Year", ylab="Total PM2.5", 
     main="PM2.5 for Baltimore City")
dev.off()