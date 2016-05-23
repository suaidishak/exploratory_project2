greps1<-unique(grep("coal", SCC$EI.Sector, ignore.case=TRUE, value=TRUE))  
#Isolate instances of "coal" in SCC column EI.Sector

data1<-subset(SCC, EI.Sector %in% greps1)    #Subset SCC by coal labels
coal<-subset(NEI, SCC %in% data1$SCC)        #Subset NEI by data1 overlaps
png(filename = "plot4.png",width = 480, height = 480)
ggplot(data=coal, aes(x=year, y=Emissions, fill = type)) + 
        geom_bar(stat="identity", position=position_dodge()) + 
        ggtitle("U.S. Coal Combustion-Related Emissions: 1999-2008")

dev.off()