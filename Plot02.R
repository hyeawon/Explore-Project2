## data file (NEI) get a rds data

NEI <- readRDS("summarySCC_PM25.rds")

## grap Baltimore's data only

BaltimoreNEI <- NEI[NEI$fips=="24510",]

## Summing up the Emissions by year 

BaltimoreEmissionSum<-aggregate(Emissions~year, BaltimoreNEI, sum)

## read column names to cnames
png("plot2.png", width = 480, height = 480, units = "px", bg = "white")

barplot(BaltimoreEmissionSum$Emissions, names.arg=BaltimoreEmissionSum$year, xlab="Year", ylab="PM2.5 Emissions(Tons)", main="Sum of PM2.5 Emissions From Baltimore Emissions Data",col = "red")
dev.off()
