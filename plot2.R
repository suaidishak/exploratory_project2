# This script is assuming the NEI data frame is in memory from previous data reads
#Subset Baltimore area
baltimore<-subset(NEI, NEI$fips==24510)
#Sum emissions per year
totalBaltimore<-tapply(baltimore$Emissions, INDEX=baltimore$year, sum)
png(filename = "plot2.png",width = 480, height = 480)
barplot(totalBaltimore, main="Total Emissions in Baltimore, MD by Year", xlab="Year", ylab="Emissions")
dev.off()