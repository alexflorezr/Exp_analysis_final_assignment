# go to the working directory
wd <- "/Users/afr/Desktop/PhD/CCW/Courses/Coursera/Data_Science_spc/Exploratory_data/Exp_analysis_final_assignment"
# set workiing directory
setwd(wd)
# read the input files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# Plot number 2
baltimore <- subset(NEI, NEI$fips == "24510")
balt_emission_year <- aggregate(baltimore$Emissions, by=list(baltimore$year), FUN=sum)
png("plot2.png")
par(mar=c(5,5,5,5))
barplot(height=balt_emission_year$x, names.arg = balt_emission_year$Group.1, border = F,
        xaxs="i", yaxs="i")
mtext("Total emissions of PM2.5 in Baltimore, MA", side = 3, line=3, cex = 1.5)
mtext("Year", side = 1, line=3, cex = 1.3)
mtext("PM2.5 emissions (Tons)", side = 2, line=3, cex = 1.3)
dev.off()