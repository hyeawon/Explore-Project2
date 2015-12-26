## data file (NEI) get a rds data

NEI <- readRDS("summarySCC_PM25.rds")

## Summing up the Emissions by year 

EmissionSum<-aggregate(Emissions~year, NEI, sum)

## Create the barplot 
png("plot1.png", width = 480, height = 480, units = "px", bg = "white")

plot1<-barplot(
   (EmissionSum$Emissions)/10^6,
    names.arg=EmissionSum$year,
    xlab="Year",
    ylab="PM2.5 Emissions (10^6 Tons)", main="Sum of PM2.5  Emissions From US Emissions Data",col = "red")

dev.off()


