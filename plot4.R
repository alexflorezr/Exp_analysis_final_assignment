# go to the working directory
wd <- "/Users/afr/Desktop/PhD/CCW/Courses/Coursera/Data_Science_spc/Exploratory_data/Exp_analysis_final_assignment"
# set workiing directory
setwd(wd)
# read the input files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# Plot number 4
SCC_combCoal <- SCC[grep('Comb.*Coal', SCC$EI.Sector, value = T),]
SCC_CC <- as.vector.factor(SCC_combCoal$SCC)
USA_combCoal <- subset(NEI, is.element(NEI$SCC, SCC_CC))
USA_combCoal_year <- aggregate(USA_combCoal$Emissions, by=list(USA_combCoal$year), FUN=sum)
png("plot4.png")
par(mar=c(5,5,5,5))
barplot(height=USA_combCoal_year$x, names.arg = USA_combCoal_year$Group.1, border = F,
        xaxs="i", yaxs="i")
mtext("Coal combustion-related sources emissions in the U.S.A", side = 3, line=3, cex = 1.5)
mtext("Year", side = 1, line=3, cex = 1.3)
mtext("PM2.5 emissions (Tons)", side = 2, line=3, cex = 1.3)
dev.off()
