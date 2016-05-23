
# This script will work if the 2 RDS files exist in the current working directory
# National emissions data
NEI <- readRDS("summarySCC_PM25.rds")
# Source Classification Code
SCC <- readRDS("Source_Classification_Code.rds")

#Sum emissions per year
totalNEI<-tapply(NEI$Emissions, INDEX=NEI$year, sum)
# basic plot histogram
png(filename = "plot1.png",width = 480, height = 480)
barplot(totalNEI, main = "Total Emissions by Year", xlab="Year", ylab="Emissions")
dev.off()