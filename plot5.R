# Let categorised the vehicle first

greps2<-unique(grep("mobile", SCC$EI.Sector, ignore.case=TRUE, value=TRUE))  

#only need greps2[1:4]
#Subset SCC by Vehicle Type
Gas_Heavy<-subset(SCC, EI.Sector %in% greps2[1]) 
Gas_Light<-subset(SCC, EI.Sector %in% greps2[2])
Diesel_Light<-subset(SCC, EI.Sector %in% greps2[3])
Diesel_Heavy<-subset(SCC, EI.Sector %in% greps2[4])

#Subset Baltimore by SCC retaining vehicle type 
gasHeavy<-subset(baltimore, SCC %in% Gas_Heavy$SCC)  
gasLight<-subset(baltimore, SCC %in% Gas_Light$SCC)
dieselLight<-subset(baltimore, SCC %in% Diesel_Light$SCC)
dieselHeavy<-subset(baltimore, SCC %in% Diesel_Heavy$SCC)

#Add vehicle type column to NEI 
cars1<-data.frame(gasHeavy, vehicle="Gas - Heavy Duty")     
cars2<-data.frame(gasLight, vehicle="Gas - Light Duty")
cars3<-data.frame(dieselLight, vehicle="Diesel - Light Duty")
cars4<-data.frame(dieselHeavy, vehicle="Diesel - Heavy Duty")
cars<-rbind(cars1, cars2, cars3, cars4) 

png(filename = "plot5.png",width = 480, height = 480)
ggplot(data=cars, aes(x=year, y=Emissions, fill=vehicle)) +
        geom_bar(stat="identity", position=position_dodge()) +
        ggtitle("Motor Vehicle-Related Emissions in Baltimore, MD: 1999-2008")
dev.off()