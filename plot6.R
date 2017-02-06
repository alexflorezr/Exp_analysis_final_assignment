# go to the working directory
wd <- "/Users/afr/Desktop/PhD/CCW/Courses/Coursera/Data_Science_spc/Exploratory_data/Exp_analysis_final_assignment"
# set workiing directory
setwd(wd)
# read the input files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# Plot number 5
SCC_vehicles <- SCC[grep('Vehicles', SCC$EI.Sector),]
SCC_veh <- as.vector.factor(SCC_vehicles$SCC)
Bal_LA <- subset(NEI, is.element(NEI$fips, c("24510","06037")))
Bal_LA_veh <- subset(Bal_LA, is.element(Bal_LA$SCC, SCC_veh))
Bal_LA_veh$fips <- as.factor(Bal_LA_veh$fips)
levels(Bal_LA_veh$fips) <- c("Los Angeles", "Baltimore")
png("plot6.png")
ggplot(Bal_LA_veh , aes(x = factor(year), y=Emissions)) +
        stat_summary(fun.y =sum, geom="bar") + 
        facet_wrap(~fips) +
        ylab("Emissions (tons)") + xlab("years")
dev.off()