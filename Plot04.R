# Load the NEI & SCC data frames.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset coal combustion related NEI data
combustionTable <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalTable <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
CombustionandCoal <- (combustionTable & coalTable)
combustionSCC <- SCC[CombustionandCoal,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]

png("plot4.png",width=480,height=480,units="px",bg="transparent")

library(ggplot2)
gggraph<-ggplot(combustionNEI,aes(factor(year),Emissions/10^5)) +
  geom_bar(stat="identity",fill="orange",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))

print(gggraph)

dev.off()
