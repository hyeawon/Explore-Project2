# Load the NEI & SCC data frames.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset coal combustion related NEI data
vehicles <- grepl("vehicle", SCC$SCC.Level.Two,ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]
BaltimoreVehiclesNEI <- vehiclesNEI[vehiclesNEI$fips==24510,]
png("plot5.png",width=480,height=480,units="px",bg="transparent")

library(ggplot2)

gggraph<-ggplot(BaltimoreVehiclesNEI,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="navy",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Vehicle Source Emissions in Baltimore Data 1999-2008"))

print(gggraph)

dev.off()
