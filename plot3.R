library(ggplot2)
png(filename = "plot3.png")
ggplot(data=baltimore, aes(x=year, y=Emissions, fill=type)) +    
        geom_bar(stat="identity", position="dodge") +
        ggtitle("Baltimore, MD Emission by Type: 1999-2008")
dev.off()