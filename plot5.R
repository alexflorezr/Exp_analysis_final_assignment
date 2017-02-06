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
baltimore <- subset(NEI, NEI$fips == "24510")
bal_veh <- subset(baltimore , is.element(baltimore$SCC, SCC_veh))
bal_veh_year <- aggregate(bal_veh$Emissions, by=list(bal_veh$year), FUN=sum)
png("plot5.png")
par(mar=c(5,5,5,5))
barplot(height=bal_veh_year$x, names.arg = bal_veh_year$Group.1, border = F,
        xaxs="i", yaxs="i")
mtext("Vehicles sources emissions in Baltimore", side = 3, line=3, cex = 1.5)
mtext("Year", side = 1, line=3, cex = 1.3)
mtext("PM2.5 emissions (Tons)", side = 2, line=3, cex = 1.3)
dev.off()